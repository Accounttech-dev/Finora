import os
import re
from pathlib import Path

def update_footer_in_file(file_path):
    """Update footer content in a single HTML file"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # 1. Replace "Our Ai Technology" with "Real-time Bookkeeping"
        content = content.replace('Our Ai Technology', 'Real-time Bookkeeping')
        
        # 2. Replace "Bank Grade Security" with "Month-end Close Automation"
        content = re.sub(r'Bank Grade\s+Security', 'Month-end Close Automation', content)
        
        # 3. Replace "Real Time Integration" link with "About Us" span
        content = re.sub(
            r'<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Real Time\s+Integration\s*</a>',
            '<span class="footer-nav-link header-h3-style">About Us</span>',
            content
        )
        
        # 4-6. Remove href from deadline items (convert a tags to spans)
        # W-2 & 1099 Filing Deadline
        content = re.sub(
            r'<a\s+class="deadline-link"\s+href="[^"]*w2-1099[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>',
            '<span class="deadline-link" data-astro-cid-csx6xpza>',
            content
        )
        content = re.sub(
            r'(W-2 &amp; 1099 Filing Deadline.*?)</a>\s*</li>',
            r'\1</span> </li>',
            content
        )
        
        # Partnerships & S Corporations
        content = re.sub(
            r'<a\s+class="deadline-link"\s+href="[^"]*partnership[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>',
            '<span class="deadline-link" data-astro-cid-csx6xpza>',
            content
        )
        content = re.sub(
            r'(Partnerships &amp; S Corporations.*?)</a>\s*</li>',
            r'\1</span> </li>',
            content
        )
        
        # C Corporations & Sole Proprietors
        content = re.sub(
            r'<a\s+class="deadline-link"\s+href="[^"]*c-corporation[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>',
            '<span class="deadline-link" data-astro-cid-csx6xpza>',
            content
        )
        content = re.sub(
            r'(C Corporations &amp; Sole Proprietors.*?)</a>\s*</li>',
            r'\1</span> </li>',
            content
        )
        
        # 7.  Remove href from Terms of Service
        content = re.sub(
            r'<a\s+href="https://my\.digits\.com/legal/terms-of-service"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Terms of Service\s*</a>',
            '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Terms of Service</span>',
            content
        )
        
        # 8. Remove href from Privacy Policy
        content = re.sub(
            r'<a\s+href="https://my\.digits\.com/legal/privacy-policy"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Privacy Policy\s*</a>',
            '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Privacy Policy</span>',
            content
        )
        
        # 9. Remove href from Accountant Directory
        content = re.sub(
            r'<a\s+class="footer-nav-link header-h3-style"\s+href="https://accountants\.digits\.com/"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Accountant Directory\s*</a>',
            '<span class="footer-nav-link header-h3-style">Accountant Directory</span>',
            content
        )
        
        # 10. Remove href from Integration Partners  
        content = re.sub(
            r'<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*integrations?/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*</a>',
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>',
            content
        )
        # Also match variations with different href paths
        content = re.sub(
            r'<a\s+class="footer-nav-link header-h3-style"\s+href="\.\./about-us/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*</a>',
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>',
            content
        )
        content = re.sub(
            r'<a\s+class="footer-nav-link header-h3-style"\s+href="/about-us/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*</a>',
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>',
            content
        )
        
        # Save if changed
        if content != original_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            return True
        return False
    except Exception as e:
        print(f"  ✗ Error processing {file_path}: {e}")
        return False

def main():
    # Get all HTML files in the project
    project_path = Path(r"C:\projects\ai")
    html_files = list(project_path.glob("**/*.html"))
    
    print(f"Found {len(html_files)} HTML files to process\n")
    
    files_updated = 0
    for html_file in html_files:
        # Skip node_modules and .git directories
        if 'node_modules' in html_file.parts or '.git' in html_file.parts:
            continue
        
        print(f"Processing: {html_file.name}")
        if update_footer_in_file(html_file):
            print(f"  ✓ Updated")
            files_updated += 1
        else:
            print(f"  - No changes needed")
    
    print(f"\n✓ Footer update completed!")
    print(f"Total files processed: {len(html_files)}")
    print(f"Files updated: {files_updated}")

if __name__ == "__main__":
    main()
