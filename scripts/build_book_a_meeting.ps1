
# build_book_a_meeting.ps1
# Rebuilds book-a-meeting.html by extracting header + footer from contact-us/index.html

$contactFile = "c:\projects\Finora\contact-us\index.html"
$outputFile  = "c:\projects\Finora\book-a-meeting.html"

$lines = Get-Content $contactFile -Encoding UTF8

# --- Extract header block: lines 1..1643 (1-indexed) ---
# That covers <html>, <head>, <body>, mega-wrapper + header + JS
$headerLines = $lines[0..1642]   # 0-indexed

# --- Extract footer block: lines 1772..1953 (1-indexed) = 1771..1952 (0-indexed) ---
$footerLines = $lines[1771..1953]

# --- Build the Calendly content block ---
$content = @'

        <main>
          <div class="page-container" style="max-width:1200px;margin:auto;padding:40px 20px;">

            <div class="calendly-wrapper" style="width:100%;border-radius:12px;overflow:hidden;">
              <div
                class="calendly-inline-widget"
                data-url="https://calendly.com/accountechstudio/30min?hide_event_type_details=1&hide_gdpr_banner=1&background_color=f3f3f3&primary_color=6ecddd"
                style="width:100%;height:700px;min-width:320px;">
              </div>
            </div>

          </div>
        </main>

        <script
          type="text/javascript"
          src="https://assets.calendly.com/assets/external/widget.js"
          async>
        </script>

'@

# --- Fix the <title> in the header block ---
$headerText = ($headerLines -join "`n") -replace '<title>Contact Us - Finora</title>', '<title>Book a Meeting - Finora</title>'

# --- Fix the <meta description> ---
$headerText = $headerText -replace 'content="Get in touch with Finora.*?"', 'content="Book a meeting with the Finora team. Choose a time that works for you."'

# --- Replace </div>\n    </div> closing tags of mega-wrapper + main from contact-us ---
# The contact-us main content starts at line 1647 with <main data-astro-cid-turtx5w7>
# We want to close the mega-wrapper div that opened at line 431 properly.
# The header text ends just before <main>, so we trim everything from <main onward
$mainIndex = $headerText.IndexOf('<main data-astro-cid-turtx5w7>')
if ($mainIndex -gt 0) {
    $headerText = $headerText.Substring(0, $mainIndex)
}

# --- Assemble footer text ---
$footerText = ($footerLines -join "`n")

# --- Write the output file ---
$output = $headerText + $content + $footerText + "`n</body>`n</html>"

[System.IO.File]::WriteAllText($outputFile, $output, [System.Text.Encoding]::UTF8)

Write-Host "Done! book-a-meeting.html has been rebuilt."
