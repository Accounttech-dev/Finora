const fs = require('fs');
const path = require('path');

function processHtmlFiles(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const fullPath = path.join(dir, file);
        const stat = fs.statSync(fullPath);
        if (stat.isDirectory()) {
            if (file === 'node_modules' || file === '.git' || file === '.firebase') continue;
            processHtmlFiles(fullPath);
        } else if (file.endsWith('.html')) {
            let content = fs.readFileSync(fullPath, 'utf8');
            let modified = false;

            // 1. Optimize images
            const newContent = content.replace(/<img\b([^>]*)>/gi, (match, attrs) => {
                if (!/loading\s*=\s*['"]lazy['"]/i.test(attrs)) {
                    modified = true;
                    return `<img loading="lazy" decoding="async"${attrs}>`;
                }
                return match;
            });
            content = newContent;

            // 2. Optimize videos
            const newContentVid = content.replace(/<video\b([^>]*)>/gi, (match, attrs) => {
                let newAttrs = attrs;
                if (/autoplay/i.test(newAttrs)) {
                    newAttrs = newAttrs.replace(/\bautoplay\b/gi, '');
                    modified = true;
                }
                if (!/preload\s*=\s*['"]none['"]/i.test(newAttrs)) {
                    if (/preload\s*=\s*['"]auto['"]/i.test(newAttrs)) {
                        newAttrs = newAttrs.replace(/preload\s*=\s*['"]auto['"]/gi, 'preload="none"');
                    } else {
                        newAttrs += ' preload="none"';
                    }
                    modified = true;
                }
                if (!/class\s*=\s*['"][^'"]*lazy-video[^'"]*['"]/i.test(newAttrs)) {
                    if (/class\s*=\s*['"]/i.test(newAttrs)) {
                        newAttrs = newAttrs.replace(/(class\s*=\s*['"])/i, '$1lazy-video ');
                    } else {
                        newAttrs += ' class="lazy-video"';
                    }
                    modified = true;
                }
                
                // change src to data-src in <video> tag
                if (/\s+src\s*=/i.test(newAttrs)) {
                    newAttrs = newAttrs.replace(/\s+src\s*=/gi, ' data-src=');
                    modified = true;
                }
                
                if (newAttrs !== attrs) {
                    return `<video${newAttrs}>`;
                }
                return match;
            });
            content = newContentVid;

            // 3. Change src to data-src in <source> tags
            const newContentSource = content.replace(/<source\b([^>]*?)\s+src\s*=/gi, (match, p1) => {
                modified = true;
                return `<source${p1} data-src=`;
            });
            content = newContentSource;

            // 4. Inject JS if missing
            const jsSnippet = `
<script>
document.addEventListener("DOMContentLoaded", function() {
    let lazyVideos = [].slice.call(document.querySelectorAll("video.lazy-video"));
    if ("IntersectionObserver" in window) {
        let videoObserver = new IntersectionObserver(function(entries, observer) {
            entries.forEach(function(video) {
                if (video.isIntersecting) {
                    for (let source in video.target.children) {
                        let videoSource = video.target.children[source];
                        if (typeof videoSource.tagName === "string" && videoSource.tagName === "SOURCE") {
                            if (videoSource.dataset.src) {
                                videoSource.src = videoSource.dataset.src;
                            }
                        }
                    }
                    if (video.target.dataset.src) {
                        video.target.src = video.target.dataset.src;
                    }
                    video.target.load();
                    video.target.play().catch(e => {});
                    videoObserver.unobserve(video.target);
                }
            });
        });
        lazyVideos.forEach(function(video) {
            videoObserver.observe(video);
        });
    } else {
        // Fallback
        lazyVideos.forEach(function(video) {
            for (let source in video.children) {
                let videoSource = video.children[source];
                if (typeof videoSource.tagName === "string" && videoSource.tagName === "SOURCE") {
                    if (videoSource.dataset.src) {
                        videoSource.src = videoSource.dataset.src;
                    }
                }
            }
            if (video.dataset.src) {
                video.src = video.dataset.src;
            }
            video.load();
            video.play().catch(e => {});
        });
    }
});
</script>`;
            
            if (modified && !content.includes('videoObserver = new IntersectionObserver')) {
                content = content.replace('</body>', jsSnippet + '\n</body>');
            }

            if (modified) {
                fs.writeFileSync(fullPath, content, 'utf8');
            }
        }
    }
}

processHtmlFiles(__dirname);
console.log("Optimization complete.");
