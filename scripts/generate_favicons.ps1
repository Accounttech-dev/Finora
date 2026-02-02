# Favicon Generator Script for Finora
# This script helps you generate favicon files from the Finora logo

Write-Host "=== Finora Favicon Generator ===" -ForegroundColor Cyan
Write-Host ""

$logoPath = "c:\projects\ai\a-images\ai-finora-logo.png"
$faviconDir = "c:\projects\ai\favicon"

# Check if logo exists
if (-not (Test-Path $logoPath)) {
    Write-Host "ERROR: Finora logo not found at: $logoPath" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Found Finora logo at: $logoPath" -ForegroundColor Green
Write-Host ""

# Check if ImageMagick is installed
$magickInstalled = $false
try {
    $null = magick -version 2>&1
    $magickInstalled = $true
    Write-Host "✓ ImageMagick is installed!" -ForegroundColor Green
} catch {
    Write-Host "⚠ ImageMagick is not installed" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Favicon Generation Options ===" -ForegroundColor Cyan
Write-Host ""

if ($magickInstalled) {
    Write-Host "Option 1: Auto-generate using ImageMagick (Recommended)" -ForegroundColor Green
    Write-Host "  This will automatically create all required favicon sizes"
    Write-Host ""
    
    $response = Read-Host "Do you want to auto-generate favicons now? (Y/N)"
    
    if ($response -eq 'Y' -or $response -eq 'y') {
        Write-Host ""
        Write-Host "Generating favicons..." -ForegroundColor Cyan
        
        # Generate different sizes
        $sizes = @(32, 64, 128, 256, 512, 1024, 180)
        
        foreach ($size in $sizes) {
            $outputFile = if ($size -eq 180) {
                Join-Path $faviconDir "favicon-180x1805e1f.png"
            } else {
                Join-Path $faviconDir "favicon-$size.png"
            }
            
            Write-Host "  Creating ${size}x${size} favicon..." -NoNewline
            magick convert $logoPath -resize "${size}x${size}" $outputFile 2>&1 | Out-Null
            
            if (Test-Path $outputFile) {
                Write-Host " ✓" -ForegroundColor Green
            } else {
                Write-Host " ✗" -ForegroundColor Red
            }
        }
        
        # Generate ICO file (multi-resolution)
        Write-Host "  Creating favicon.ico..." -NoNewline
        $icoOutput = Join-Path $faviconDir "favicon5e1f.ico"
        magick convert $logoPath -define icon:auto-resize=256,128,64,48,32,16 $icoOutput 2>&1 | Out-Null
        
        if (Test-Path $icoOutput) {
            Write-Host " ✓" -ForegroundColor Green
        } else {
            Write-Host " ✗" -ForegroundColor Red
        }
        
        Write-Host ""
        Write-Host "✓ Favicon generation complete!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Note: You may need to manually create the SVG version if needed." -ForegroundColor Yellow
    }
} else {
    Write-Host "Option 1: Install ImageMagick" -ForegroundColor Yellow
    Write-Host "  Download from: https://imagemagick.org/script/download.php"
    Write-Host "  Then run this script again"
    Write-Host ""
    Write-Host "Option 2: Use Online Favicon Generator (Recommended)" -ForegroundColor Green
    Write-Host "  1. Go to: https://realfavicongenerator.net/"
    Write-Host "  2. Upload: $logoPath"
    Write-Host "  3. Download the generated favicon package"
    Write-Host "  4. Extract and copy files to: $faviconDir"
    Write-Host ""
    Write-Host "Option 3: Manual Creation" -ForegroundColor Yellow
    Write-Host "  Use an image editor (Photoshop, GIMP, etc.) to create:"
    Write-Host "  - favicon-32.png (32x32)"
    Write-Host "  - favicon-64.png (64x64)"
    Write-Host "  - favicon-128.png (128x128)"
    Write-Host "  - favicon-256.png (256x256)"
    Write-Host "  - favicon-512.png (512x512)"
    Write-Host "  - favicon-1024.png (1024x1024)"
    Write-Host "  - favicon-180x1805e1f.png (180x180)"
    Write-Host "  - favicon5e1f.ico (ICO format)"
    Write-Host "  - favicon5e1f.svg (SVG format)"
}

Write-Host ""
Write-Host "=== Current Status ===" -ForegroundColor Cyan
Write-Host "✓ Site titles updated (88 files)" -ForegroundColor Green
Write-Host "✓ manifest.json updated" -ForegroundColor Green
Write-Host "⏳ Favicon files need to be replaced" -ForegroundColor Yellow
Write-Host ""
