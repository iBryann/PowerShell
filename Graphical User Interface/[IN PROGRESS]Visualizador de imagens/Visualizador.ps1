using assembly system.windows.forms

$jan = new system.windows.forms.Form
$imgbox = new system.windows.forms.PictureBox
$bt = new system.windows.forms.Button
$menubar = new System.Windows.Forms.MenuStrip
$item1 = new System.Windows.Forms.ToolStripMenuItem
$tecla = [System.Windows.Forms.Keys]::Escape

$resol = [System.Windows.Forms.Screen]::AllScreens.Bounds
$x, $y = $resol.Width, $resol.Height

$item1.Text = 'Sair'
$item1.add_click({$jan.close()})
$menubar.items.Add($item1)

#Variáveis
$ValorBt = $false

#Button Tela Cheia
$bt.ClientSize = '50,50'
$bt.Image = [drawing.image]::FromFile(".\Max.png")
$bt.FlatStyle = 'flat'
$bt.add_click({
    if ($ValorBt) {
        $jan.FormBorderStyle = 'sizable'
        $jan.WindowState = 'maximized'
        $script:ValorBt = $false        
    }
    else {
        $jan.ClientSize = "$x, $y"
        $jan.TopMost = $true
        $jan.FormBorderStyle = 'none'
        $jan.WindowState = 'maximized'
        $script:ValorBt = $true
    }
})

#Form
$jan.WindowState = 'maximized'
$jan.StartPosition = 'manual'
$jan.Location = "100,100"
$jan.MinimumSize = [drawing.size]::new(300,300)
#$jan.WindowState = 'maximized'
$jan.ClientSize = "$x, $y"
$jan.BackColor = 'Black'
$jan.TopMost = $true
$jan.Text = 'Visualizador de imagens'
$jan.icon = "M:\Icones\cloudservice.ico"

#PictureBox
$imgbox.Image = [Drawing.Image]::FromFile(".\Paisagem.jpg")
$imgbox.Anchor = 'top, bottom, left, right'
$imgbox.ClientSize = "{0},{1}" -f $jan.Width, $jan.Height
$imgbox.SizeMode = 'Zoom'

#$jan.MainMenuStrip = $menubar

$jan.controls.AddRange(($bt, $imgbox))
[void]$jan.ShowDialog()

#pause