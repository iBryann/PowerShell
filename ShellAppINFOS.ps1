q
$pasta = "M:\MEDIA\ACDC\(1979) - Highway to Hell"

$lista = Get-ChildItem -Filter *.mp3 -Path $pasta -Name

$objShell = New-Object -ComObject Shell.Application
$objPasta = $objShell.Namespace($pasta)
$objArq = $objpasta.ParseName($lista[0])

$i = 0
while ($i-lt 315) {
    "{0,50} {1}" -f $objpasta.GetDetailsOf('', $i), $objpasta.GetDetailsOf($objarq, $i)
    $i++
}
