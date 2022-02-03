"                               __  __
"       __  __  __  __     __  /\_\/\_\  __  __
"      /\ \/\ \/\ \/\ \  /'__`\\/\ \/\ \/\ \/\ \
"      \ \ \_\ \ \ \_\ \/\  __/ \ \ \ \ \ \ \_\ \
"       \/`____ \ \____/\ \____\_\ \ \ \_\ \____/
"        `/___/> \/___/  \/____/\ \_\ \/_/\/___/
"           /\___/             \ \____/
"           \/__/               \/___/
"
"
" Name: 月酒 YuèJiǔ (yuejiu)
" Maintainer: Duncan Marsh (slugbyte@slugbyte.com)
" Credit: yuejiu is a modified version moonshine by Karolis Koncevicius
" Repository: https://github.com/slugbyte/yuejiu
" Inspirations: Moonshine, Jellybeans, Apprentice, Twilight, Gruvbox

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif


" SETUP
hi clear

if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'yuejiu'
set background=dark

" create utilitys
function! s:CreateGroup(group, bg, fg, term)
  execute join([ 'hi',
          \ a:group,
          \ 'ctermfg=' . a:fg[0],
          \ 'ctermbg=' . a:bg[0],
          \ 'guifg='   . a:fg[1],
          \ 'guibg='   . a:bg[1],
          \ 'gui='     . a:term[:-1],
          \ 'cterm='   . a:term[:-1],
          \ ], ' ')
endfunction

function! s:LinkGroup(left, right)
  execute join(['hi', 'clear', a:left], ' ')
  execute join(['hi', 'link', a:left, a:right], ' ')
endfunction

" DEFINE COLOR PALLET
let s:color = {}

" sky
let s:color.dusk = [60, '#5F5F87']
let s:color.moonrise = [104, '#8787D7']
let s:color.sunset = [177, '#D787FF']
let s:color.twilight = [111, '#87AFFF']
let s:color.sunburst = [197, '#FF005F']
let s:color.horizon = [161, '#D7005F']
let s:color.sunbeam = [160, '#D70000']

" earth
let s:color.rust = [124, '#AF0000']
let s:color.wetclay = [94, '#875F00']
let s:color.dryclay = [130, '#AF5F00']
let s:color.ochre = [136, '#AF8700']
let s:color.lemon = [214, '#FFAF00']
let s:color.dirtpath = [131, '#AF5F5F']
let s:color.algee = [137, '#AF875F']
let s:color.dirt = [173, '#D7875F']
let s:color.wetsand = [215, '#FFAF5F']
let s:color.drysand  = [222, '#FFD787']
let s:color.desert  = [217, '#FFAFAF']
let s:color.shell = [230, '#FFFFD7']

" plant
let s:color.wetgrass  = [64, '#5F8700']
let s:color.drygrass = [106, '#87AF00']
let s:color.algee = [143, '#AFAF5F']
let s:color.leaf = [186, '#D7D787']

" greyscale
let s:color.black = [16, '#000000']
let s:color.offblack = [232, '#080808']
let s:color.blackgrey = [233, '#121212']
let s:color.hardgreyy = [235, '#262626']
let s:color.mediumgrey = [236, '#303030']
let s:color.normalgrey = [238, '#444444']
let s:color.softgrey = [240, '#585858']
let s:color.darkcharcol = [241, '#626262']
let s:color.mediumcharcol = [242, '#6C6C6C']
let s:color.lightcharcol = [245, '#8A8A8A']
let s:color.offwhite = [255, '#EEEEEE']
let s:color.white = [231, '#FFFFFF']
let s:color.none = ['NONE', 'NONE']

