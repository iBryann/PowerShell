#Lugar para armazenar os tipos

$global:__ClassTable__ = @{}

#Função que cria a instancia
function global:__new_instance ([scriptblock]$definition) {
    #Gerador de mensagens de erro
    function elementSyntax($msg) {
        throw "Class element syntax: $msg"
    }

    #Palavra-chave note
    function note ([string]$name, $value) {
        #Levanta um erro caso não seja informado o nome da note
        if (!$name) {
            elementSyntax "note name <value>"
        }

        #Caso a sintaxe esteja correta, cria um novo menbro note
        New-Object System.Management.Automation.PSNoteProperty $name, $value
    }

    #Palavra-chave method
    function method ([string]$name, [scriptblock]$script) {
        if (!$name) {
            elementSyntax "method name <value>"
        }

        New-Object System.Management.Automation.PSScriptMethod $name, $script
    }

    #Criando um objeto vazio para ser preenchido de membros
    $object = new-object System.Management.Automation.PSObject

    #Executa o código passado no bloco de script e salva todos os membros
    #gerados por essa execução na matriz members
    $members = &$definition

    #Passa todos os membros gerados para a variável object
    #e gera erros caso algum membro seja inválido
    foreach ($member in $members) {
        if (!$member) {
            write-error "bad member $member"
        }
        else {
            $object.psobject.members.add($member)
        }
    }

    #Retorna nosso objecto pronto e com todos os métodos e propriedades
    $object
}

#Função usada para efetivamente criar nossa instancia e passar os código
function Global:CustomClass {
    #Rewcebe o nome da nova classe e o código
    param ([string]$type, [scriptblock]$definition)

    #Caso o nome esteja em uso, gera um erro
    if ($global:__ClassTable__[$type]) {
        throw "type $type is already defined"
    }

    #Cria um objeto descartável apenas para testar se tudo vai bem e poder
    #capturar possíveis erros assim que a instancia é criada e não na primeira
    #vez que a função roda
    __new_instance $definition > $null

    $global:__ClassTable__[$type] = $definition
}

#Palavra chave new
function global:newi ([string]$type) {
    #Coloca o código desse nome de classe dentro da variável definition
    $definition = $__ClassTable__[$type]

    #Se não contiver código nenhum, gera erro dizendo que não foi definida
    if (!$definition) {
        throw "$type is undefined"
    }

    #Se não levantar erro, cria uma nova instancia
    __new_instance $definition
}

function remove-class([string]$string) {
    $__ClassTable__.Remove($type)
}