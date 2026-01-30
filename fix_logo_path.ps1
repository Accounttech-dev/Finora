# PowerShell script to normalize all logo paths to correct relative paths
# This replaces any ../../../a-images/ patterns with the correct path based on actual file depth

# Get all HTML files recursively
$htmlFiles = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse

$totalFiles = $htmlFiles.Count
$modifiedFiles = 0

Write-Host "Found $totalFiles HTML files to process..."

foreach ($file in $htmlFiles) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Get the relative path from the base directory
        $basePath = "c:\projects\ai"
        $relativePath = $file.FullName.Substring($basePath.Length + 1)  # +1 to remove leading backslash
        
        # Count directory levels (excluding the filename)
        $pathParts = $relativePath.Split('\')
        $depth = $pathParts.Count - 1  # -1 because last part is the filename
        
        # Build the correct relative path prefix
        if ($depth -eq 0) {
            $correctPrefix = ""
        } else {
            $correctPrefix = ("../" * $depth)
        }
        
        $correctPath = "${correctPrefix}a-images/ai-finora-logo.png"
        
        # Replace any existing pattern that looks like a relative path to the logo
        # This handles patterns like ../../../a-images/ or ../../a-images/ etc.
        $pattern = '\.\.\/(?:\.\.\/)*a-images\/ai-finora-logo\.png'
        if ($content -match $pattern) {
            $content = $content -replace $pattern, $correctPath
        }
        
        # Also fix the root level case (no ../)
        if ($depth -eq 0) {
            $content = $content -replace 'src="a-images/ai-finora-logo\.png"', 'src="a-images/ai-finora-logo.png"'
        }
        
        # Check if content was modified
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
            $modifiedFiles++
            Write-Host "Fixed: $relativePath (depth: $depth) -> $correctPath"
        }
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "`nCompleted! Modified $modifiedFiles files."
