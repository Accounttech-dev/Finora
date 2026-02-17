# PowerShell script to add Industries menu to all HTML files - Version 2
$rootPath = "c:\projects\Finora"

# Count of files processed
$updatedCount = 0
$skippedCount = 0
$errorCount = 0

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $rootPath -Filter "*.html" -Recurse | Where-Object { $_.FullName -notmatch '\\node_modules\\' }

Write-Host "Found $($htmlFiles.Count) HTML files to process..." -ForegroundColor Cyan

foreach ($file in $htmlFiles) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Check if file has the header structure (contains Accountants menu)
        if ($content -notmatch 'Accountants\s*<span class="top-nav-dropdown-icon"') {
            continue
        }
        
        # Check if Industries menu already exists
        if ($content -match 'Industries\s*<span class="top-nav-dropdown-icon"') {
            Write-Host "Skipped (already has Industries): $($file.FullName)" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Define the Industries menu to insert
        $industriesMenu = @'
            
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
        
        # Find the Accountants section and insert Industries menu after it
        # Pattern: Find closing </li> after Accountants section, then insert before the next section
        $pattern = '(<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Accountants.*?</li>)'
        
        if ($content -match $pattern) {
            $newContent = $content -replace $pattern, "`$1$industriesMenu"
            
            # Save the file
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
            $updatedCount++
        } else {
            Write-Host "Skipped (pattern not found): $($file.FullName)" -ForegroundColor Yellow
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
