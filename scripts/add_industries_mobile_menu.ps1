# Script to add Industries mobile menu to all pages
# This adds the mobile Industries menu section that's missing from various pages

$ErrorActionPreference = "Stop"

# Define the Industries mobile menu HTML block
$industriesMobileMenu = @'

            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>
              <a class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv>Industries <svg width="1em"
                  height="1em" viewBox="0 0 16 16" data-astro-cid-u5h4fmsv="true"
                  data-icon="header-icons/mobile-nav-pointer-right">
                  <use href="#ai:local:header-icons/mobile-nav-pointer-right"></use>
                </svg> </a>
              <ul class="dropdown-menu">
                <li> <a class="top-nav-mobile-back-btn" role="button"> <svg width="1em" height="1em" viewBox="0 0 16 16"
                      data-icon="header-icons/mobile-nav-pointer-left">
                      <use href="#ai:local:header-icons/mobile-nav-pointer-left"></use>
                    </svg>
                    Back
                  </a> </li>

                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      E-commerce</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>

                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      Healthcare</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>

                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      Real Estate</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>

                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      Retail</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>

                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      Manufacturing</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>

                <li class="dropdown-item">
                  <div style="padding: 20px;">
                    <div
                      style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">
                      Food &amp; Beverage</div>
                    <a href="PATHPREFIX/services/ask-finora/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Ask Finora</a>
                    <a href="PATHPREFIX/services/bookkeeping/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Real-time Bookkeeping</a>
                    <a href="PATHPREFIX/services/month-end-close/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Month-end Close</a>
                    <a href="PATHPREFIX/services/dashboards/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Insights & Dashboards</a>
                    <a href="PATHPREFIX/services/financials/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Financial Reporting</a>
                    <a href="PATHPREFIX/services/bill-pay/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Bill Pay</a>
                    <a href="PATHPREFIX/services/invoicing/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→
                      Invoicing</a>
                    <a href="PATHPREFIX/services/business-setup/"
                      style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→
                      Business Setup</a>
                  </div>
                </li>
              </ul>
            </li>
'@

# Function to determine the correct path prefix based on file location
function Get-PathPrefix {
    param([string]$FilePath)
    
    $relativePath = $FilePath.Replace("$PSScriptRoot\..\", "").Replace("\", "/")
    
    # Count directory depth
    $depth = ($relativePath -split "/").Count - 1
    
    if ($depth -eq 0) {
        return "/"
    } elseif ($depth -eq 1) {
        return "../"
    } elseif ($depth -eq 2) {
        return "../../"
    } else {
        return "../" * $depth
    }
}

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
    
    # Determine the correct path prefix
    $pathPrefix = Get-PathPrefix -FilePath $FilePath
    $menuHtml = $industriesMobileMenu -replace 'PATHPREFIX', $pathPrefix
    
    # Find the insertion point - after Accountants dropdown and before Resources dropdown
    $pattern = '(\s*</li>\s*<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a\s+class="top-nav-mobile-link-dropdown"[^>]*>\s*Resources)'
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, "$menuHtml`r`n`$1"
        Set-Content -Path $FilePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "  ✓ Added Industries mobile menu"
    } else {
        Write-Host "  ✗ Could not find insertion point (Resources dropdown)"
    }
}

# Get all target files
$targetFiles = @()

# About Us page
$targetFiles += "C:\projects\Finora\about-us\index.html"

# All service pages
$servicePages = Get-ChildItem -Path "C:\projects\Finora\services" -Filter "index.html" -Recurse
$targetFiles += $servicePages.FullName

# All accountant pages  
$accountantPages = Get-ChildItem -Path "C:\projects\Finora\accountants" -Filter "index.html" -Recurse
$targetFiles += $accountantPages.FullName

# Contact Us page
$targetFiles += "C:\projects\Finora\contact-us\index.html"

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
