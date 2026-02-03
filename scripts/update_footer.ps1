# Script to update footer content across all HTML files
# Updates text content and removes specific href links

$ErrorActionPreference = "Stop"

# Get all HTML files
$files = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse -File

Write-Host "Found $($files.Count) HTML files to process" -ForegroundColor Cyan

foreach ($file in $files) {
    Write-Host "`nProcessing: $($file.Name)" -ForegroundColor Yellow
    
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    $changed = $false
    
    # 1. Replace "Our Ai Technology" with "Real-time Bookkeeping"
    if ($content -match 'Our Ai Technology') {
        $content = $content -replace 'Our Ai Technology', 'Real-time Bookkeeping'
        Write-Host "  ✓ Replaced 'Our Ai Technology' with 'Real-time Bookkeeping'" -ForegroundColor Green
        $changed = $true
    }
    
    # 2. Replace "Bank Grade Security" with "Month-end Close Automation"
    if ($content -match 'Bank Grade Security') {
        $content = $content -replace 'Bank Grade\s+Security', 'Month-end Close Automation'
        Write-Host "  ✓ Replaced 'Bank Grade Security' with 'Month-end Close Automation'" -ForegroundColor Green
        $changed = $true
    }
    
    # 3. Replace "Real Time Integration" link with "About Us" span (remove href)
    if ($content -match 'Real Time\s+Integration') {
        # Find and replace the anchor tag with a span
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Real Time\s+Integration\s*</a>', '<span class="footer-nav-link header-h3-style">About Us</span>'
        Write-Host "  ✓ Replaced 'Real Time Integration' link with 'About Us' text" -ForegroundColor Green
        $changed = $true
    }
    
    # 4. Remove href from deadline items (convert a tags to spans)
    # W-2 & 1099 Filing Deadline
    if ($content -match 'W-2 &amp; 1099 Filing Deadline') {
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*w2-1099[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(W-2 &amp; 1099 Filing Deadline.*?)</a>\s*</li>', '$1</span> </li>'
        Write-Host "  ✓ Removed href from 'W-2 & 1099 Filing Deadline'" -ForegroundColor Green
        $changed = $true
    }
    
    # Partnerships & S Corporations
    if ($content -match 'Partnerships &amp; S Corporations') {
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*partnership[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(Partnerships &amp; S Corporations.*?)</a>\s*</li>', '$1</span> </li>'
        Write-Host "  ✓ Removed href from 'Partnerships & S Corporations'" -ForegroundColor Green
        $changed = $true
    }
    
    # C Corporations & Sole Proprietors
    if ($content -match 'C Corporations &amp; Sole Proprietors') {
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*c-corporation[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(C Corporations &amp; Sole Proprietors.*?)</a>\s*</li>', '$1</span> </li>'
        Write-Host "  ✓ Removed href from 'C Corporations & Sole Proprietors'" -ForegroundColor Green
        $changed = $true
    }
    
    # 5. Remove href from "Terms of Service" (convert to span)
    if ($content -match 'Terms of Service') {
        $content = $content -replace '<a\s+href="https://my\.digits\.com/legal/terms-of-service"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Terms of Service\s*</a>', '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Terms of Service</span>'
        Write-Host "  ✓ Removed href from 'Terms of Service'" -ForegroundColor Green
        $changed = $true
    }
    
    # 6. Remove href from "Privacy Policy" (convert to span)
    if ($content -match 'Privacy Policy') {
        $content = $content -replace '<a\s+href="https://my\.digits\.com/legal/privacy-policy"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Privacy Policy\s*</a>', '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Privacy Policy</span>'
        Write-Host "  ✓ Removed href from 'Privacy Policy'" -ForegroundColor Green
        $changed = $true
    }
    
    # 7. Remove href from "Accountant Directory" (convert to span)
    if ($content -match 'Accountant Directory') {
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="https://accountants\.digits\.com/"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Accountant Directory\s*</a>', '<span class="footer-nav-link header-h3-style">Accountant Directory</span>'
        Write-Host "  ✓ Removed href from 'Accountant Directory'" -ForegroundColor Green
        $changed = $true
    }
    
    # 8. Remove href from "Integration Partners" (convert to span)
    if ($content -match 'Integration Partners') {
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="integrations/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*</a>', '<span class="footer-nav-link header-h3-style">Integration Partners</span>'
        Write-Host "  ✓ Removed href from 'Integration Partners'" -ForegroundColor Green
        $changed = $true
    }
    
    # Save changes if content was modified
    if ($changed) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "  ✓ File updated successfully" -ForegroundColor Green
    } else {
        Write-Host "  - No footer changes needed" -ForegroundColor Gray
    }
}

Write-Host "`n✓ Footer update completed!" -ForegroundColor Cyan
Write-Host "Total files processed: $($files.Count)" -ForegroundColor Cyan
