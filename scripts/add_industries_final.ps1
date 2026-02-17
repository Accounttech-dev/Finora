# Script to add Industries mobile menu to remaining pages
$ErrorActionPreference = "Stop"

# The Industries menu HTML (with PATHPREFIX placeholder)
$menuTemplate = @"
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
                      Insights &amp; Dashboards</a>
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
                      Insights &amp; Dashboards</a>
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
                      Insights &amp; Dashboards</a>
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
                      Insights &amp; Dashboards</a>
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
                      Insights &amp; Dashboards</a>
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
                      Insights &amp; Dashboards</a>
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

"@

function Get-PathPrefix {
    param([string]$FilePath)
    $relativePath = $FilePath.Replace("C:\projects\Finora\", "").Replace("\", "/")
    $depth = ($relativePath -split "/").Count - 1
    
    if ($depth -eq 0) { return "/" }
    elseif ($depth -eq 1) { return "../" }
    elseif ($depth -eq 2) { return "../../" }
    else { return ("../" * $depth) }
}

function Add-IndustriesMenu {
    param([string]$FilePath)
    
    Write-Host "Processing: $FilePath"
    
    $content = Get-Content $FilePath -Raw -Encoding UTF8
    
    # Check if already exists
    if ($content -match 'Industries.*?mobile-nav-pointer-right') {
        Write-Host "  Already exists"
        return
    }
    
    # Get path prefix
    $pathPrefix = Get-PathPrefix -FilePath $FilePath
    $menuHtml = $menuTemplate -replace 'PATHPREFIX', $pathPrefix
    
    # Find insertion point
    $marker = '            </li>' + "`r`n" + '            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a' + "`r`n" + '                class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Resources'
    
    if ($content -match [regex]::Escape($marker)) {
        $newContent = $content -replace [regex]::Escape($marker), ($menuHtml + $marker)
        Set-Content -Path $FilePath -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "  Added Industries menu"
    } else {
        Write-Host "  ERROR: Could not find insertion point"
    }
}

# Get all files
$files = @()
$files += Get-ChildItem -Path "C:\projects\Finora\services" -Filter "index.html" -Recurse | Select-Object -ExpandProperty FullName
$files += Get-ChildItem -Path "C:\projects\Finora\accountants" -Filter "index.html" -Recurse | Select-Object -ExpandProperty FullName
$files += "C:\projects\Finora\contact-us\index.html"

# Process each file
$count = 0
foreach ($file in $files) {
    if (Test-Path $file) {
        Add-IndustriesMenu -FilePath $file
        $count++
    }
}

Write-Host "`nDone! Processed $count files"
