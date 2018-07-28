clear-host

write("==== tabuada ====`n".ToUpper())
for ($i = 1; $i -le 5; $i++) {
    write("Tabuada de $i")
    for ($j = 1; $j -le 10; $j++) {
        write("$i x $j = $($i * $j)")
    }
    write('')
}                
