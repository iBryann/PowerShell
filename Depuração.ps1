function Get-max ($targetArray) { 
    $max=0

    for ($i = 0; $i -lt $targetArray.count; $i++) {
        if($targetArray[$i] -gt $max) {
            $max=$targetArray[$i]
        }
    }

    return $max
}

Describe "Teste da função Get-max" {
    It "Deve retornar 100" {
        $atual = Get-max @(55,17,99,78,100)
        $atual | Should be 99
    }

    it "Deve ser 80" {
        Get-max @(80,1,8,79) | should be 80
    }
}