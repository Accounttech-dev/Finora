# Fix all links in HTML files
# 1. Replace ask-digits with ask-finora

$files = Get-ChildItem -Path . -Filter *.html -Recurse
$count = 0

foreach ($file in $files) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        if ($content -match 'ask-digits') {
            $newContent = $content -replace 'ask-digits', 'ask-finora'
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            $count++
            Write-Host "Fixed: $($file.Name)"
        }
    } catch {
        Write-Host "Error: $($file.Name) - $_"
    }
}

Write-Host "`nTotal files fixed: $count"
