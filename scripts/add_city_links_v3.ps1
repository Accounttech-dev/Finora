$SERVICES_DIR = "c:\projects\Finora\services"

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

$linkItems = ""
foreach ($city in $CITIES) {
    # Using simple concatenation to avoid nested quote confusion
    $linkItems += "<li><a href=`"./$($city.slug)/`" class=`"paragraph-light`" style=`"text-decoration: none; color: var(--global-text-color); font-weight: 500;`">$($city.name)</a></li>`n            "
}

$sectionHtml = @"

      <section class="global-padding-inline container" style="margin-top: var(--space-xl-responsive); margin-bottom: var(--space-xl-responsive);">
        <div class="section-container-standard">
          <h3 class="header-h3-style" style="text-align: center; margin-bottom: var(--space-m-responsive);">Serving businesses in:</h3>
          <ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem; list-style: none; padding: 0; text-align: center;">
            $linkItems
          </ul>
        </div>
      </section>
"@

$services = Get-ChildItem -Path $SERVICES_DIR -Directory

foreach ($service in $services) {
    if ($service.Name -eq "ask-finora") { continue }
    
    $indexPath = Join-Path $service.FullName "index.html"
    if (-not (Test-Path $indexPath)) { continue }
    
    Write-Host "Processing $($service.Name)..."
    
    # Use Get-Content -Raw
    $content = Get-Content -Path $indexPath -Raw
    
    if ($content -match "Serving businesses in:") {
        Write-Host "  Already has city links. Skipping."
        continue
    }
    
    if ($content -match "</main>") {
        $newContent = $content.Replace("</main>", $sectionHtml + "`n    </main>")
        Set-Content -Path $indexPath -Value $newContent -Encoding UTF8
        Write-Host "  Added links."
    } else {
        Write-Host "  Could not find </main>."
    }
}
