add-type -assemblyName System.Windows.Forms

#Componentes
$janela = New-Object System.Windows.Forms.Form
$txtLabel = New-Object System.Windows.Forms.Label
$timer = New-Object System.Windows.Forms.Timer

#txtLabel
$txtlabel.AutoSize = $true
$txtLabel.Font = "Segoe UI, 50"
$txtLabel.Location = '20, 0'

#Janela
$janela.TopMost = $true
$janela.StartPosition = 'Manual'
$janela.Location = '1275,730'
$janela.Text = "Relógio"
$janela.ClientSize = '311, 94'
$janela.MaximizeBox = $False
$janela.ShowIcon = $False
$janela.FormBorderStyle = 'FixedSingle'

#Timer
$timer.Enabled = $True
$timer.Interval = 0.997
$timer.add_Tick({$txtLabel.text = (Get-Date).ToString("HH:mm:ss")})

#Abrindo janela
$janela.Controls.Add($txtLabel)

[void]$janela.ShowDialog()