class Sinal {
    [int]$tmp
    [int]$atual
    [int]$prox
    [int]$cont
    [string[]]$esq = @("Red", "Yellow", "Green", "Red")
    [bool]$press

    Sinal($ini, $tmp) {
        try {
            if ($tmp -ge 60) {throw "Limite de tempo excedido (max 60 segundos)"}
        }
        catch {
            Write-error "Limite de tempo excedido (max 60 segundos)`nDigite um valor abaixo de 60 segundos."
            read-host
            exit
        }
        finally {
            $this.atual = $ini
            $this.tmp = $tmp
        }
    }

    rodar() {
        #[console]::SetWindowSize(25,20)
        #[console]::SetBufferSize(25,20)

        set-alias -Name wh -Value write-host -Scope global

        $global:host.ui.RawUI.WindowTitle = "Iniciando..."
        $this.luzes($this.esq)
        Start-Sleep 3


        while($true) {
            if ($global:host.ui.RawUI.KeyAvailable -and -not $this.press) {
                if ($this.prox -eq 2) {$this.botao()}
                $global:host.ui.RawUI.FlushInputBuffer()
            }

            if (!$this.cont) {
                $this.verificar()
            }
            
            $global:host.ui.RawUI.WindowTitle = "Falta " + $this.cont
            $this.cont -= 1            
            Start-Sleep -m 900
        }
    }
    
    verificar() {
		switch ($this.atual) {
			0 {
				#Amarelo
                $this.esq = @("Black", "Yellow", "Black", "Green")
				$this.luzes($this.esq)
				$this.atual = 0
                $this.cont = 4

                if ($this.prox -eq 1) {
                    $this.atual = 1
                }
                else {
                    $this.atual = 2
                }

                break
			}
			1 {
				#Verde
				$this.esq = @("Black", "Black", "Green", "Green")
                $this.luzes($this.esq)
                $this.atual = 0
                $this.prox = 2
                $this.cont = $this.tmp
				break
			}
			2 {
				#Vermelho
                $this.press = $false
				$this.esq = @("Red", "Black", "Black", "Green")
                $this.luzes($this.esq)
                $this.atual = 0
                $this.prox = 1
                $this.cont = $this.tmp
			}
		}
    }

    botao() {
        $this.press = $true
        if ($this.cont -ge 10) {
            $this.cont -= 5

            $this.esq = $this.esq[0..2] + "Red"
            $this.luzes($this.esq)
        }
    }

    luzes([string[]]$cor) {
        Clear-Host
        wh "`n ████████████" -f "Gray"
        wh " █" -f "Gray" -n; wh (" " * 10 + "█") -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[0] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[0] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[0] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh (" " * 10 + "█") -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[1] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[1] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[1] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh (" " * 10 + "█") -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[2] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[2] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh "  ██████  " -f $cor[2] -n; wh █ -f "Gray"
        wh " █" -f "Gray" -n; wh (" " * 10 + "█") -f "Gray"
        wh " ████████████" -f "Gray"

        wh "`n`n      ██ " -f $cor[3] -n
    }
}

$app = New-Object Sinal(1, 20)
$app.rodar()