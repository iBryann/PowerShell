#Classe mãe: superclasse
class pessoa {
    #Propriedades da classe
    [char]$sexo
    [int]$idade
    [string]$nome

    #Método construtor: Não se define tipo a um método construtor
    pessoa ($nome, $idade, $sexo){
        $this.nome = $nome
        $this.idade = $idade
        $this.sexo = $sexo
    }

    #Método modificador: setter
    [void]defNome ($dn) {
         $this.nome = $dn
    }

    #Método acessor: getter
    [string] obtNome() {
        if ($this.nome -ne "") {
            return $this.nome
        }
        else {return "Vazio"}
    }

    #Funções
    [string]cumprimentar ($fulano) {
        return "Olá, " + $fulano + ", meu nome é " + $this.obtNome() + "!"
    }
}

#Classe filha: subclasse
class aluno:pessoa {
    [int]$série
    [string]$turma
    [string]$escola

    #Chamando o construtor da superclasse, do contrário uma exceção é levantada
    aluno ([int]$série, [string]$turma, [string]$escola) : base($nome, $idade, $sexo){
        $this.série = $série
        $this.turma = $turma
        $this.escola = $escola
    }

    [string]estudar() {
       return "Meu nome é {0}, sou da {1}ª{2} e estudo na escola {3}" -f ($this.nome, $this.série, $this.turma, $this.escola)
    }
}

#Classe ABSTRATA filha de aluno. Como WPS não tem palavra chave 'abstract', fazemos uma classe abstrata assim
class bolsista:aluno {
    [string]$pagante
    [int]$valor

    bolsista($pagante, $valor) : base($nome, $idade, $sexo) {
        $this.pagante = $pagante
        $this.valor = $valor

        $nomeClasse = $this.GetType() #Nome da classe
        if ($nomeClasse -eq [bolsista]) {throw("Classe $nomeClasse não pode ser herdada")}
    }    
}

#Polimorfismo
class Estudante : Pessoa {
    [string]$escola
    [string]$série

    Estudante() : base($nome, $idade, $sexo){ }

    #Polimorfismo de sobreposição
    [string]ola([string]$nome){
        return "Olá, {0}!" -f ($nome)
    }
    
    #Polimorfismo de sobrecarga
    [string]ola([int]$idade){
        return "Sua idade é {0}." -f ($idade)
    }
    
    [string]ola([string]$nome, [int]$idade){
        return "Seu nome é {0} e tem {1} anos." -f ($nome, $idade)
    }
}