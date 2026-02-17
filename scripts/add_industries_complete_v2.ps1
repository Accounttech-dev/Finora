# Complete script to add Industries menu to all pages
# This adds both desktop and mobile menus

$rootPath = "c:\projects\Finora"

# Define pages with their relative depth for path calculation
$pagesConfig = @(
    @{Path="about-us\index.html"; Depth=1},
    @{Path="contact-us\index.html"; Depth=1},
    @{Path="services\ask-finora\index.html"; Depth=2},
    @{Path="services\bookkeeping\index.html"; Depth=2},
    @{Path="services\month-end-close\index.html"; Depth=2},
    @{Path="services\dashboards\index.html"; Depth=2},
    @{Path="services\financials\index.html"; Depth=2},
    @{Path="services\bill-pay\index.html"; Depth=2},
    @{Path="services\invoicing\index.html"; Depth=2},
    @{Path="services\business-setup\index.html"; Depth=2},
    @{Path="accountants\index.html"; Depth=1},
    @{Path="accountants\month-end-close\index.html"; Depth=2}
)

foreach ($pageConfig in $pagesConfig) {
    $filePath = Join-Path $rootPath $pageConfig.Path
    
    if (-not (Test-Path $filePath)) {
        Write-Host "File not found: $filePath" -ForegroundColor Red
        continue
    }
    
    Write-Host "`nProcessing: $filePath" -ForegroundColor Cyan
    
    # Determine services path based on depth
    if ($pageConfig.Depth -eq 1) {
        $servicesPath = "services"
        $relPath = "../services"
    } else {
        $servicesPath = "../services"
        $relPath = "../../services"
    }
    
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # Check if Industries menu already exists
    if ($content -match 'Industries <span class="top-nav-dropdown-icon"') {
        Write-Host "  Industries menu already exists, skipping..." -ForegroundColor Yellow
        continue
    }
    
    # ===== ADD DESKTOP MENU =====
    $desktopMenu = @"

            <li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>
              <span class="top-nav-link" data-astro-cid-e4bd7mep>Industries <span class="top-nav-dropdown-icon"
                  data-astro-cid-e4bd7mep></span></span>
              <div class="mega-menu">
                <div class="mega-column">
                  <div class="mega-title">E-commerce</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Healthcare</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Real Estate</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Retail</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Manufacturing</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
                <div class="mega-column">
                  <div class="mega-title">Food & Beverage</div>
                  <a href="$relPath/ask-finora/">Ask Finora</a>
                  <a href="$relPath/bookkeeping/">Real-time Bookkeeping</a>
                  <a href="$relPath/month-end-close/">Month-end Close</a>
                  <a href="$relPath/dashboards/">Insights & Dashboards</a>
                  <a href="$relPath/financials/">Financial Reporting</a>
                  <a href="$relPath/bill-pay/">Bill Pay</a>
                  <a href="$relPath/invoicing/">Invoicing</a>
                  <a href="$relPath/business-setup/">Business Setup</a>
                </div>
              </div>
            </li>

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
"@
    
    # Find and replace - add after Accountants menu closing </li>
    # Pattern to find the Accountants menu section
    $accountantsPattern = '(<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>\s*<span class="top-nav-link"\s+data-astro-cid-e4bd7mep>\s*Accountants.*?</ul>\s*</li>)'
    
    if ($content -match $accountantsPattern) {
        $content = $content -replace $accountantsPattern, "`$1$desktopMenu"
        Write-Host "  ✓ Added desktop Industries menu" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Could not find Accountants desktop menu" -ForegroundColor Red
    }
    
    # ===== ADD MOBILE MENU =====
    $mobileMenu = @"

            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a
                class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Industries <svg width="1em"
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
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin-bottom: 10px;">E-commerce</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin: 15px 0 10px 0;">Healthcare</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin: 15px 0 10px 0;">Real Estate</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin: 15px 0 10px 0;">Retail</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin: 15px 0 10px 0;">Manufacturing</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
                
                <li style="padding: 10px 20px; font-weight: 600; color: #000; border-bottom: 2px solid #6ecddd; margin: 15px 0 10px 0;">Food & Beverage</li>
                <li class="dropdown-item"> <a href="$relPath/ask-finora/" style="color: #000 !important;">Ask Finora</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bookkeeping/" style="color: #000 !important;">Real-time Bookkeeping</a> </li>
                <li class="dropdown-item"> <a href="$relPath/month-end-close/" style="color: #000 !important;">Month-end Close</a> </li>
                <li class="dropdown-item"> <a href="$relPath/dashboards/" style="color: #000 !important;">Insights & Dashboards</a> </li>
                <li class="dropdown-item"> <a href="$relPath/financials/" style="color: #000 !important;">Financial Reporting</a> </li>
                <li class="dropdown-item"> <a href="$relPath/bill-pay/" style="color: #000 !important;">Bill Pay</a> </li>
                <li class="dropdown-item"> <a href="$relPath/invoicing/" style="color: #000 !important;">Invoicing</a> </li>
                <li class="dropdown-item"> <a href="$relPath/business-setup/" style="color: #000 !important;">Business Setup</a> </li>
              </ul>
            </li>
"@
    
    # Find mobile Accountants menu and add Industries after it
    $mobileAccountantsPattern = '(<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>\s*<a[^>]*class="top-nav-mobile-link-dropdown"[^>]*>\s*Accountants.*?</ul>\s*</li>)'
    
    if ($content -match $mobileAccountantsPattern) {
        $content = $content -replace $mobileAccountantsPattern, "`$1$mobileMenu"
        Write-Host "  ✓ Added mobile Industries menu" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Could not find Accountants mobile menu" -ForegroundColor Red
    }
    
    # Save the file
    Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
    Write-Host "  ✓ File saved successfully!" -ForegroundColor Green
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "All pages processed!" -ForegroundColor Green
Write-Host "========================================`n" -ForegroundColor Cyan
