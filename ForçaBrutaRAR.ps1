function Unprotect-RAR{
    Param(
        [Parameter(Mandatory = $True)]
        [String]$caminho_Arq,
        [String]$Caminho_Sai = "$env:USERPROFILE\desktop",
        [Parameter(Mandatory = $True)]
        [String[]]$WL
    )

    Write-Output("CAREGANDO WORDLIST...")
    $WL = Get-Content $WL
    Clear-Host
    
    Set-Location $Caminho_Sai
    
    $cont = 0
      
    foreach($Pass in $WL){
        $teste = unrar e -inul "$Caminho_Arq" -p"$Pass"
        $cont += 1

        if(Test-Path "asd.txt"){
            "[+]Pass break. senha: $pass`nNº de testes: $cont"
        }
    }
}