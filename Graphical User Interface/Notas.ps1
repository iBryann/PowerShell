add-type -AssemblyName System.Windows.Forms

#Componentes
$janela = new System.Windows.Forms.Form
$resol = [System.Windows.Forms.Screen]::AllScreens.Bounds
$txt = new System.Windows.Forms.TextBox
$icone = new System.Windows.Forms.NotifyIcon
$menuIco = new System.Windows.Forms.ContextMenuStrip
$menuTxt = new System.Windows.Forms.ContextMenuStrip
$opRecor = new System.Windows.Forms.ToolStripMenuItem
$opCopia = new System.Windows.Forms.ToolStripMenuItem
$opCola = new System.Windows.Forms.ToolStripMenuItem
$opDel = new System.Windows.Forms.ToolStripMenuItem
$Sep = new System.Windows.Forms.ToolStripSeparator
$opCor = new System.Windows.Forms.ToolStripMenuItem
$opSair = new System.Windows.Forms.ToolStripMenuItem
$opCor_1 = new System.Windows.Forms.ToolStripMenuItem
$opCor_2 = new System.Windows.Forms.ToolStripMenuItem
$opCor_3 = new System.Windows.Forms.ToolStripMenuItem
$opCor_4 = new System.Windows.Forms.ToolStripMenuItem
$opCor_5 = new System.Windows.Forms.ToolStripMenuItem

#Janela
$x, $y = ([int]$resol.Width - $janela.Width - 90), 100

$janela.Text = 'Notas'
$janela.MinimumSize = new System.Drawing.size(210,150)
$janela.FormBorderStyle = 'SizableToolWindow'
$janela.ClientSize = '350,320'
$janela.StartPosition = 'Manual'
$janela.Location = "$x, $y"

#ContextMenuStrip do TextBox
$opRecor.Text = 'Recortar'
$opRecor.add_click({$txt.Cut()})
$opCopia.Text = 'Copiar'
$opCopia.add_click({$txt.copy()})
$opCola.Text = 'Colar'
$opCola.add_click({$txt.Paste()})
$opDel.Text = 'Deletar'
$opDel.add_click({$txt.Clear()})

$menuTxt.Items.AddRange(($opRecor, $opCopia, $opCola, $opDel, $Sep, $opCor))

#ContextMenuStrip do NotifyIcon
$opCor_1.Text = 'Vermelho'
$opCor_1.add_click({$txt.BackColor = [Drawing.Color]::FromArgb(255, 130, 130)})
$opCor_2.Text = 'Azul'
$opCor_2.add_click({$txt.BackColor = [Drawing.Color]::FromArgb(122, 173, 255)})
$opCor_3.Text = 'Laranja'
$opCor_3.add_click({$txt.BackColor = [Drawing.Color]::FromArgb(249, 184, 99)})
$opCor_4.Text = 'Verde'
$opCor_4.add_click({$txt.BackColor = [Drawing.Color]::FromArgb(163, 255, 164)})
$opCor_5.Text = 'Branco'
$opCor_5.add_click({$txt.BackColor = [Drawing.Color]::FromArgb(255, 255, 255)})

$opCor.text = 'Cores'
$opCor.image = [drawing.image]::FromFile("M:\Icones\colors.ico")
$opCor.DropDownItems.AddRange(($opCor_1, $opCor_2, $opCor_3, $opCor_4, $opCor_5))

$opSair.Text = 'Sair'
$opSair.Image = [drawing.image]::FromFile("M:\Icones\delete.ico")
$opSair.add_click({$janela.close()})

$menuIco.Items.AddRange(($opSair))

#Txt
$txt.Multiline = $true
$txt.BorderStyle = 'none'
$txt.font = 'Comic Sans MS, 12'
$txt.ClientSize = "{0}, {1}" -f (($janela.Width)-16), (($janela.Height)-39)
$txt.BackColor = [Drawing.Color]::FromArgb(249, 184, 99)
$txt.Anchor = 'left, bottom, top, right'
$txt.ContextMenuStrip = $menuTxt

#NotifyIcon
$icone.Icon = "M:\Icones\PowerShellProject.ico"
$icone.Visible = $true
$icone.Text = 'Teste'
$icone.ContextMenuStrip = $menuIco

$janela.Controls.Add($txt)
[void]$janela.ShowDialog()