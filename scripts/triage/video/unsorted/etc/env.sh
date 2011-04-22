export http_proxy=172.20.0.6:3128
export no_proxy=127.0.0.1,localhost,.local,.insa-rouen.fr
#export http_proxy=""
#export no_proxy=""
export HTTP_PROXY=$http_proxy && export ftp_proxy=$http_proxy && export FTP_PROXY=$http_proxy && export https_proxy=$http_proxy && export HTTPS_PROXY=$http_proxy
export NO_PROXY=$no_proxy
export PATH=$HOME/bin:$PATH
