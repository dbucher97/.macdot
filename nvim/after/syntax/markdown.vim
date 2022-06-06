" Disable TS capture for links
hi markdownTSTextReference guifg=none
hi clear TSTextReference
hi markdownTSPunctDelimiter guifg=none
hi clear TSPunctDelimiter

" New link syntax
syntax match markdownWikiPath '.*|' contained conceal
syntax match markdownWikiUrl '.*' contained contains=markdownWikiPath
syntax region markdownWikilink matchgroup=markdownWikiDelimiter start="\[\[" end="\]\]" contains=markdownWikiUrl keepend oneline concealends
hi link markdownWikiPath markdownWikiUrl
hi link markdownWikiUrl markdownWikilink

