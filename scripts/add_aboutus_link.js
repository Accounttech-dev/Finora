const fs = require('fs');
const path = require('path');

function updateAboutUsLink(filePath) {
    try {
        let content = fs.readFileSync(filePath, 'utf8');
        const originalContent = content;

        // Convert "About Us" span back to an anchor tag with href="/about-us/"
        content = content.replace(
            /<span class="footer-nav-link header-h3-style">About Us<\/span>/g,
            '<a class="footer-nav-link header-h3-style" href="/about-us/">About Us</a>'
        );

        // Also handle variations with data-astro attributes
        content = content.replace(
            /<span class="footer-nav-link header-h3-style"[^>]*>About Us<\/span>/g,
            '<a class="footer-nav-link header-h3-style" href="/about-us/">About Us</a>'
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
        if (updateAboutUsLink(file)) {
            console.log(`  ✓ Updated`);
            filesUpdated++;
        } else {
            console.log(`  - No changes needed`);
        }
    });

    console.log(`\n✓ About Us link update completed!`);
    console.log(`Total files processed: ${htmlFiles.length}`);
    console.log(`Files updated: ${filesUpdated}`);
}

main();
