# Set val of email and user name

username="Naruhito Kubota" # TODO - Change this to your name
email="naru.kubota@gmail.com" # TODO - Change this to your email address

# Mac Local Settings

echo "This script will set properties on OSX"

## Language
defaults write NSGlobalDomain AppleLanguages "(en-US)"

## Show Extensions eg. .txt .sh
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

## Disable `Auto collection` and `Auto Capitalization`
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

## Never save to Cloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud false

## Show Scrollbar Automatically
defaults write NSGlobalDomain AppleShowScrollBars "automatic"

## Enable `tap to click`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

## Set speed of Trackpad and Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling 2
defaults write NSGlobalDomain com.apple.trackpad.scaling 2

## Enable Three Fingers Drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Enable Secondary Click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture 2

defaults write -g com.apple.trackpad.scaling -float 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

## Setting of menubar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM h:mm a"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

## Disable
defaults write com.apple.LaunchServices LSQuarantine -bool false

## Disable CrashReporter
defaults write com.apple.CrashReporter DialogType -string "none"

## Enable to select text on Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

## Setting of Safari
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebkitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

## Setting of Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 55

## Setting of Finder
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## Show Statusbar, Pathbar and Tabs
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowTabView -bool true

## Avoid making .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## Set Finder view mode
defaults write com.apple.Finder FXPreferredViewStyle clmv

## Reload Local Settings
killall Dock
killall Finder
killall SystemUIServer

#####################################################

# Homebrew

## Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install brew modules

cp ~/mac-env-master/Brewfile ~/Brewfile
brew bundle &
wait

# zsh - prezto
zsh &
wait

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" &
wait


# zshrcの中身をコピ＝する

cat aliases.sh >> ~/.zshrc
source  ~/.zshrc

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh


# Git Directories
mkdir ~/Repositories
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -C $email
chmod 600 id_rsa
cd ~/

open 'https://github.com/settings/keys'
open 'https://bitbucket.org/'

cat ~/.ssh/id_rsa.pub | pbcopy

{
  echo "Host bitbucket.org"
  echo "  HostName bitbucket.org"
  echo "  IdentityFile ~/.ssh/id_rsa"
  echo "  User git"
  echo "Host github"
  echo "  HostName github.com"
  echo "  IdentityFile ~/.ssh/id_rsa"
  echo "  User git"
} > ~/.ssh/config

git config --global user.name "$username"
git config --global user.email "$email"

# Launch Installers
open '/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
open '/usr/local/Caskroom/google-japanese-ime/latest/GoogleJapaneseInput.pkg'
open '/Applications/CraftManager.app'
open '/Applications/Backup and Sync.app'
open '/Applications/Dropbox.app'
open '/Applications/Recordit.app'

# Install Nodejs with Nodebrew
curl -L git.io/nodebrew | perl - setup &
wait
source ~/.zshrc
nodebrew install stable &
wait
source ~/.zshrc
nodebrew use stable

# Yarn modules
yarn global add create-react-app preact-cli hexo-cli gatsby-cli electron electron-packager firebase-tools gulp parcel-bundler browser-sync docusaurus-init gitbook @storybook/cli

# Users Files
cp ~/mac-env-master/.editorconfig ~/.editorconfig

# Open Download Links
open 'http://sketchrunner.com/'
open 'https://github.com/mathieudutour/git-sketch-plugin'

# Extensions for VisualStudio Code
code --install-extension EditorConfig.EditorConfig

# Install Python with Pyenv
pyenv install 3.6.4
pyenv install anaconda3-5.0.1
pyenv versions
pyenv global 3.6.4 &
wait

source .zshrc
easy_install pip &
wait

pip install requests beautifulsoup4 lxml

# Install ruby with rbenv

rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1

rbenv versions
ruby -v
which bundle


# Vagrant plugins

vagrant plugin install vagrant-share
vagrant plugin install vagrant-hostsupdater