call s:CreateGroup('None', s:color.none, s:color.none, 'NONE')
call s:CreateGroup('Normal', s:color.offblack, s:color.desert, 'NONE')
call s:CreateGroup('Underlined', s:color.none, s:color.none, 'UNDERLINE')
call s:CreateGroup('Undercurl', s:color.none, s:color.none, 'UNDERCURL')
call s:CreateGroup('ColorColumn', s:color.mediumgrey, s:color.none, 'NONE')
call s:CreateGroup('SignColumn', s:color.blackgrey, s:color.mediumcharcol, 'NONE')
call s:CreateGroup('Visual', s:color.sunburst, s:color.black, 'NONE')
call s:CreateGroup('Search', s:color.drygrass, s:color.hardgreyy, 'NONE')
call s:CreateGroup('StatusLine', s:color.mediumgrey, s:color.offwhite, 'BOLD')
call s:CreateGroup('Split', s:color.mediumgrey, s:color.hardgreyy, 'BOLD')
call s:CreateGroup('DiffAdd', s:color.wetgrass, s:color.hardgreyy, 'NONE')
call s:CreateGroup('DiffDelete', s:color.sunbeam, s:color.hardgreyy, 'NONE')
call s:CreateGroup('DiffChange', s:color.dusk, s:color.hardgreyy, 'NONE')
call s:CreateGroup('DiffText', s:color.lemon, s:color.hardgreyy, 'NONE')
call s:CreateGroup('Pmenu', s:color.normalgrey, s:color.drysand, 'NONE')
call s:CreateGroup('PmenuSel', s:color.algee, s:color.normalgrey, 'NONE')
call s:CreateGroup('PmenuSbar', s:color.algee, s:color.none, 'NONE')
call s:CreateGroup('PmenuThumb', s:color.ochre, s:color.none, 'NONE')
call s:CreateGroup('ErrorMsg', s:color.rust, s:color.hardgreyy, 'NONE')
call s:CreateGroup('WildMenu', s:color.mediumgrey, s:color.twilight, 'NONE')
call s:CreateGroup('Tabline', s:color.mediumgrey, s:color.darkcharcol, 'NONE')
call s:CreateGroup('TablineSel', s:color.mediumgrey, s:color.twilight, 'NONE')
call s:CreateGroup('TablineFill', s:color.mediumgrey, s:color.shell, 'NONE')
call s:CreateGroup('Cursor', s:color.white, s:color.none, 'NONE')
call s:CreateGroup('CursorColumn', s:color.mediumgrey, s:color.none, 'NONE')
call s:CreateGroup('Statement', s:color.none, s:color.wetclay, 'NONE')
call s:CreateGroup('Folded', s:color.none, s:color.moonrise, 'NONE')
call s:CreateGroup('MatchParen', s:color.none, s:color.twilight, 'NONE')
call s:CreateGroup('Error', s:color.none, s:color.rust, 'NONE')
call s:CreateGroup('Delimiter', s:color.none, s:color.dryclay, 'NONE')
call s:CreateGroup('Identifier', s:color.none, s:color.dirtpath, 'NONE')
call s:CreateGroup('Directory', s:color.none, s:color.algee, 'NONE')
call s:CreateGroup('Special', s:color.none, s:color.horizon, 'NONE')
call s:CreateGroup('Type', s:color.none, s:color.dirt, 'NONE')
call s:CreateGroup('Todo', s:color.none, s:color.sunset, 'NONE')
call s:CreateGroup('Boolean', s:color.none, s:color.leaf, 'NONE')
call s:CreateGroup('Operator', s:color.none, s:color.lemon, 'NONE')
call s:CreateGroup('String', s:color.none, s:color.wetsand, 'NONE')
call s:CreateGroup('Constant', s:color.none, s:color.desert, 'NONE')
call s:CreateGroup('LineNr', s:color.none, s:color.darkcharcol, 'NONE')
call s:CreateGroup('SpecialKey', s:color.none, s:color.softgrey, 'NONE')
call s:CreateGroup('Comment', s:color.none, s:color.mediumcharcol, 'NONE')
call s:CreateGroup('Conceal', s:color.none, s:color.lightcharcol, 'NONE')

