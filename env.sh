# Mac Local Settings

defaults write NSGlobalDomain AppleLanguages "(en-US)"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write -g com.apple.trackpad.scaling -float 1
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.dock autohide -bool true;
killAll dock;

# Write bash settings
cp ~/mac-env-master/.bash_profile ~/.bash_profile
cp ~/mac-env-master/.bashrc ~/.bashrc

# Install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew modules

cp ~/mac-env-master/Brewfile ~/Brewfile
brew bundle

# use zsh - prezto
chsh -s /bin/zsh
cp ~/mac-env-master/.zshrc ~/.zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
source  ~/.zshrc

# Git Directories
mkdir ~/Repositories
echo "ssh-keygen -t rsa -C your@email.adress"
echo "cp  ~/mac-env-master/config ~/.ssh/config"

# Launch Installers
open "/Applications/Creative Cloud Installer.app"
open '/Applications/CraftManager.app'
open "/Applications/Backup and Sync.app"
open "/Applications/Dropbox.app"
open '/Applications/Cheatsheet.app'

# Nodejs
curl -L git.io/nodebrew | perl - setup
nodebrew install-binary stable
nodebrew use stable

# Yarn modules
yarn global add create-react-app preact-cli hexo-cli gatsby-cli firebase-tools gulp parcel-bundler docusaurus-init gitbook @storybook/cli

# Users Files
cp ~/mac-env-master/.editorconfig ~/.editorconfig

# Download Links
open http://sketchrunner.com/

# Extensions for VisualStudio Code
code --install-extension EditorConfig.EditorConfig
