# Script to add Industries mobile menu to all pages
$ErrorActionPreference = "Stop"

# Read the template
$templatePath = "C:\projects\Finora\scripts\industries_mobile_menu_template.html"
$template = Get-Content $templatePath -Raw -Encoding UTF8

# Function to determine path prefix
function Get-PathPrefix {
    param([string]$FilePath)
    $relativePath = $FilePath.Replace("C:\projects\Finora\", "").Replace("\", "/")
    $depth = ($relativePath -split "/").Count - 1
    
    if ($depth -eq 0) { return "/" }
    elseif ($depth -eq 1) { return "../" }
    elseif ($depth -eq 2) { return "../../" }
    else { return ("../" * $depth) }
}

# Function to add Industries menu
function Add-IndustriesMenu {
    param([string]$FilePath)
    
    Write-Host "Processing: $FilePath"
    
    $content = Get-Content $FilePath -Raw -Encoding UTF8
    
    # Check if already exists
    if ($content -match 'top-nav-mobile-link-dropdown.*?Industries') {
        Write-Host "  ✓ Already exists, skipping"
        return
    }
    
    # Get path prefix and update template
    $pathPrefix = Get-PathPrefix -FilePath $FilePath
    $menuHtml = $template -replace 'PATHPREFIX', $pathPrefix
    
    # Find insertion point - before Resources dropdown
    $beforeText = '            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a'
    $searchText = 'class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Resources'
    
    $pos = $content.IndexOf($beforeText)
    if ($pos -eq -1) {
        Write-Host "  ✗ Could not find insertion point"
        return
    }
    
    # Find the exact position where Resources dropdown starts
    $searchPos = $content.IndexOf($searchText, $pos)
    if ($searchPos -eq -1) {
        Write-Host "  ✗ Could not find Resources dropdown"
        return
    }
    
    # Go back to find the start of the <li> tag
    $insertPos = $content.LastIndexOf('<li class="top-nav-mobile-item top-nav-mobile-dropdown"', $searchPos)
    
    # Insert the menu
    $newContent = $content.Insert($insertPos, $menuHtml + "`r`n")
    
    Set-Content -Path $FilePath -Value $newContent -Encoding UTF8 -NoNewline
    Write-Host "  ✓ Added Industries mobile menu"
}

# Get all target files
$targetFiles = @()

# About Us
if (Test-Path "C:\projects\Finora\about-us\index.html") {
    $targetFiles += "C:\projects\Finora\about-us\index.html"
}

# Services
if (Test-Path "C:\projects\Finora\services") {
    $servicePages = Get-ChildItem -Path "C:\projects\Finora\services" -Filter "index.html" -Recurse
    $targetFiles += $servicePages.FullName
}

# Accountants
if (Test-Path "C:\projects\Finora\accountants") {
    $accountantPages = Get-ChildItem -Path "C:\projects\Finora\accountants" -Filter "index.html" -Recurse
    $targetFiles += $accountantPages.FullName
}

# Contact Us
if (Test-Path "C:\projects\Finora\contact-us\index.html") {
    $targetFiles += "C:\projects\Finora\contact-us\index.html"
}

# Process all files
$processedCount = 0
foreach ($file in $targetFiles) {
    if (Test-Path $file) {
        Add-IndustriesMenu -FilePath $file
        $processedCount++
    }
}

Write-Host "`n✓ Processed $processedCount files"
Write-Host "Industries mobile menu has been added!"
