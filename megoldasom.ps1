# Skorka Bence
# DOMJ1R
# https://github.com/SkorkaBence/SzamalapBeadando3

if (!($args.Count -eq 1)) { # egy parameter van?
    Write-Host "Egy parameter szukseges: File neve"
    exit
}

$file = $args[0]; # parameter legyen a file

if (!(Test-Path -PathType Leaf $file)) { # letezik a file?
    Write-Host "File nem letezik: $file"
    exit
}

#alap tomb letrehozasa
$cells = (0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)

$ln = 0
foreach ($line in Get-Content $file) { # soronkent beolvasas
    $cls = $line.Split(" ")

    $cn = 0
    foreach($c in $cls) { # sorok elemeinek beolvasasa

        if (($ln -gt 7) -or ($cn -gt 7)) { # bemeneti file vizsgalat
            Write-Host "Hibas bemeneti file!"
            exit
        }

        if ($c -eq "1") { # tarolas
            $cells[$ln][$cn] = 1
        } elseif ($c -eq "0") {
            $cells[$ln][$cn] = 0
        } else {
            Write-Host "Hibas bemeneti file!"
            exit
        }
        $cn = $cn + 1
    }

    $ln = $ln + 1
}

$helyes = $true # vegeredmenyt tarolo valtozo

for ($x = 0; $x -lt 8; $x++) { # vegigmegyunk az osszes elemen
    for ($y = 0; $y -lt 8; $y++) {
        if ($cells[$x][$y] -eq 1) { # ha kiralyno
            # ellenorzes
            for ($x2 = 0; $x2 -lt 8; $x2++) { # megint vegigmegyunk az osszes elemen
                for ($y2 = 0; $y2 -lt 8; $y2++) {

                    $tavx = $x2 - $x
                    $tavy = $y2 - $y

                    if ((($tavx -eq 0) -or ($tavy -eq 0) -or ([math]::abs($tavx) -eq [math]::abs($tavy))) -and (!(($tavx -eq 0) -and ($tavy -eq 0)))) { # kell ellenorizni?
                        if ($cells[$x2][$y2] -eq 1) {
                            $helyes = $false
                        }
                    }
                }
            }

        }
    }
}

if ($helyes -eq $true) {
    Write-Host "Helyes!"
} else {
    Write-Host "Nem helyes!"
}