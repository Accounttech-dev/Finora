# PowerShell script to replace header logo with AI Finora logo image
# This script replaces the entire logo section with an img tag pointing to the logo

# Define patterns to find and replace
# The old logo section with SVG symbols
$oldLogoPattern = '<span class="header-logo-mark" data-astro-cid-yfxihdp7><svg width="30" height="30" data-astro-cid-yfxihdp7="true" data-icon="header-icons/digits-logo-mark">   <symbol id="ai:local:header-icons/digits-logo-mark" viewBox="0 0 100 100"><defs><linearGradient id="finora-gradient" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" style="stop-color:#4A90B8"/><stop offset="100%" style="stop-color:#2E6B8A"/></linearGradient></defs><path fill="url(#finora-gradient)" d="M45 8c-20.4 0-37 16.6-37 37s16.6 37 37 37c2.8 0 5.5-0.3 8.1-0.9C38.9 77.5 28 64.5 28 49c0-0.7 0-1.4 0.1-2.1C30.3 29.5 45.7 16 64 16c2.8 0 5.5 0.3 8.1 0.9C65.9 11.3 56.1 8 45 8z"/><circle fill="currentColor" cx="38" cy="58" r="8"/><path fill="url(#finora-gradient)" d="M64 16c-18.3 0-33.7 13.5-35.9 30.9C28 47.6 28 48.3 28 49c0 15.5 10.9 28.5 25.1 32.1c2.6 0.6 5.3 0.9 8.1 0.9c20.4 0 37-16.6 37-37S84.4 16 64 16z M71 65c-1.5 0-2.8-0.5-3.9-1.3l-0.1 0.1c-3.2 2.4-7.2 3.8-11.5 3.8c-10.5 0-19-8.5-19-19s8.5-19 19-19c4.3 0 8.3 1.4 11.5 3.8l0.1 0.1c1.1-0.8 2.4-1.3 3.9-1.3c3.6 0 6.5 2.9 6.5 6.5c0 2.4-1.3 4.5-3.2 5.6c0.7 2 1.1 4.1 1.1 6.3c0 2.2-0.4 4.3-1.1 6.3c1.9 1.1 3.2 3.2 3.2 5.6C77.5 62.1 74.6 65 71 65z"/><text x="52" y="25" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#74C4DD">ai</text></symbol><use href="#ai:local:header-icons/digits-logo-mark"></use>  </svg></span> <span class="header-logo-text" data-astro-cid-yfxihdp7><svg width="64" height="30" data-astro-cid-yfxihdp7="true" data-icon="header-icons/digits-logo-text">   <symbol id="ai:local:header-icons/digits-logo-text" viewBox="0 0 212 100"><defs><linearGradient id="ai-text-gradient" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" style="stop-color:#74C4DD"/><stop offset="100%" style="stop-color:#5BA8C0"/></linearGradient></defs><text x="0" y="58" font-family="Arial, sans-serif" font-size="42" font-weight="bold" fill="url(#ai-text-gradient)">AI</text><text x="50" y="58" font-family="Arial, sans-serif" font-size="42" font-weight="bold" fill="#2E5C8A">FINORA</text></symbol><use href="#ai:local:header-icons/digits-logo-text"></use>  </svg></span>'

# Replacement with proper AI Finora logo image
$newLogo = '<img src="a-images/ai-finora-logo.png" alt="AI Finora" height="30" style="height: 30px; width: auto;">'

# Get all HTML files recursively
$htmlFiles = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse

$totalFiles = $htmlFiles.Count
$modifiedFiles = 0

Write-Host "Found $totalFiles HTML files to process..."

foreach ($file in $htmlFiles) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Replace the entire logo section
        if ($content -match [regex]::Escape($oldLogoPattern)) {
            $content = $content -replace [regex]::Escape($oldLogoPattern), $newLogo
        }
        
        # Check if content was modified
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
            $modifiedFiles++
            Write-Host "Updated: $($file.FullName)"
        }
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "`nCompleted! Modified $modifiedFiles out of $totalFiles files."
