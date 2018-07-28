<#
    Todo mês eu guardo R$ 250,00 para dar uma entrada de R$ 8000,00 na compra
    de um carro. Já venho juntando há a 5 meses. Daqui a quantos meses terei
    juntado o sulficiênte?
#>

cls

$a1, $r, $an = 0, 300, $a1
$n = 0

while($an -lt 8000){
    $an += $r
    $n++
    write("{0} - {1}" -f $n, $an)
}