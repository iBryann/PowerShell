cls

function popup ($titulo=(get-date), $txt="Windows PowerShell") {

    add-type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    
    $janela = [System.Windows.Forms.Form]::new()
    $texto = [System.Windows.Forms.Label]::new()
    $botao = [System.Windows.Forms.Button]::New()
    $painel = [System.windows.forms.panel]::new()

    #Botão
    $botao.top = $painel.top + 12
    $botao.left = $painel.Right - 60
    $botao.Width = 85
    $botao.height = 28
    $botao.Text = "OK"
    $botao.add_click({$janela.Close()})

    #Texto
    $texto.Top = 40
    $texto.Left = 10
    $texto.AutoSize = $true
    $texto.Text = $txt
    
    #Painel
    $painel.Size = [System.Drawing.Size]::new(255,50)
    $painel.Dock = "bottom"
    $painel.BackColor = [System.Drawing.Color]::Wheat

    $painel.Controls.Add($botao)
        
    #Janela
    $janela.BackColor = [System.Drawing.Color]::White
    $janela.Text = $titulo
    $janela.Width = 255
    $janela.height = 150
    $janela.MinimizeBox = $false
    $janela.Maximizebox = $false
    $janela.FormBorderStyle = "FixedDialog"
    $janela.StartPosition = "CenterScreen"

    $janela.Controls.Add($painel)
    $janela.controls.add($texto)

    $janela.ShowDialog()
}

popup "Título" "Mensagem"