call s:LinkGroup('NonText', 'SpecialKey')
call s:LinkGroup('CursorLineNr', 'Operator')
call s:LinkGroup('Function', 'Identifier')
call s:LinkGroup('PreProc', 'Delimiter')
call s:LinkGroup('WarningMsg', 'Error')
call s:LinkGroup('IncSearch', 'Search')
call s:LinkGroup('FoldColumn', 'Folded')
call s:LinkGroup('Statement', 'Structure')
call s:LinkGroup('ModeMsg', 'MatchParen')
call s:LinkGroup('MoreMsg', 'MatchParen')
call s:LinkGroup('Question', 'MatchParen')
call s:LinkGroup('Title', 'Todo')
call s:LinkGroup('Number', 'Boolean')
call s:LinkGroup('CursorLine', 'CursorColumn')
call s:LinkGroup('Ignore', 'None')
call s:LinkGroup('helpleadblank', 'None')
call s:LinkGroup('helpnormal', 'None')
call s:LinkGroup('VisualNOS', 'Underlined')
call s:LinkGroup('SpellBad', 'Undercurl')
call s:LinkGroup('SpellCap', 'Undercurl')
call s:LinkGroup('SpellLocal', 'Undercurl')
call s:LinkGroup('SpellRare', 'Undercurl')
call s:LinkGroup('Number', 'Constant')
call s:LinkGroup('Character', 'Constant')
call s:LinkGroup('Conditional', 'Statement')
call s:LinkGroup('Debug', 'Special')
call s:LinkGroup('Define', 'PreProc')
call s:LinkGroup('Exception', 'Statement')
call s:LinkGroup('Float', 'Number')
call s:LinkGroup('HelpCommand', 'Statement')
call s:LinkGroup('HelpExample', 'Statement')
call s:LinkGroup('Include', 'PreProc')
call s:LinkGroup('Keyword', 'Statement')
call s:LinkGroup('Label', 'Statement')
call s:LinkGroup('Macro', 'PreProc')
call s:LinkGroup('Operator', 'Statement')
call s:LinkGroup('PreCondit', 'PreProc')
call s:LinkGroup('Repeat', 'Statement')
call s:LinkGroup('SpecialChar', 'Special')
call s:LinkGroup('SpecialComment', 'Special')
call s:LinkGroup('StorageClass', 'Type')
call s:LinkGroup('Tag', 'Special')
call s:LinkGroup('Typedef', 'Type')
call s:LinkGroup('htmlEndTag', 'htmlTagName')
call s:LinkGroup('htmlLink', 'Function')
call s:LinkGroup('htmlSpecialTagName', 'htmlTagName')
call s:LinkGroup('htmlTag', 'htmlTagName')
call s:LinkGroup('xmlTag', 'Statement')
call s:LinkGroup('xmlTagName', 'Statement')
call s:LinkGroup('xmlEndTag', 'Statement')
call s:LinkGroup('markdownItalic', 'Preproc')
call s:LinkGroup('diffBDiffer', 'WarningMsg')
call s:LinkGroup('diffCommon', 'WarningMsg')
call s:LinkGroup('diffDiffer', 'WarningMsg')
call s:LinkGroup('diffIdentical', 'WarningMsg')
call s:LinkGroup('diffIsA', 'WarningMsg')
call s:LinkGroup('diffNoEOL', 'WarningMsg')
call s:LinkGroup('diffOnly', 'WarningMsg')
call s:LinkGroup('diffRemoved', 'WarningMsg')
call s:LinkGroup('diffAdded', 'String')

call matchadd('Todo', 'IDEA')
call matchadd('Todo', 'NOTE')
call matchadd('Todo', 'MAGIC')
call matchadd('Todo', 'AUTHOR')
call matchadd('Todo', 'EXAMPLE')
call matchadd('Todo', 'QUESTION')
