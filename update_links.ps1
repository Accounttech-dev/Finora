# Script to update links across all HTML files
# 1. Replace "product/" with "services/" in links
# 2. Remove "index.html" from the end of links

$htmlFiles = Get-ChildItem -Path . -Filter *.html -Recurse

$totalFiles = $htmlFiles.Count
$processedFiles = 0
$modifiedFiles = 0

foreach ($file in $htmlFiles) {
    $processedFiles++
    
    try {
        $content = [System.IO.File]::ReadAllText($file.FullName)
        $originalContent = $content
        
        # Replace product/ with services/ in href and src attributes
        $content = $content -replace 'href="product/', 'href="services/'
        $content = $content -replace 'href=''product/', 'href=''services/'
        $content = $content -replace 'href="../product/', 'href="../services/'
        $content = $content -replace 'href="../../product/', 'href="../../services/'
        $content = $content -replace 'href="../../../product/', 'href="../../../services/'
        $content = $content -replace 'href="./product/', 'href="./services/'
        $content = $content -replace 'href="/product/', 'href="/services/'
        
        # Remove index.html from the end of href links (keep the trailing slash)
        $content = $content -replace 'href="([^"]*)/index\.html"', 'href="$1/"'
        $content = $content -replace "href='([^']*)/index\.html'", "href='`$1/'"
        
        # Handle case where index.html is directly referenced without path
        $content = $content -replace 'href="index\.html"', 'href="./"'
        
        if ($content -ne $originalContent) {
            [System.IO.File]::WriteAllText($file.FullName, $content)
            $modifiedFiles++
            Write-Host "Modified: $($file.FullName)"
        }
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_"
    }
}

Write-Host "`nComplete! Processed $processedFiles files, modified $modifiedFiles files."
