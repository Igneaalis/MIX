# $SourceFolder = "./source/*"
$LibrariesFolder = "./source/libraries/*"
$OutputFolder = "./output"
$OutputFile = "./output/raw_war3map.j"
$Libraries = Get-ChildItem -Path $LibrariesFolder -Include *.j
# $SourceFiles = Get-ChildItem -Path $SourceFolder -Include *.j -Exclude Blizzard.j, common.j, war3map.j, base.j

New-Item -Path $OutputFolder -ItemType Directory -Force > $null
New-Item -Path $OutputFolder -Name "raw_war3map.j" -ItemType File -Force > $null

foreach ($Library in $Libraries) {
    Get-Content -Path $Library | Add-Content $OutputFile
}

Get-Content -Path "./source/NokladrLib.j" | Add-Content $OutputFile
Get-Content -Path "./source/MIXLib.j" | Add-Content $OutputFile
Get-Content -Path "./source/Globals.j" | Add-Content $OutputFile
Get-Content -Path "./source/Locale.j" | Add-Content $OutputFile
Get-Content -Path "./source/EndGame.j" | Add-Content $OutputFile
Get-Content -Path "./source/gameset_end.j" | Add-Content $OutputFile
Get-Content -Path "./source/gameset_owner.j" | Add-Content $OutputFile
Get-Content -Path "./source/Messages.j" | Add-Content $OutputFile
Get-Content -Path "./source/faq.j" | Add-Content $OutputFile
Get-Content -Path "./source/faq_stop.j" | Add-Content $OutputFile
Get-Content -Path "./source/faq_ini.j" | Add-Content $OutputFile
Get-Content -Path "./source/faq_start.j" | Add-Content $OutputFile
Get-Content -Path "./source/faq_active.j" | Add-Content $OutputFile
Get-Content -Path "./source/initialization_in_game.j" | Add-Content $OutputFile
Get-Content -Path "./source/Income_upg.j" | Add-Content $OutputFile
Get-Content -Path "./source/Income_upgA.j" | Add-Content $OutputFile
Get-Content -Path "./source/Income_upgR.j" | Add-Content $OutputFile
Get-Content -Path "./source/Income_upgTQ.j" | Add-Content $OutputFile
Get-Content -Path "./source/Main.j" | Add-Content $OutputFile

Get-Content -Path "./source/base.j" | Add-Content $OutputFile

Write-Output "Compiled successfully!"