Import-Module 'gsudoModule'
oh-my-posh init pwsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/easy-term.omp.json'| Invoke-Expression
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

