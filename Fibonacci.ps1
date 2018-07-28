$a, $b = 1, 2
while ($a -lt 10) {
    write($a)
    $a, $b = $b, ($a+$b)
}
