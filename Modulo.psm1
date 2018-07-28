class modulo {
  [string] $Nome = 'Bryann'

  [string] mensagem() {
    return 'Teste'
  } 
}

class Durac {
    [string]$pasta = "M:\Backup\CWPS"
    [string]$formato = "*.mp4"
    [string]$saida
    [string[]]$lista
    [datetime]$resultado

    [string] gerador() {
        $this.lista += Get-ChildItem $this.formato -Path $this.pasta -Name

        foreach ($i in $this.lista) {
            $this.resultado += $this.duração($i)
        }
        
        $ofs = ''
        $this.saida = $this.resultado
        return "Duração: " + $this.saida[-8..-1]
    }

    [string] duração([string]$arq = '') {
        $coluna = 27
        $objShell = New-Object -ComObject Shell.Application 
        $objPasta = $objShell.Namespace($this.pasta)
        $objArq = $objpasta.ParseName($arq)
        $tamanho = $objpasta.GetDetailsOf($objarq, $coluna)
        
        return $tamanho
    }
}