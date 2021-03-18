# dotfiles
sudo apt update & upgrade -y
sudo apt install -y python3 python3-pip build-essential zsh neovim tmux git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -o- -L https://yarnpkg.com/install.sh | bash


# Arraymancer
sudo apt -y install build-essential libopenblas-dev liblapack-dev

# Pytorch
pip3 install torch
