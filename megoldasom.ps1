if (!($args.Count -eq 1)) {
    Write-Host "Egy parameter szukseges: File neve"
    exit
}

$file = $args[0];

if (!(Test-Path -PathType Leaf $file)) {
    Write-Host "File nem letezik: $file"
    exit
}

$cells = (0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)

$ln = 0
foreach ($line in Get-Content $file) {
    $cls = $line.Split(" ")

    $cn = 0
    foreach($c in $cls) {
        $cells[$ln][$cn] = $c
        $cn = $cn + 1
    }

    $ln = $ln + 1
}

$helyes = $true

for ($x = 0; $x -lt 8; $x++) {
    for ($y = 0; $y -lt 8; $y++) {
        if ($cells[$x][$y] -eq 1) {
            Write-Host "Kiralyno: $x $y"
        }
    }
}