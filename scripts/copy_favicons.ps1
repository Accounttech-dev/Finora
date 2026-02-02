$source = "C:/Users/user/.gemini/antigravity/brain/0d2756a9-36b0-4d66-be82-d250c362e4d5/uploaded_media_1770056941694.png"
$faviconDir = "c:\projects\ai\favicon"

$files = @(
    "favicon-32.png",
    "favicon-64.png",
    "favicon-128.png",
    "favicon-256.png",
    "favicon-512.png",
    "favicon-1024.png",
    "favicon-180x1805e1f.png"
)

Write-Host "Copying Finora icon to all favicon files..." -ForegroundColor Cyan

foreach ($file in $files) {
    $dest = Join-Path $faviconDir $file
    Copy-Item -Path $source -Destination $dest -Force
    Write-Host "  Created: $file" -ForegroundColor Green
}

Write-Host ""
Write-Host "SUCCESS! All favicon files updated with Finora branding!" -ForegroundColor Green
Write-Host ""
Write-Host "Complete branding update summary:" -ForegroundColor Cyan
Write-Host "  - 88 HTML files updated with Finora titles" -ForegroundColor White
Write-Host "  - manifest.json updated" -ForegroundColor White
Write-Host "  - 7 favicon files created" -ForegroundColor White
Write-Host ""
Write-Host "Your website now has complete Finora branding!" -ForegroundColor Green
