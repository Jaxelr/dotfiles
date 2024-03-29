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
function Touch-File() {
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

### Create an alias for touch

# Check if the alias exists
if (-not(Test-Path -Path Alias:Touch)) {
    New-Alias -Name Touch Touch-File -Force
}
