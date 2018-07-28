using assembly PresentationCore
using namespace System.Windows.Forms

#Objeto do MediaPlayer
$wmp = New-Object System.Windows.Media.MediaPlayer

#GUI
$jan = new Form
$statusBar = New-Object StatusBar
$painel = new Panel
$play = new Button
$pause = new Button
$stop = new Button
$File = new OpenFileDialog
$menu = new MenuStrip
    $menuFile = new ToolStripMenuItem
        $menuFile_1 = new ToolStripMenuItem
        $sep_1 = new ToolStripSeparator
        $menuFile_2 = new toolstripmenuitem
$trackBar = new TrackBar
$durac = new Label

#Menu superior
$menuFile_1.Text = 'Abrir'
$menuFile_1.add_Click({
    $File.ShowDialog()
    $wmp.Open($File.FileName)
})

$menuFile_2.Text = 'Sair'
$menuFile_2.add_Click({$jan.Close()})

$menuFile.text = 'Arquivo'
$menuFile.DropDownItems.AddRange(($menuFile_1, $sep_1, $menuFile_2))

$menu.Items.AddRange($menuFile)

#Textos
$durac.text = 1
$durac.Location = '10,30'
$durac.Font = [Drawing.font]::new('arial', 14)

#TrackBar
$trackBar.Top = $menu.Bottom
$trackBar.Maximum = 10
$trackBar.Minimum = 0
$trackBar.Value = 10
$trackBar.ClientSize = '30,100'
$trackBar.Orientation = 'vertical'
$trackBar.Location = '255, 25'

$trackBar.add_scroll({
    $durac.text = $wmp.Volume = $trackBar.Value / 10
})

#Painel
$painel.Dock = 'bottom'
$painel.ClientSize = '300,50'

#Play
$play.text = 'Play'
$play.Font = [System.Drawing.Font]::new('arial', 11)
$play.ClientSize = '70, 40'
$play.Left = 10
$play.FlatStyle = 'System'
$play.add_Click({$wmp.Play()})

$painel.Controls.add($play)

#Pause
$pause.text = 'Pause'
$pause.Font = [System.Drawing.Font]::new('arial', 11)
$pause.ClientSize = '70, 40'
$pause.Left = $play.Left + 80
$pause.FlatStyle = 'System'
$pause.add_Click({$wmp.Pause()})

$painel.Controls.add($pause)

#Stop
$stop.text = 'Stop'
$stop.Font = [System.Drawing.Font]::new('arial', 11)
$stop.ClientSize = '70, 40'
$stop.Left = $pause.left + 80
$stop.FlatStyle = 'System'
$stop.add_Click({$wmp.Stop()})

$painel.Controls.add($stop)

#Configurações da janela
$jan.MaximizeBox = $false
$jan.FormBorderStyle = 'FixedDialog'
$jan.SizeGripStyle = 'Hide'
$jan.ClientSize = '300,150'
$jan.add_FormClosing({$wmp.Close()})

$jan.controls.AddRange(($menu, $durac, $trackBar, $painel, $statusBar))
[void]$jan.ShowDialog()