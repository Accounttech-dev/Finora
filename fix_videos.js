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

            // Remove any existing lazy load video scripts to prevent conflicts
            const scriptRegex1 = /<script>\s*document\.addEventListener\(['"]DOMContentLoaded['"],\s*function\(\)\s*\{\s*const lazyVideos[^<]*<\/script>/gi;
            const scriptRegex2 = /<script>\s*document\.addEventListener\(['"]DOMContentLoaded['"],\s*function\(\)\s*\{\s*let lazyVideos[^<]*<\/script>/gi;
            
            if (scriptRegex1.test(content)) {
                content = content.replace(scriptRegex1, '');
                modified = true;
            }
            if (scriptRegex2.test(content)) {
                content = content.replace(scriptRegex2, '');
                modified = true;
            }

            // Ensure no other scripts exist that might interfere
            const scriptRegex3 = /<script>\s*let lazyVideos = \[\].slice.call\(document\.querySelectorAll\("video\.lazy-video"\)\);[^<]*<\/script>/gi;
            if (scriptRegex3.test(content)) {
                content = content.replace(scriptRegex3, '');
                modified = true;
            }

            const cleanJsSnippet = `
<script>
document.addEventListener("DOMContentLoaded", function() {
    var lazyVideos = [].slice.call(document.querySelectorAll("video.lazy-video"));
    
    function loadVideo(video) {
        var sources = video.querySelectorAll("source");
        for (var i = 0; i < sources.length; i++) {
            var src = sources[i].getAttribute("data-src");
            if (src) {
                sources[i].setAttribute("src", src);
            }
        }
        var vSrc = video.getAttribute("data-src");
        if (vSrc) {
            video.setAttribute("src", vSrc);
        }
        video.load();
        
        var playPromise = video.play();
        if (playPromise !== undefined) {
            playPromise.catch(function(error) {
                console.log("Autoplay prevented:", error);
            });
        }
    }

    if ("IntersectionObserver" in window) {
        var videoObserver = new IntersectionObserver(function(entries, observer) {
            entries.forEach(function(videoEntry) {
                if (videoEntry.isIntersecting) {
                    loadVideo(videoEntry.target);
                    videoObserver.unobserve(videoEntry.target);
                }
            });
        });
        lazyVideos.forEach(function(video) {
            videoObserver.observe(video);
        });
    } else {
        lazyVideos.forEach(function(video) {
            loadVideo(video);
        });
    }
});
</script>
</body>`;

            // Only append the new script if we found and removed the old ones, or if there's a video.lazy-video
            if (content.includes('video.lazy-video') || modified) {
                // To avoid multiple appends, first check if we already added it (we shouldn't have, we just stripped it)
                if (!content.includes('var lazyVideos = [].slice.call(document.querySelectorAll("video.lazy-video"));')) {
                    content = content.replace(/<\/body>/i, cleanJsSnippet);
                    modified = true;
                }
            }

            if (modified) {
                fs.writeFileSync(fullPath, content, 'utf8');
            }
        }
    }
}

processHtmlFiles(__dirname);
console.log("Fixed lazy video scripts.");
