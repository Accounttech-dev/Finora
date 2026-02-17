# PowerShell script to add Industries menu to all HTML files
$rootPath = "c:\projects\Finora"

# Count of files processed
$updatedCount = 0
$skippedCount = 0
$errorCount = 0

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $rootPath -Filter "*.html" -Recurse | Where-Object { $_.FullName -notmatch '\\node_modules\\' }

Write-Host "Found $($htmlFiles.Count) HTML files to process..." -ForegroundColor Cyan

# Define the Industries menu HTML to insert (Desktop version)
$industriesMenuDesktop = @'
            
            <li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>
              <span class="top-nav-link" data-astro-cid-e4bd7mep>Industries <span class="top-nav-dropdown-icon" data-astro-cid-e4bd7mep></span></span>
              <div class="mega-menu">
                <div class="mega-column">
                  <div class="mega-title">E-commerce</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Healthcare</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Real Estate</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Retail</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Manufacturing</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Food & Beverage</div>
                  <a href="/services/ask-finora/">Ask Finora</a>
                  <a href="/services/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="/services/month-end-close/">Month-end Close</a>
                  <a href="/services/dashboards/">Insights & Dashboards</a>
                  <a href="/services/financials/">Financial Reporting</a>
                  <a href="/services/bill-pay/">Bill Pay</a>
                  <a href="/services/invoicing/">Invoicing</a>
                  <a href="/services/business-setup/">Business Setup</a>
                </div>
              </div>
            </li>
'@

# Define the Industries menu HTML to insert (Mobile version)
$industriesMenuMobile = @'
            
            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>
              <a class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv>Industries <svg width="1em" height="1em" viewBox="0 0 16 16" data-astro-cid-u5h4fmsv="true" data-icon="header-icons/mobile-nav-pointer-right">
                <use href="#ai:local:header-icons/mobile-nav-pointer-right"></use>
              </svg> </a>
              <ul class="dropdown-menu">
                <li> <a class="top-nav-mobile-back-btn" role="button"> <svg width="1em" height="1em" viewBox="0 0 16 16" data-icon="header-icons/mobile-nav-pointer-left">
                  <use href="#ai:local:header-icons/mobile-nav-pointer-left"></use>
                </svg>
                Back
                </a> </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">E-commerce</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">Healthcare</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">Real Estate</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">Retail</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px; border-bottom: 1px solid rgba(255,255,255,0.1);">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">Manufacturing</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
                
                <li class="dropdown-item">
                  <div style="padding: 20px;">
                    <div style="font-weight: 700; font-size: 16px; color: #6ecddd; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 0.5px;">Food & Beverage</div>
                    <a href="/services/ask-finora/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Ask Finora</a>
                    <a href="/services/bookkeeping/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Real-time Bookkeeping</a>
                    <a href="/services/month-end-close/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Month-end Close</a>
                    <a href="/services/dashboards/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Insights & Dashboards</a>
                    <a href="/services/financials/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Financial Reporting</a>
                    <a href="/services/bill-pay/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Bill Pay</a>
                    <a href="/services/invoicing/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px; border-bottom: 1px solid rgba(255,255,255,0.05);">→ Invoicing</a>
                    <a href="/services/business-setup/" style="display: block; padding: 10px 0; color: #000; text-decoration: none; font-size: 14px;">→ Business Setup</a>
                  </div>
                </li>
              </ul>
            </li>
'@

# CSS styles for mega menu
$megaMenuStyles = @'

            <style>
              .top-nav-dropdown {
                position: relative;
              }

              .mega-menu {
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                width: 1100px;
                max-width: 95vw;
                background: white;
                display: flex;
                gap: 20px;
                padding: 25px 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                opacity: 0;
                visibility: hidden;
                transition: all 0.25s ease;
                z-index: 999;
                border-radius: 8px;
              }

              .top-nav-dropdown:hover .mega-menu {
                opacity: 1;
                visibility: visible;
              }

              .mega-column {
                display: flex;
                flex-direction: column;
                min-width: 140px;
                flex: 1;
              }

              .mega-title {
                font-weight: 600;
                margin-bottom: 10px;
                font-size: 14px;
                color: #000;
                border-bottom: 2px solid #6ecddd;
                padding-bottom: 8px;
              }

              .mega-column a {
                text-decoration: none;
                color: #444;
                font-size: 12px;
                margin: 3px 0;
                padding: 4px 8px;
                border-radius: 4px;
                transition: all 0.2s ease;
              }

              .mega-column a:hover {
                color: #000;
                background: rgba(110, 205, 221, 0.1);
              }
              
              /* Mobile menu service text colors */
              .dropdown-link-title {
                color: #000 !important;
              }
              
              .dropdown-link-desc {
                color: #666 !important;
              }
            </style>
'@

foreach ($file in $htmlFiles) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Skip if already has Industries menu
        if ($content -match 'Industries\s*<span class="top-nav-dropdown-icon"') {
            Write-Host "Skipped (already has Industries): $($file.FullName)" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Check if file has the Accountants section (desktop navigation)
        if ($content -match '(<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Accountants.*?</ul>\s*</li>)') {
            # Add desktop Industries menu after Accountants
            $content = $content -replace '(<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Accountants.*?</ul>\s*</li>)', "`$1$industriesMenuDesktop"
            
            # Add CSS styles if not already present
            if ($content -notmatch '\.mega-menu\s*\{') {
                # Find the closing </li> after Accountants and add styles before Resources section
                $content = $content -replace '(</li>\s*<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<ul class="dropdown-menu">)', "$megaMenuStyles`$1"
            }
            
            # Add mobile Industries menu after mobile Accountants section
            if ($content -match '(<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a[^>]*class="top-nav-mobile-link-dropdown"[^>]*>\s*Accountants.*?</ul>\s*</li>)') {
                $content = $content -replace '(<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a[^>]*class="top-nav-mobile-link-dropdown"[^>]*>\s*Accountants.*?</ul>\s*</li>)', "`$1$industriesMenuMobile"
            }
            
            # Save the file
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
            Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
            $updatedCount++
        } else {
            Write-Host "Skipped (no Accountants section found): $($file.FullName)" -ForegroundColor Yellow
            $skippedCount++
        }
        
    } catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host "`n========== Summary ==========" -ForegroundColor Cyan
Write-Host "Updated: $updatedCount files" -ForegroundColor Green
Write-Host "Skipped: $skippedCount files" -ForegroundColor Yellow
Write-Host "Errors: $errorCount files" -ForegroundColor Red
Write-Host "=============================" -ForegroundColor Cyan
