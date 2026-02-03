# Script to update footer content across all HTML files
# Updates text content and removes specific href links

Write-Host "Starting footer update..." -ForegroundColor Cyan

# Get all HTML files
$files = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -File | Where-Object { $_.DirectoryName -notmatch 'node_modules|\.git' }

Write-Host "Found $($files.Count) HTML files to process" -ForegroundColor Cyan

$filesUpdated = 0

foreach ($file in $files) {
    Write-Host "`nProcessing: $($file.Name)" -ForegroundColor Yellow
    
    try {
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        $originalContent = $content
        
        # 1. Replace "Our Ai Technology" with "Real-time Bookkeeping"
        $content = $content -replace 'Our Ai Technology', 'Real-time Bookkeeping'
        
        # 2. Replace "Bank Grade Security" with "Month-end Close Automation"
        $content = $content -replace 'Bank Grade\s+Security', 'Month-end Close Automation'
        
        # 3. Replace "Real Time Integration" link with "About Us" span
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Real Time\s+Integration\s*</a>', '<span class="footer-nav-link header-h3-style">About Us</span>'
        
        # 4. Remove href from W-2 & 1099 Filing Deadline
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*w2-1099[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(W-2 &amp; 1099 Filing Deadline.*?)</a>\s*</li>', '$1</span> </li>'
        
        # 5. Remove href from Partnerships & S Corporations
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*partnership[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(Partnerships &amp; S Corporations.*?)</a>\s*</li>', '$1</span> </li>'
        
        # 6. Remove href from C Corporations & Sole Proprietors
        $content = $content -replace '<a\s+class="deadline-link"\s+href="a-ics/[^"]*c-corporation[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>', '<span class="deadline-link" data-astro-cid-csx6xpza>'
        $content = $content -replace '(C Corporations &amp; Sole Proprietors.*?)</a>\s*</li>', '$1</span> </li>'
        
        # 7. Remove href from Terms of Service
        $content = $content -replace '<a\s+href="https://my\.digits\.com/legal/terms-of-service"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Terms of Service\s*</a>', '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Terms of Service</span>'
        
        # 8. Remove href from Privacy Policy
        $content = $content -replace '<a\s+href="https://my\.digits\.com/legal/privacy-policy"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Privacy Policy\s*</a>', '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Privacy Policy</span>'
        
        # 9. Remove href from Accountant Directory
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="https://accountants\.digits\.com/"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Accountant Directory\s*</a>', '<span class="footer-nav-link header-h3-style">Accountant Directory</span>'
        
        # 10. Remove href from Integration Partners
        $content = $content -replace '<a\s+class="footer-nav-link header-h3-style"\s+href="integrations/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*</a>', '<span class="footer-nav-link header-h3-style">Integration Partners</span>'
        
        # Save if changed
        if ($content -ne $originalContent) {
            [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
            Write-Host "  ✓ File updated successfully" -ForegroundColor Green
            $filesUpdated++
        } else {
            Write-Host "  - No changes needed" -ForegroundColor Gray
        }
    }
    catch {
        Write-Host "  ✗ Error processing file: $_" -ForegroundColor Red
    }
}

Write-Host "`n✓ Footer update completed!" -ForegroundColor Cyan
Write-Host "Total files processed: $($files.Count)" -ForegroundColor Cyan
Write-Host "Files updated: $filesUpdated" -ForegroundColor Cyan
