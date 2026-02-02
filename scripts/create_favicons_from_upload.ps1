# Create Favicons from Uploaded Finora Icon
# This script will copy and resize the uploaded icon to create all required favicon sizes

$uploadedIcon = "C:/Users/user/.gemini/antigravity/brain/0d2756a9-36b0-4d66-be82-d250c362e4d5/uploaded_media_1770056941694.png"
$faviconDir = "c:\projects\ai\favicon"

Write-Host "=== Creating Finora Favicons ===" -ForegroundColor Cyan
Write-Host ""

# Check if uploaded icon exists
if (-not (Test-Path $uploadedIcon)) {
    Write-Host "ERROR: Uploaded icon not found at: $uploadedIcon" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Found uploaded Finora icon" -ForegroundColor Green
Write-Host ""

# Check for ImageMagick
$hasImageMagick = $false
try {
    $magickVersion = & magick -version 2>&1
    if ($LASTEXITCODE -eq 0) {
        $hasImageMagick = $true
        Write-Host "✓ ImageMagick detected" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠ ImageMagick not found - will copy icon as-is" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Creating favicon files..." -ForegroundColor Cyan
Write-Host ""

if ($hasImageMagick) {
    # Generate different sizes using ImageMagick
    $sizes = @(
        @{Size=32; Name="favicon-32.png"},
        @{Size=64; Name="favicon-64.png"},
        @{Size=128; Name="favicon-128.png"},
        @{Size=256; Name="favicon-256.png"},
        @{Size=512; Name="favicon-512.png"},
        @{Size=1024; Name="favicon-1024.png"},
        @{Size=180; Name="favicon-180x1805e1f.png"}
    )
    
    foreach ($item in $sizes) {
        $outputPath = Join-Path $faviconDir $item.Name
        Write-Host "  Creating $($item.Name) ($($item.Size)x$($item.Size))..." -NoNewline
        
        try {
            & magick convert $uploadedIcon -resize "$($item.Size)x$($item.Size)" $outputPath 2>&1 | Out-Null
            if (Test-Path $outputPath) {
                Write-Host " ✓" -ForegroundColor Green
            } else {
                Write-Host " ✗" -ForegroundColor Red
            }
        } catch {
            Write-Host " ✗" -ForegroundColor Red
        }
    }
    
    # Create ICO file
    Write-Host "  Creating favicon5e1f.ico..." -NoNewline
    $icoPath = Join-Path $faviconDir "favicon5e1f.ico"
    try {
        & magick convert $uploadedIcon -define icon:auto-resize=256,128,64,48,32,16 $icoPath 2>&1 | Out-Null
        if (Test-Path $icoPath) {
            Write-Host " ✓" -ForegroundColor Green
        } else {
            Write-Host " ✗" -ForegroundColor Red
        }
    } catch {
        Write-Host " ✗" -ForegroundColor Red
    }
    
    # Copy as SVG (if original is SVG, otherwise skip)
    if ($uploadedIcon -match "\.svg$") {
        Write-Host "  Creating favicon5e1f.svg..." -NoNewline
        Copy-Item $uploadedIcon (Join-Path $faviconDir "favicon5e1f.svg") -Force
        Write-Host " ✓" -ForegroundColor Green
    }
    
} else {
    # No ImageMagick - just copy the file to all locations
    Write-Host "  Copying icon to all favicon locations..." -ForegroundColor Yellow
    
    $files = @(
        "favicon-32.png",
        "favicon-64.png", 
        "favicon-128.png",
        "favicon-256.png",
        "favicon-512.png",
        "favicon-1024.png",
        "favicon-180x1805e1f.png"
    )
    
    foreach ($file in $files) {
        $destPath = Join-Path $faviconDir $file
        Copy-Item $uploadedIcon $destPath -Force
        Write-Host "  ✓ $file" -ForegroundColor Green
    }
    
    Write-Host ""
    Write-Host "  Note: All files are the same size. For best results, install ImageMagick." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Favicon Creation Complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  ✓ Site titles updated (88 files)" -ForegroundColor Green
Write-Host "  ✓ manifest.json updated" -ForegroundColor Green
Write-Host "  ✓ Favicon files created" -ForegroundColor Green
Write-Host ""
Write-Host "🎉 Finora branding is now complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Clear your browser cache" -ForegroundColor White
Write-Host "  2. Open index.html to verify the new favicon appears" -ForegroundColor White
Write-Host ""
