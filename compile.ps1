param (
    [switch]$debug = $false,
    [switch]$worldeditor = $false
)

$SourceFolder = "$pwd/source/*"
$OutputFolder = "$pwd/output"
$OutputFile = "$pwd/output/raw_war3map.j"
$SourceFiles = Get-ChildItem -Path $SourceFolder -Recurse -Include *.j -Exclude Blizzard.j, common.j, war3map.j, base.j
$JassHelperArgs = "$pwd\tools\common1.33.j", "$pwd\tools\Blizzard1.33.j", "$pwd\output\raw_war3map.j", "$pwd\output\MIX.w3x"

$ConfigData = Get-Content ".\config.ini"
$ConfigData = $ConfigData -replace "\\+", "\\"
$ConfigData = $ConfigData -replace "\[\S*\]", "" -match "\S*=[\S ]*" | Out-String

$Config = ConvertFrom-StringData -StringData $ConfigData

New-Item -Path $OutputFolder -ItemType Directory -Force > $null
New-Item -Path $OutputFolder -Name "raw_war3map.j" -ItemType File -Force > $null

foreach ($File in $SourceFiles) {
    Get-Content -Path $File | Add-Content $OutputFile
}

Get-Content -Path "$pwd/source/main/base.j" | Add-Content $OutputFile

Write-Output "Compiled successfully!"

if ($Config.WarcraftPath -match "\b\w[:]((\\|\/)(\w|\d|[ ])*)*\b") {
    if ($debug) {
        $JassHelperArgs = "--debug" + " " + $JassHelperArgs
    }
    Start-Process -FilePath "$pwd\tools\Glowackos-Cohadar-JassHelper\clijasshelper.exe" -ArgumentList $JassHelperArgs -NoNewWindow -Wait
    if ($worldeditor) {
        if ($Config.WorldEditorPath -match "\b\w[:]((\\|\/)(\w|\d|[ ])*)*\b") {
            Start-Process -FilePath $Config.WorldEditorPath -ArgumentList "-launch", "-loadfile", "$pwd\output\MIX.w3x"
        } else {
            Write-Output "EXCEPTION: `"World Editor.exe`" is not found!`nPlease check:`n`t-> .\config.ini`n`t`t-> WorldEditorPath"
        }
    } else {
        Start-Process -FilePath $Config.WarcraftPath -ArgumentList "-launch", "-loadfile", "$pwd\output\MIX.w3x", "-testmapprofile MIX", $Config.WarcraftArguments
    }
    Write-Output "`n`nLaunched successfully!"
} else {
    Write-Output "EXCEPTION: `"Warcraft III.exe`" is not found!`nPlease check:`n`t-> .\config.ini`n`t`t-> WarcraftPath"
}