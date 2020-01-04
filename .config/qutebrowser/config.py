c.url.searchengines = {
    'DEFAULT': 'https://google.com/search?q={}',
    't': 'https://www.teatmik.ee/et/search/{}',
    'qs': 'https://eki.ee/dict/qs/?Q={}',
    'ekss': 'https://eki.ee/dict/ekss/?Q={}',
    'ies': 'https://eki.ee/dict/ies/?Q={}',
    'syn': 'https://eki.ee/dict/synonyymid/?Q={}',
    'ant': 'https://eki.ee/dict/antonyymid/?Q={}',
    'wen': 'https://en.wikipedia.org/w/index.php?search={}',
    'wet': 'https://et.wikipedia.org/w/index.php?search={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'r': 'https://old.reddit.com/r/{}',
    'm': 'https://dev.mysql.com/doc/search/?d=201&p=1&q={}'
}

c.url.default_page = 'about:blank'
c.url.start_pages = [c.url.default_page]

config.bind('j', 'scroll-page 0 0.30')
config.bind('k', 'scroll-page 0 -0.30')
config.bind('<Ctrl-D>', 'scroll down')
config.bind('<Ctrl-U>', 'scroll up')

c.hints.next_regexes.append(r'\bjärgmine\b')
c.hints.prev_regexes.append(r'\beelmine\b')

c.tabs.position = 'top'
c.tabs.width = '15%'
c.tabs.last_close = "blank"
c.tabs.mousewheel_switching = False
c.tabs.show = "multiple"

c.scrolling.bar = 'always'

c.messages.timeout = 5000

monospace = '12pt "Source Code Pro"'
c.fonts.completion.category = monospace
c.fonts.completion.entry = monospace
c.fonts.debug_console = monospace
c.fonts.downloads = monospace
c.fonts.keyhint = monospace
c.fonts.messages.error = monospace
c.fonts.messages.info = monospace
c.fonts.messages.warning = monospace
c.fonts.prompts = monospace
c.fonts.statusbar = monospace
c.fonts.tabs = monospace

