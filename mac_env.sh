# Write bash settings
cp ~/mac_env/.bash_profile ~/.bash_profile;
cp ~/mac_env/.bashrc ~/.bashrc;

# Install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Install brew modules

cp ~/mac_env/Brewfile ~/Brewfile
brew bundle

# use zsh - prezto
chsh -s /bin/zsh;
cp ~/mac_env/.zshrc ~/.zshrc;
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto";
source  ~/.zshrc;

# Nodejs
curl -L git.io/nodebrew | perl - setup;
nodebrew install stable;
nodebrew use stable;

npm i -g create-react-app preact-cli yarn hexo-cli gatsby-cli firebase-tools gulp;

# Git Directories
mkdir ~/Repositories
echo "TODO - Get Accsess Tokens of GitHub and bitbuckets"
