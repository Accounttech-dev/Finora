import os
import re

# Define the pages to update
pages = [
    {"path": "about-us/index.html", "depth": 1},
    {"path": "contact-us/index.html", "depth": 1},
    {"path": "services/ask-finora/index.html", "depth": 2},
    {"path": "services/bookkeeping/index.html", "depth": 2},
    {"path": "services/month-end-close/index.html", "depth": 2},
    {"path": "services/dashboards/index.html", "depth": 2},
    {"path": "services/financials/index.html", "depth": 2},
    {"path": "services/bill-pay/index.html", "depth": 2},
    {"path": "services/invoicing/index.html", "depth": 2},
    {"path": "services/business-setup/index.html", "depth": 2},
    {"path": "accountants/index.html", "depth": 1},
    {"path": "accountants/month-end-close/index.html", "depth": 2}
]

root_path = "c:/projects/Finora"

# Read the Industries menu from index.html
with open(f"{root_path}/index.html", "r", encoding="utf-8") as f:
    home_content = f.read()

# Extract desktop Industries menu (lines 592-733 approximately)
desktop_pattern = r'(<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>\s+<span class="top-nav-link" data-astro-cid-e4bd7mep>Industries.*?</style>)'
desktop_match = re.search(desktop_pattern, home_content, re.DOTALL)
if not desktop_match:
    print("ERROR: Could not extract desktop Industries menu from index.html")
    exit(1)
desktop_menu = desktop_match.group(1)

# Extract mobile Industries menu (lines 941-1147 approximately)
mobile_pattern = r'(<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>\s+<a\s+class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv>Industries.*?</ul>\s+</li>)\s+<li class="top-nav-mobile-item'
mobile_match = re.search(mobile_pattern, home_content, re.DOTALL)
if not mobile_match:
    print("ERROR: Could not extract mobile Industries menu from index.html")
    exit(1)
mobile_menu = mobile_match.group(1)

print("✓ Extracted Industries menus from index.html\n")

# Process each page
for page in pages:
    file_path = f"{root_path}/{page['path']}"
    
    if not os.path.exists(file_path):
        print(f"✗ File not found: {file_path}")
        continue
    
    print(f"Processing: {page['path']}")
    
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Check if already has Industries menu
    if 'Industries <span class="top-nav-dropdown-icon"' in content:
        print(f"  ⚠ Already has Industries menu, skipping...")
        continue
    
    # Adjust paths based on depth
    adjusted_desktop = desktop_menu
    adjusted_mobile = mobile_menu
    
    if page['depth'] == 1:
        # Replace services/ with ../services/ for depth 1
        adjusted_desktop = adjusted_desktop.replace('href="services/', 'href="../services/')
        adjusted_mobile = adjusted_mobile.replace('href="/services/', 'href="../services/')
    elif page['depth'] == 2:
        # Replace services/ with ../../services/ for depth 2
        adjusted_desktop = adjusted_desktop.replace('href="services/', 'href="../../services/')
        adjusted_mobile = adjusted_mobile.replace('href="/services/', 'href="../../services/')
    
    # Insert desktop menu after Accountants menu
    # Pattern: Find the closing </li> after Accountants menu, before the next menu item
    desktop_pattern = r'(</ul>\s+</li>\s+<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep> </span>)'
    if re.search(desktop_pattern, content):
        content = re.sub(desktop_pattern, f'</ul>\\r\\n            </li>\\r\\n\\r\\n            {adjusted_desktop}\\r\\n            <li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep> </span>', content, count=1)
        print(f"  ✓ Added desktop Industries menu")
    else:
        print(f"  ✗ Could not find desktop insertion point")
    
    # Insert mobile menu after Accountants mobile menu
    # Pattern: Find the closing </li> after mobile Accountants, before Resources
    mobile_pattern = r'(</ul>\s+</li>\s+<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a\s+class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Resources)'
    if re.search(mobile_pattern, content):
        content = re.sub(mobile_pattern, f'</ul>\\r\\n            </li>\\r\\n\\r\\n            {adjusted_mobile}\\r\\n\\r\\n            <li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Resources', content, count=1)
        print(f"  ✓ Added mobile Industries menu")
    else:
        print(f"  ✗ Could not find mobile insertion point")
    
    # Save the file
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    
    print(f"  ✓ File saved\n")

print("="*50)
print("✓ Complete!")
print("="*50)
