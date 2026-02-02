# Fix localhost URLs in all HTML files
$files = Get-ChildItem -Path "c:\projects\ai" -Recurse -Filter *.html -File

foreach ($file in $files) {
    try {
        $content = [System.IO.File]::ReadAllText($file.FullName)
        if ($content -match 'http://127\.0\.0\.1:5503') {
            $newContent = $content -replace 'http://127\.0\.0\.1:5503/', '/'
            [System.IO.File]::WriteAllText($file.FullName, $newContent)
            Write-Host "Fixed: $($file.Name)"
        }
    } catch {
        Write-Host "Error: $($file.Name) - $_"
    }
}

Write-Host "Done!"
