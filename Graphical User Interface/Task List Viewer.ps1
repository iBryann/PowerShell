using assembly system.windows.forms

function AtualizarGrid {
    $grid.Rows.Clear()

    $nome = get-process | select ProcessName
    $id = get-process | select Id
    $mem = get-process | select WS

    for ($i = 0; $i -lt $nome.count; $i++) {
        $grid.Rows.add($nome[$i].ProcessName, $id[$i].Id, $mem[$i].WS)
    }
}

cls
$janela = new system.windows.forms.form
$menu = new System.Windows.Forms.MenuStrip
    $op0 = new System.Windows.Forms.ToolStripMenuItem
    $op1 = new System.Windows.Forms.ToolStripMenuItem
    $op2 = new System.Windows.Forms.ToolStripMenuItem
    $op3 = new System.Windows.Forms.ToolStripMenuItem

$grid = new System.Windows.Forms.DataGridView
    $coluna1 = new System.Windows.Forms.DataGridViewTextBoxColumn
    $coluna2 = new System.Windows.Forms.DataGridViewTextBoxColumn
    $coluna3 = new System.Windows.Forms.DataGridViewTextBoxColumn
$timer = new System.Windows.Forms.Timer

#Menu superior
$op0.Text = 'Menu'
$op0.DropDownItems.AddRange(($op1, $op2))
$op1.Text = 'Atualizar'
$op1.add_click({AtualizarGrid})
$op2.Text = 'Sair'
$op2.add_click({$janela.close()})

$menu.items.AddRange($op0)

#Janela
$janela.ClientSize = '500,600'
$janela.StartPosition = 'centerscreen'

#Colunas
$coluna1.AutoSizeMode = 'fill'
$coluna1.HeaderText = 'Processos'
$coluna2.AutoSizeMode = 'fill'
$coluna2.HeaderText = 'PID'
$coluna3.AutoSizeMode = 'fill'
$coluna3.HeaderText = 'Memória'

#DataGridView
$grid.BorderStyle = 'none'
$grid.BackgroundColor = 'white'
$grid.AllowUserToResizeColumns = $false
$grid.AllowUserToAddRows = $false
$grid.ReadOnly = $true
$grid.Location = '0,28'
$grid.ClientSize = "{0}, {1}" -f ($janela.Width - 16), ($janela.Height - 69)
$grid.RowHeadersVisible = $false
$grid.Columns.AddRange($coluna1, $coluna2, $coluna3)

$janela.add_load({AtualizarGrid})
$janela.Controls.AddRange(($menu, $grid))
[void]$janela.ShowDialog()

