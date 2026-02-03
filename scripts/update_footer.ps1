# Update footer links and inject CSS across all HTML files
$Mappings = @{
    'Latest News' = @{ text='Our Ai Technology'; href='/agl/' }
    'Changelog' = @{ text='Bank Grade Security'; href='/security/' }
    'Developer API' = @{ text='Real Time Integration'; href='/integrations/' }
}
$css = '@media (min-width: 1200px) { .footer-menu-container .footer-nav-link.header-h3-style { font-size: 1.6rem; } }'

$files = Get-ChildItem -Path . -Recurse -Filter *.html -File
$changed = @()

foreach ($f in $files) {
    try {
        $s = Get-Content -Raw -Encoding UTF8 -Path $f.FullName
    } catch {
        continue
    }
    $orig = $s

    foreach ($key in $Mappings.Keys) {
        $textEscaped = [Regex]::Escape($key)
        $replacementText = $Mappings[$key].text
        $replacementHref = $Mappings[$key].href
        $pattern = '<a\b([^>]*class\s*=\s*"[^"]*footer-nav-link[^"]*"[^>]*)\bhref\s*=\s*"[^"]*"([^>]*)>\s*' + $textEscaped + '\s*</a>'
        $repl = '<a$1 href="' + $replacementHref + '"$2> ' + $replacementText + ' </a>'
        $s = [Regex]::Replace($s, $pattern, $repl, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    }

    if ($s -notmatch [Regex]::Escape($css)) {
        if ($s -match '(?i)</body>') {
            $s = $s -replace '(?i)</body>', "<style>$css</style>`n</body>"
        } else {
            $s = $s + "`n<style>$css</style>`n"
        }
    }

$css2 = '@media (min-width: 1025px) { .header-h3-style, h3 { font-size: 1.9rem; font-weight: 300; letter-spacing: -.025rem; line-height: 110%; } }'

    # Remove any previously-inserted header CSS block to avoid duplicates
    $css2Pattern = '(?is)<style>\s*@media\s*\(min-width:\s*1025px\)[\s\S]*?\}</style>'
    $s = [Regex]::Replace($s, $css2Pattern, '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

    # Add header CSS only to pricing or faq pages
    if ($f.FullName -match '(?i)\\pricing\\|(?i)\\faq\\|(?i)\\pricing\\index.html|(?i)\\faq\\index.html') {
        if ($s -notmatch [Regex]::Escape($css2)) {
            if ($s -match '(?i)</body>') {
                $s = $s -replace '(?i)</body>', "<style>$css2</style>`n</body>"
            } else {
                $s = $s + "`n<style>$css2</style>`n"
            }
        }
    }

    # Remove header submenu items that link to Zoom webinars or the Academy
    $submenuPatterns = @(
        '(?is)<li[^>]*>\s*<a[^>]*href\s*=\s*"https?:\\/\\/events\\.zoom\\.us[^"]*"[^>]*>[\s\S]*?<\/li>',
        '(?is)<li[^>]*>\s*<a[^>]*href\s*=\s*"https?:\\/\\/academy\\.digits\\.com[^"]*"[^>]*>[\s\S]*?<\/li>'
    )
    foreach ($p in $submenuPatterns) {
        $s = [Regex]::Replace($s, $p, '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    }

    # Also remove mobile-nav variants (without full class attributes)
    $mobilePatterns = @(
        '(?is)<a[^>]*href\s*=\s*"https?:\\/\\/events\\.zoom\\.us[^"]*"[^>]*>[\s\S]*?<\/a>',
        '(?is)<a[^>]*href\s*=\s*"https?:\\/\\/academy\\.digits\\.com[^"]*"[^>]*>[\s\S]*?<\/a>'
    )
    foreach ($p in $mobilePatterns) {
        $s = [Regex]::Replace($s, $p, '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    }

    # Hide any Pricing navigation links (catch relative, absolute, or parent paths)
    $pricingPattern = '(?is)<a\b([^>]*?)\bhref\s*=\s*"[^"]*\bpricing\/?[^"]*"([^>]*)>\s*Pricing\s*<\/a>'
    $s = [Regex]::Replace($s, $pricingPattern, '<span class="top-nav-link" style="display:none"> Pricing </span>', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

    if ($s -ne $orig) {
        Set-Content -Path $f.FullName -Value $s -Encoding UTF8
        $changed += $f.FullName
    }
}

Write-Output "Updated files count: $($changed.Count)"
foreach ($c in $changed) { Write-Output $c }
