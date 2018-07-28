cls

$p = read-host "Peso"
$a = read-host "Altura"

$imc = $p / ([float]$a * $a)

write("`n- - - - - - - - - -`n")

if ($imc -le 15) {"Extremamente abaixo do peso"}
elseif ($imc -gt 15 -and $imc -lt 16) {'Gravemente abaixo do peso'}
elseif ($imc -gt 16 -and $imc -lt 18.5) {'Abaixo do peso ideal'}
elseif ($imc -gt 18.5 -and $imc -lt 25) {'Faixa de peso ideal'}
elseif ($imc -gt 25 -and $imc -lt 30) {'Sobrepeso'}
elseif ($imc -gt 30 -and $imc -lt 35) {'Obesidade grau I'}
elseif ($imc -gt 35 -and $imc -lt 40) {'Obesidade grau II (grave)'}
else {'Obesidade grau III (mórbida)'}

read-host