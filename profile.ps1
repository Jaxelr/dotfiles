# This needs to have installed:
# - oh my posh
# - psreadline
# - terminal icons
# - posh git

Import-Module posh-git
# Import-Module oh-my-posh (This must be installed via winget now)
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config .ohmyposhconfig.json | Invoke-Expression

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

###Custom Aliases
function New-File() {
    $fileName = $args[0]

    if (!$fileName) {
        Write-Error -Message "First Argument must not be empty."
    } else {
        # Check of the file exists
        if (-not(Test-Path $fileName)) {
            # It does not exist. Create it
            New-Item -ItemType File -Name $fileName
        }
        else {
            #It exists. Update the timestamp
            (Get-ChildItem $fileName).LastWriteTime = Get-Date
        }
    }
}

function Remove-Files() {
    $foldersToDelete = @("bin", "obj", "msbuild_logs", "benchmarkDotnet.Artifacts")

    $directories = Get-ChildItem -Directory -Recurse

    foreach ($dir in $directories) {
        foreach ($folder in $foldersToDelete) {
            $path = Join-Path -Path $dir.FullName -ChildPath $folder
            if (Test-Path $path) {
                Remove-Item -Path $path -Recurse -Force
                Write-Host "Deleted: $path"
            }
        }
    }
}

### Create an alias for touch

# Check if the alias exists
if (-not(Test-Path -Path Alias:Touch)) {
    New-Alias -Name Touch New-File -Force
}

# Cleanup files
if (-not(Test-Path -Path Alias:Cleanup)) {
    New-Alias -Name Cleanup Remove-Files -Force
}
