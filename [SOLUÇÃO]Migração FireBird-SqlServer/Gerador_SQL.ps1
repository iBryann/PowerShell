$teste = (Get-Content .\listagem.csv -Encoding Oem)
$mun = ""
$cod = ""
$cmd = ""

if (test-path .\Cidade.sql) {Remove-Item .\Cidade.sql}

foreach ($i in $teste) {
    $mun = $i.Substring(0, 5)
    $cod = $i.Substring(6, ($i.Length-6)).Replace("'", "")

    $cmd = "UPDATE CLIFOR SET CIDADE=`'" + $cod + "`' WHERE cidade=`'" + $mun + "`'"
    write $cmd >> .\Cidade.sql
}