" based off night_owl
" harukai

let s:gui_black = "#282C34"
let s:cterm_black = 16

let s:gui_purple = "#C792EA"
let s:cterm_purple = 176
let s:gui_purple_offset = "#9F74BB"
let s:cterm_purple_offset = 139

let s:gui_yellow = "#FFD787"
let s:cterm_yellow = 222
let s:gui_yellow_offset = "#CCAC6C"
let s:cterm_yellow_offset = 179

let s:gui_magenta = "#C852B7"
let s:cterm_magenta = 111
let s:gui_magenta_offset = "#C763BA"
let s:cterm_magenta_offset = 68

let s:gui_cyan = "#85D5C3"
let s:cterm_cyan = 116
let s:gui_cyan_offset = "#68B0A0"
let s:cterm_cyan_offset = 73

let s:gui_yellow = "#FFBB53"
let s:cterm_yellow = 149
let s:gui_yellow_offset = "#D3B57B"
let s:cterm_yellow_offset = 107

let s:gui_white = "#FFFFFF"
let s:cterm_white = 255

let s:gui_red = "#C44A6B"
let s:cterm_red_offset = 131

let s:gui_orange = "#CF7B5A"
let s:cterm_orange_offset = 166

let s:E1 = [s:gui_white, s:gui_red, s:cterm_white, s:cterm_red_offset]
let s:W1 = [s:gui_white, s:gui_orange, s:cterm_white, s:cterm_orange_offset]

let g:airline#themes#navarch#palette = {}

let s:N1 = [ s:gui_black, s:gui_cyan, s:cterm_black, s:cterm_cyan ]
let s:N2 = [ s:gui_black, s:gui_cyan_offset,  s:cterm_black, s:cterm_cyan_offset ]
let s:N3 = [ s:gui_cyan, s:gui_black, s:cterm_cyan, s:cterm_black ]
let g:airline#themes#navarch#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:C1 = [ s:gui_black, s:gui_purple, s:cterm_black, s:cterm_purple ]
let s:C2 = [ s:gui_purple, s:gui_black, s:cterm_purple, s:cterm_black ]
let s:C3 = [ s:gui_purple, s:gui_black, s:cterm_purple, s:cterm_black ]
let g:airline#themes#navarch#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)

let s:I1 = [ s:gui_black, s:gui_yellow, s:cterm_black, s:cterm_yellow ]
let s:I2 = [ s:gui_black, s:gui_yellow_offset, s:cterm_black, s:cterm_yellow_offset ]
let s:I3 = [ s:gui_yellow, s:gui_black, s:cterm_yellow, s:cterm_black ]
let g:airline#themes#navarch#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:V1 = [ s:gui_black, s:gui_magenta, s:cterm_black, s:cterm_magenta ]
let s:V2 = [ s:gui_black, s:gui_magenta_offset,  s:cterm_black, s:cterm_magenta_offset ]
let s:V3 = [ s:gui_magenta, s:gui_black, s:cterm_magenta, s:cterm_black ]
let g:airline#themes#navarch#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:R1 = [ s:gui_black, s:gui_yellow, s:cterm_black, s:cterm_yellow ]
let s:R2 = [ s:gui_black, s:gui_yellow_offset, s:cterm_black, s:cterm_yellow_offset ]
let s:R3 = [ s:gui_yellow, s:gui_black, s:cterm_yellow, s:cterm_black ]
let g:airline#themes#navarch#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:IA1 = [ s:gui_black, s:gui_purple, s:cterm_black, s:cterm_purple ]
let s:IA2 = [ s:gui_purple, s:gui_black, s:cterm_purple, s:cterm_black ]
let s:IA3 = [ s:gui_purple, s:gui_black, s:cterm_purple, s:cterm_black ]
let g:airline#themes#navarch#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#navarch#palette.normal.airline_error = s:E1

let g:airline#themes#navarch#palette.insert.airline_error =
      \ g:airline#themes#navarch#palette.normal.airline_error

let g:airline#themes#navarch#palette.visual.airline_error =
      \ g:airline#themes#navarch#palette.normal.airline_error

let g:airline#themes#navarch#palette.commandline.airline_error =
      \ g:airline#themes#navarch#palette.normal.airline_error

let g:airline#themes#navarch#palette.normal.airline_warning = s:W1

let g:airline#themes#navarch#palette.insert.airline_warning =
      \ g:airline#themes#navarch#palette.normal.airline_warning

let g:airline#themes#navarch#palette.visual.airline_warning =
      \ g:airline#themes#navarch#palette.normal.airline_warning

let g:airline#themes#navarch#palette.commandline.airline_warning =
      \ g:airline#themes#navarch#palette.normal.airline_warning
