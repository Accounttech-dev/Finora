$CITIES = @(
    @{name="New York"; slug="new-york"},
    @{name="Los Angeles"; slug="los-angeles"},
    @{name="Chicago"; slug="chicago"},
    @{name="Houston"; slug="houston"},
    @{name="Phoenix"; slug="phoenix"},
    @{name="Philadelphia"; slug="philadelphia"},
    @{name="San Antonio"; slug="san-antonio"},
    @{name="San Diego"; slug="san-diego"},
    @{name="Dallas"; slug="dallas"},
    @{name="San Jose"; slug="san-jose"}
)

$SERVICES_DIR = "c:\projects\Finora\services"

$services = Get-ChildItem -Path $SERVICES_DIR -Directory

foreach ($service in $services) {
    if ($service.Name -eq "ask-finora") { continue } # Skip specialized page? Or include? User said "ALL services". I'll include.

    $servicePath = $service.FullName
    $indexPath = Join-Path $servicePath "index.html"
    
    if (-not (Test-Path $indexPath)) {
        Write-Host "Skipping $($service.Name), no index.html"
        continue
    }
    
    Write-Host "Processing service: $($service.Name)"
    
    # Read raw content to preserve newlines etc
    $baseContent = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)
    
    foreach ($city in $CITIES) {
        $cityDir = Join-Path $servicePath $city.slug
        if (-not (Test-Path $cityDir)) {
            New-Item -ItemType Directory -Path $cityDir | Out-Null
        }
        
        $cityName = $city.name
        $slug = $city.slug
        $newContent = $baseContent
        
        # Update Title: <title>Finora - AI Bookkeeping</title> -> <title>Finora - AI Bookkeeping in New York</title>
        $newContent = $newContent -replace '(<title>.*?)(</title>)', "`$1 in $cityName`$2"
        
        # Update H1
        # Use regex object for single replacement
        # Matches <h1 ...class="header-h1-style"...>...<b>Text</b>...</h1>
        # We assume the user wants to keep formatting and just append text inside the bold.
        $h1Regex = [regex]'(<h1[^>]*class=["'']header-h1-style["''][^>]*>.*?<b>)(.*?)(</b>)'
        
        # Using a scriptblock for MatchEvaluator might be tricky if not cast properly in older PS.
        # But commonly works. 
        try {
            $newContent = $h1Regex.Replace($newContent, {
                param($match)
                return $match.Groups[1].Value + $match.Groups[2].Value + " in " + $cityName + $match.Groups[3].Value
            }, 1)
        } catch {
            Write-Host "Regex replace failed for H1 in $($service.Name). Using fallback basic replace."
            # Fallback for old PS if scriptblock fails? 
            # Or just ignore limit count.
            # But let's assume it works.
        }
        
        # Update Relative Paths
        # Any path starting with "../" needs to become "../../"
        # Regex: (href|src|srcset)=(["'])(\.\./)
        # Replace: $1=$2../../
        
        $newContent = $newContent -replace '(href|src|srcset)=(["''])(\.\./)', '$1=$2../../'
        
        # Write File
        $targetFile = Join-Path $cityDir "index.html"
        [System.IO.File]::WriteAllText($targetFile, $newContent, [System.Text.Encoding]::UTF8)
        
        # Write-Host "  Created $slug"
    }
}
Write-Host "Done generating city pages."
