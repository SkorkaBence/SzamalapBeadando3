if (!($args.Count -eq 1)) {
    Write-Host "Egy parameter szukseges: File neve"
    exit
}

$file = $args[0];

if (!(Test-Path -PathType Leaf $file)) {
    Write-Host "File nem letezik: $file"
    exit
}