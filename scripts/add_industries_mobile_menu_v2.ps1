# Script to add Industries mobile menu to all pages
# This adds the mobile Industries menu section that's missing from various pages

$ErrorActionPreference = "Stop"

# Function to add Industries mobile menu to a file
function Add-IndustriesMobileMenu {
    param([string]$FilePath)
    
    Write-Host "Processing: $FilePath"
    
    $content = Get-Content $FilePath -Raw -Encoding UTF8
    
    # Check if Industries mobile menu already exists
    if ($content -match 'top-nav-mobile-link-dropdown.*?Industries') {
        Write-Host "  ✓ Industries mobile menu already exists, skipping..."
        return
    }
    
    # Determine the correct path prefix based on file location
    $relativePath = $FilePath.Replace("C:\projects\Finora\", "").Replace("\", "/")
    $depth = ($relativePath -split "/").Count - 1
    
    if ($depth -eq 0) {
        $pathPrefix = "/"
    } elseif ($depth -eq 1) {
        $pathPrefix = "../"
    } elseif ($depth -eq 2) {
        $pathPrefix = "../../"
    } else {
        $pathPrefix = "../" * $depth
    }
    
    # Read the Industries menu template from the home page
    $homePageContent = Get-Content "C:\projects\Finora\index.html" -Raw -Encoding UTF8
    
    # Extract the Industries mobile menu from home page
    if ($homePageContent -match '(?s)(<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a\s+class="top-nav-mobile-link-dropdown"[^>]*>Industries.*?</li>\s*</ul>\s*</li>)') {
        $industriesMenu = $matches[1]
        
        # Replace path prefixes
        $industriesMenu = $industriesMenu -replace 'href="/services/', "href=`"$pathPrefix`services/"
        
        # Find the insertion point - after Accountants dropdown and before Resources dropdown
        $pattern = '(\s*</li>\s*<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a\s+class="top-nav-mobile-link-dropdown"[^>]*>\s*Resources)'
        
        if ($content -match $pattern) {
            $content = $content -replace $pattern, "`r`n`r`n            $industriesMenu`r`n`$1"
            Set-Content -Path $FilePath -Value $content -Encoding UTF8 -NoNewline
            Write-Host "  ✓ Added Industries mobile menu"
        } else {
            Write-Host "  ✗ Could not find insertion point (Resources dropdown)"
        }
    } else {
        Write-Host "  ✗ Could not extract Industries menu from home page"
    }
}

# Get all target files
$targetFiles = @()

# About Us page
if (Test-Path "C:\projects\Finora\about-us\index.html") {
    $targetFiles += "C:\projects\Finora\about-us\index.html"
}

# All service pages
if (Test-Path "C:\projects\Finora\services") {
    $servicePages = Get-ChildItem -Path "C:\projects\Finora\services" -Filter "index.html" -Recurse
    $targetFiles += $servicePages.FullName
}

# All accountant pages  
if (Test-Path "C:\projects\Finora\accountants") {
    $accountantPages = Get-ChildItem -Path "C:\projects\Finora\accountants" -Filter "index.html" -Recurse
    $targetFiles += $accountantPages.FullName
}

# Contact Us page
if (Test-Path "C:\projects\Finora\contact-us\index.html") {
    $targetFiles += "C:\projects\Finora\contact-us\index.html"
}

# Process all files
$processedCount = 0
foreach ($file in $targetFiles) {
    if (Test-Path $file) {
        Add-IndustriesMobileMenu -FilePath $file
        $processedCount++
    }
}

Write-Host "`n✓ Processed $processedCount files"
Write-Host "Industries mobile menu has been added to all required pages!"
