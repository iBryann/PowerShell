&.\class.ps1

CustomClass point {
    note nome "Bryann"
    note idade 20
    note altura 1.75
    note peso 76.1

    method GetNome {
        write("Seu peso é $($this.nome)")
    }

    method GetIdade {
        write("Você tem $($this.idade) anos de idade")
    }
}

$eu = newi point