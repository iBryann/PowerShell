for ($I = 1; $I -le 100000; $I++)
{
    [int]$p = ($I*100)/100000
    Write-Progress -Activity "Progresso..." -Status $p"%" -PercentComplete $p
}
