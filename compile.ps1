$SourceFolder = "./source/*"
$OutputFolder = "./output"
$OutputFile = "./output/raw_war3map.j"
$SourceFiles = Get-ChildItem -Path $SourceFolder -Recurse -Include *.j -Exclude Blizzard.j, common.j, war3map.j, base.j

New-Item -Path $OutputFolder -ItemType Directory -Force > $null
New-Item -Path $OutputFolder -Name "raw_war3map.j" -ItemType File -Force > $null

foreach ($File in $SourceFiles) {
    Get-Content -Path $File | Add-Content $OutputFile
}

Get-Content -Path "./source/base.j" | Add-Content $OutputFile

Write-Output "Compiled successfully!"