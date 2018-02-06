# Mac Local Settings

defaults write NSGlobalDomain AppleLanguages "(en-US)"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Enable `tap to click`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# SecondaryClick
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture 2

defaults write -g com.apple.trackpad.scaling -float 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM h:mm a"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.CrashReporter DialogType -string "none"

defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebkitDeveloperExtrasEnabledPreferenceKey -bool truedefaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 55
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowTabView -bool true

killall Dock
killall Finder
killall SystemUIServer

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
yarn global add create-react-app preact-cli hexo-cli gatsby-cli electron electron-packager firebase-tools gulp parcel-bundler browser-sync docusaurus-init gitbook @storybook/cli

# Users Files
cp ~/mac-env-master/.editorconfig ~/.editorconfig

# Download Links
open http://sketchrunner.com/

# Extensions for VisualStudio Code
code --install-extension EditorConfig.EditorConfig

# Pyenv
pyenv install 3.6.4
pyenv install anaconda3-5.0.1
pyenv versions
pyenv global 3.6.4
source .zshrc
easy_install pip
pip install requests
pip install beautifulsoup4
pip install lxml
