# vim
cwd=$(pwd)

sudo apt install -y vim-gtk

cp "${cwd}"/miscellaneous/.vimrc "${HOME}"/
cp "${cwd}"/miscellaneous/.ideavimrc "${HOME}"/

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p  # fix for powerline
