$ObjetoWScript = New-Object -ComObject WScript.Shell
$scrollLock = [System.Windows.Forms.Control]::IsKeyLocked('Scroll')

while (1) {
    if ($ScrollLock -eq $false) {$ObjetoWScript.SendKeys("{SCROLLLOCK}")}
    else {$ObjetoWScript.SendKeys("{SCROLLLOCK}")}
    start-sleep -m 100
}