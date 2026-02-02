# Remove orphaned dropdown items that appear after "About Us" link
# These are remnants from the old "Why Finora" dropdown

$htmlFiles = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse | Where-Object {
    $_.FullName -notlike "*\node_modules\*" -and
    $_.FullName -notlike "*\.git\*"
}

Write-Host "Found $($htmlFiles.Count) HTML files to process." -ForegroundColor Cyan

$updatedCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Pattern 1: Remove the closing </ul></li> that might be left from old dropdown structure
    $content = $content -replace '\s*</ul>\s*</li><li class="top-nav-item top-nav-dropdown"', '<li class="top-nav-item top-nav-dropdown"'
    
    # Pattern 2: Remove orphaned dropdown items (Bank-grade Security, About Us/Integrations, Developer API)
    # These appear as standalone <li class="dropdown-item"> after the About Us link closes
    $content = $content -replace '</li><li class="dropdown-item">\s*<a href="[^"]*security[^"]*"[^>]*>.*?</a>\s*</li>', '</li>'
    $content = $content -replace '</li><li class="dropdown-item">\s*<a href="[^"]*integrations[^"]*"[^>]*>.*?</a>\s*</li>', '</li>'
    $content = $content -replace '</li><li class="dropdown-item">\s*<a href="[^"]*api[^"]*"[^>]*>.*?</a>\s*</li>', '</li>'
    
    # Pattern 3: Remove any standalone dropdown-item that appears between About Us and Services
    $pattern = @"
(?<=</li>)(\s*<li class="dropdown-item">.*?</li>){1,3}(?=<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Services)
"@
    $content = $content -replace $pattern, ''
    
    # Pattern 4: Also remove the orphaned </ul> tag if it exists
    $content = $content -replace '\s*</ul>\s*</li><li class="top-nav-item top-nav-dropdown"', '<li class="top-nav-item top-nav-dropdown"'
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
        $updatedCount++
    }
}

Write-Host "`nTotal files updated: $updatedCount" -ForegroundColor Cyan
Write-Host "Script execution completed!" -ForegroundColor Green
