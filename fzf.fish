set -l color00 '#dfe4c4'
set -l color01 '#bf616a'
set -l color02 '#5f745d'
set -l color03 '#d08770'
set -l color04 '#5e81ac'
set -l color05 '#b48ead'
set -l color06 '#4a8c99'
set -l color07 '#384f54'
set -l color08 '#5f8170'
set -l color09 '#bf616a'
set -l color0A '#6b8c4f'
set -l color0B '#d08770'
set -l color0C '#5e81ac'
set -l color0D '#b48ead'
set -l color0E '#4a8c99'
set -l color0F '#1c2d28'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"" --color=bg+:$color00,bg:$color00,spinner:$color0E,hl:$color0D"" --color=fg:$color07,header:$color0D,info:$color0A,pointer:$color0E"" --color=marker:$color0E,fg+:$color06,prompt:$color0A,hl+:$color0D"
