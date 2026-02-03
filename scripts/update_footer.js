const fs = require('fs');
const path = require('path');

function updateFooterInFile(filePath) {
    try {
        let content = fs.readFileSync(filePath, 'utf8');
        const originalContent = content;

        // 1. Replace "Our Ai Technology" with "Real-time Bookkeeping"
        content = content.replace(/Our Ai Technology/g, 'Real-time Bookkeeping');

        // 2. Replace "Bank Grade Security" with "Month-end Close Automation"
        content = content.replace(/Bank Grade\s+Security/g, 'Month-end Close Automation');

        // 3. Replace "Real Time Integration" link with "About Us" span
        content = content.replace(
            /<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Real Time\s+Integration\s*<\/a>/g,
            '<span class="footer-nav-link header-h3-style">About Us</span>'
        );

        // 4-6. Remove href from deadline items
        // W-2 & 1099
        content = content.replace(
            /<a\s+class="deadline-link"\s+href="[^"]*w2-1099[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>/g,
            '<span class="deadline-link" data-astro-cid-csx6xpza>'
        );
        content = content.replace(
            /(W-2 &amp; 1099 Filing Deadline.*?)<\/a>\s*<\/li>/g,
            '$1</span> </li>'
        );

        // Partnerships & S Corporations
        content = content.replace(
            /<a\s+class="deadline-link"\s+href="[^"]*partnership[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>/g,
            '<span class="deadline-link" data-astro-cid-csx6xpza>'
        );
        content = content.replace(
            /(Partnerships &amp; S Corporations.*?)<\/a>\s*<\/li>/g,
            '$1</span> </li>'
        );

        // C Corporations & Sole Proprietors
        content = content.replace(
            /<a\s+class="deadline-link"\s+href="[^"]*c-corporation[^"]*\.ics"\s+download\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>/g,
            '<span class="deadline-link" data-astro-cid-csx6xpza>'
        );
        content = content.replace(
            /(C Corporations &amp; Sole Proprietors.*?)<\/a>\s*<\/li>/g,
            '$1</span> </li>'
        );

        // 7. Remove href from Terms of Service
        content = content.replace(
            /<a\s+href="https:\/\/my\.digits\.com\/legal\/terms-of-service"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Terms of Service\s*<\/a>/g,
            '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Terms of Service</span>'
        );

        // 8. Remove href from Privacy Policy
        content = content.replace(
            /<a\s+href="https:\/\/my\.digits\.com\/legal\/privacy-policy"\s+class="footer-legal-nav-link"\s+data-astro-cid-[^>]*>\s*Privacy Policy\s*<\/a>/g,
            '<span class="footer-legal-nav-link" data-astro-cid-ej6hapv5>Privacy Policy</span>'
        );

        // 9. Remove href from Accountant Directory
        content = content.replace(
            /<a\s+class="footer-nav-link header-h3-style"\s+href="https:\/\/accountants\.digits\.com\/"\s+target="_blank"\s+rel="noopener noreferrer"\s+data-astro-cid-[^>]*>\s*Accountant Directory\s*<\/a>/g,
            '<span class="footer-nav-link header-h3-style">Accountant Directory</span>'
        );

        // 10. Remove href from Integration Partners (multiple variations)
        content = content.replace(
            /<a\s+class="footer-nav-link header-h3-style"\s+href="[^"]*integrations?\/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*<\/a>/g,
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>'
        );
        content = content.replace(
            /<a\s+class="footer-nav-link header-h3-style"\s+href="\.\.\/about-us\/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*<\/a>/g,
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>'
        );
        content = content.replace(
            /<a\s+class="footer-nav-link header-h3-style"\s+href="\/about-us\/"\s+data-astro-cid-[^>]*>\s*Integration Partners\s*<\/a>/g,
            '<span class="footer-nav-link header-h3-style">Integration Partners</span>'
        );

        // Save if changed
        if (content !== originalContent) {
            fs.writeFileSync(filePath, content, 'utf8');
            return true;
        }
        return false;
    } catch (error) {
        console.log(`  ✗ Error processing ${filePath}: ${error.message}`);
        return false;
    }
}

function getAllHtmlFiles(dir, fileList = []) {
    const files = fs.readdirSync(dir);

    files.forEach(file => {
        const filePath = path.join(dir, file);
        const stat = fs.statSync(filePath);

        if (stat.isDirectory()) {
            // Skip node_modules and .git
            if (file !== 'node_modules' && file !== '.git') {
                getAllHtmlFiles(filePath, fileList);
            }
        } else if (file.endsWith('.html')) {
            fileList.push(filePath);
        }
    });

    return fileList;
}

function main() {
    const projectPath = 'C:\\projects\\ai';
    const htmlFiles = getAllHtmlFiles(projectPath);

    console.log(`Found ${htmlFiles.length} HTML files to process\n`);

    let filesUpdated = 0;
    htmlFiles.forEach(file => {
        const fileName = path.basename(file);
        console.log(`Processing: ${fileName}`);
        if (updateFooterInFile(file)) {
            console.log(`  ✓ Updated`);
            filesUpdated++;
        } else {
            console.log(`  - No changes needed`);
        }
    });

    console.log(`\n✓ Footer update completed!`);
    console.log(`Total files processed: ${htmlFiles.length}`);
    console.log(`Files updated: ${filesUpdated}`);
}

main();
