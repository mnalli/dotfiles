
. ~/.config/bash/plugins/insert_newline.bash/insert_newline.bash


MSM_PREVIEW='batcat --decorations=never --color=always --paging=never -l bash'
MSM_STORE=(~/.local/share/bash/msm/*)

MSM_FZF_PREVIEW_WINDOW='down:3'

. ~/.config/bash/plugins/msm/msm.bash

bind -x '"\ec": msm_capture'
bind -x '"\er": msm_recall'
