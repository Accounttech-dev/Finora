# Script to reorganize navigation: Rename integrations to about-us and update all links
Write-Host "Starting navigation reorganization..." -ForegroundColor Cyan

# Step 1: Rename integrations folder to about-us
$oldFolder = "c:\projects\ai\integrations"
$newFolder = "c:\projects\ai\about-us"

if (Test-Path $oldFolder) {
    if (Test-Path $newFolder) {
        Write-Host "Warning: about-us folder already exists. Removing it first..." -ForegroundColor Yellow
        Remove-Item $newFolder -Recurse -Force
    }
    
    Rename-Item -Path $oldFolder -NewName "about-us"
    Write-Host "Renamed 'integrations' folder to 'about-us'" -ForegroundColor Green
} else {
    Write-Host "Warning: integrations folder not found at $oldFolder" -ForegroundColor Yellow
}

# Step 2: Update all HTML files - replace links from /integrations/ to /about-us/
Write-Host "Updating HTML files..." -ForegroundColor Cyan

$htmlFiles = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse
$updateCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Replace all variations of integrations links
    $content = $content -replace '/integrations/', '/about-us/'
    $content = $content -replace '"/integrations"', '"/about-us"'
    $content = $content -replace 'href="../../integrations/"', 'href="../../about-us/"'
    
    # Update the link text from "Real-time Integrations" to "About Us"
    $content = $content -replace 'Real-time Integrations', 'About Us'
    $content = $content -replace 'Real-Time Integrations', 'About Us'
    
    # If content changed, save the file
    if ($content -ne $originalContent) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        $updateCount++
        Write-Host "  Updated: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "Updated $updateCount HTML files" -ForegroundColor Green

# Step 3: Update the about-us/index.html title and content
$aboutUsHtml = "c:\projects\ai\about-us\index.html"
if (Test-Path $aboutUsHtml) {
    $content = Get-Content -Path $aboutUsHtml -Raw -Encoding UTF8
    
    # Update page title
    $content = $content -replace '<title>.*?</title>', '<title>Finora - About Us</title>'
    
    # Update meta descriptions
    $content = $content -replace 'content=".*?integrations.*?"', 'content="Learn about Finora - the AI-native accounting platform serving 12,000+ financial institutions."'
    
    [System.IO.File]::WriteAllText($aboutUsHtml, $content, [System.Text.UTF8Encoding]::new($false))
    Write-Host "Updated about-us/index.html page title and content" -ForegroundColor Green
}

Write-Host "Navigation reorganization complete!" -ForegroundColor Green
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  - Renamed folder: integrations to about-us" -ForegroundColor White
Write-Host "  - Updated $updateCount HTML files with new links" -ForegroundColor White
Write-Host "  - Changed menu item: Real-time Integrations to About Us" -ForegroundColor White
