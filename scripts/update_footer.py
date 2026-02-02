import os
import re

# Mapping: original inner text -> (new inner text, new href)
MAPPINGS = {
    "Latest News": ("Our Ai Technology", "http://127.0.0.1:5503/agl/"),
    "Changelog": ("Bank Grade Security", "http://127.0.0.1:5503/security/"),
    "Developer API": ("Real Time Integration", "http://127.0.0.1:5503/integrations/"),
}

CSS_SNIPPET = "@media (min-width: 1200px) { .footer-menu-container .footer-nav-link.header-h3-style { font-size: 1.5rem; } }"

ANCHOR_RE = re.compile(r"(<a\b[^>]*>)(.*?)(</a>)", re.IGNORECASE | re.DOTALL)

changed_files = []

for root, dirs, files in os.walk('.'):
    for fn in files:
        if not fn.lower().endswith('.html'):
            continue
        path = os.path.join(root, fn)
        try:
            with open(path, 'r', encoding='utf-8') as f:
                s = f.read()
        except Exception:
            continue

        orig = s
        def repl_anchor(m):
            start_tag = m.group(1)
            inner = m.group(2)
            end_tag = m.group(3)
            inner_clean = re.sub(r"\s+", " ", inner).strip()
            # Exact match against keys
            if inner_clean in MAPPINGS:
                new_text, new_href = MAPPINGS[inner_clean]
                # Replace or add href in start_tag
                if re.search(r"\bhref\s*=\s*\"[^\"]*\"", start_tag):
                    start_tag = re.sub(r"\bhref\s*=\s*\"[^\"]*\"", f'href="{new_href}"', start_tag)
                else:
                    # insert before final >
                    start_tag = start_tag[:-1] + f' href="{new_href}">'
                return start_tag + new_text + end_tag
            return m.group(0)

        s = ANCHOR_RE.sub(repl_anchor, s)

        # Insert CSS snippet before </body> if not already present
        if CSS_SNIPPET not in s:
            if '</body>' in s:
                s = s.replace('</body>', f'<style>{CSS_SNIPPET}</style>\n</body>')
            else:
                s = s + f'\n<style>{CSS_SNIPPET}</style>\n'

        if s != orig:
            with open(path, 'w', encoding='utf-8') as f:
                f.write(s)
            changed_files.append(path)

print('Updated files:')
for p in changed_files:
    print(p)
print(f'Total updated: {len(changed_files)}')
