export N_NODE_MIRROR=https://cdn.npmmirror.com/binaries/node
export N_PREFIX=$HOME/.n
export PNPM_HOME=$HOME/pnpm
export PATH="$PNPM_HOME:$HOME/.n/bin:/usr/local/sbin:$PATH"


# fzf 键位绑定
source <(fzf --zsh)

# 解决 _defer_async_git_register:4: command not found: _omz_register_handler 报错问题
zstyle ':omz:alpha:lib:git' async-prompt no
# zinit 插件

source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

## ssh 用户使用 pure 主题，本地用户使用 robbyrussell 主题
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    zi light sindresorhus/pure
else
    zi snippet OMZL::git.zsh
    zi snippet OMZL::theme-and-appearance.zsh
    zi snippet OMZT::robbyrussell
fi

## 缩写提示
zi load djui/alias-tips
## 目录提示插件
zi snippet OMZP::zsh-interactive-cd
## zsh 命令提示
zi load "zsh-users/zsh-autosuggestions"
## 系统的命令高亮，没有这个命令的话就显示红色，有的话显示绿色
zi load "zsh-users/zsh-syntax-highlighting"
## 目录跳转
zi load rupa/z
## 用 fzf 替换 zsh 默认的完成选择菜单
zinit light Aloxaf/fzf-tab
# zinit 插件配置结束



# 历史配置
HISTFILE=~/.histfile
## 存储在 HISTFILE 中的最大命令数
HISTSIZE=5000
## 从 HISTFILE 加载到内存的最大命令数
SAVEHIST=1000
## 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
## 实时写入历史
setopt SHARE_HISTORY
