#Criar icone

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Calc.lnk")
$Shortcut.TargetPath = "Calc"
$Shortcut.Save()