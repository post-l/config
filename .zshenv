#~/.zshenv

export PATH="/usr/lib/colorgcc/bin/:/usr/bin:/usr/local/bin:$HOME/bin:/opt:/opt/android-sdk/tools:/opt/android-sdk/platform-tools"
export CCACHE_PATH="/usr/bin"

# Default Viewer/Editor
export VISUAL="emacs -nw"
export EDITOR="emacs -nw"
export PAGER="less"

export TERM="xterm"

# Default File Permissions rw-r--r--
# and rwxr-xr-x For Directory
umask 022

# Proxy HTTP / FTP without password
#export http_proxy="http://proxy.exemple.org:8080"
#export ftp_proxy="ftp://proxy.exemple.org:8080"

# Proxy HTTP / FTP with password
#export http_proxy="http://login:password@proxy.exemple.org:8080"
#export ftp_proxy="ftp://login:password@proxy.exemple.org:8080"

# No Proxy
#export no_proxy="exemple.org"

# Grep with color
export GREP_OPTIONS='--color=auto'
