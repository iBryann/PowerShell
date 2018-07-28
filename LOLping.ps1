<#
    Bryann Henrique - Bryann.enrique@gmail.com
    LOLping.ps1 - Verifica a qualidade da conexão com o servidor do LOL
    Versão 1.0
#>

#Personalização (Customization)
function personaliza {
    if (!$psISE) {
        $janela = $host.ui.rawui

        $janela.WindowTitle = "LOLping"
        $janela.ForegroundColor = 3
        $janela.BackgroundColor = 0

        $tela = $janela.windowsize
        $tela.height = 52
        $tela.width = 25
        $janela.windowsize = $tela
    }
}

#Principal (main)
if (test-path "$home\NetLog.log") {remove-item "$home\NetLog.log"}
personaliza   #Personaliza o console
Clear-Host    #Limpa a tela caso o shell peça alguma permissão
Write-Host ((' ' * 7) + 'Versão 1.0' + (' ' * 7))

$ip="8.23.25.177"

while ($true){
	$hora = get-date -UFormat “%H:%M:%S”

    try {
        $ms = ((Test-Connection $ip -Count 1 -ErrorAction Stop).responseTime) + 4
        
        if ($ms -lt 100) {
		    write-host "$hora ─►  $ms ms  █"
	    }
	    
        else {
		    write-host "$hora ─►  $ms ms  █" -ForegroundColor Red
		    write-output "$hora ─►  $ms ms" >> "$home\NetLog.log"
	    }
    }

    catch {
        write-host "$hora ─►  FALHA" -ForegroundColor Red
    }

	Start-Sleep 1
}