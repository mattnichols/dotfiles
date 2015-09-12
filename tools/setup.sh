#!/bin/zsh

pushd ~/.dotfiles

# Link to .dotfiles
cutstring="DO NOT EDIT BELOW THIS LINE"
for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
    if [ ! -L $target ]; then
      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
      if [[ -n $cutline ]]; then
        let "cutline = $cutline - 1"
        echo "Updating $target"
        head -n $cutline "$target" > update_tmp
        startline=`tail -r "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        if [[ -n $startline ]]; then
          tail -n $startline "$name" >> update_tmp
        else
          cat "$name" >> update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    if [[ $name != 'install.sh' && $name != 'uninstall.sh' && $name != 'README.md' && $name != 'tools' ]]; then
      echo "Creating $target"
      if [[ -n `grep "$cutstring" "$name"` ]]; then
        cp "$PWD/$name" "$target"
      else
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

popd

# Install Oh My ZSH
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Git
git config --global core.excludesfile ~/.gitignore_global

# Configure Oh My Zsh
sed 's/robbyrussell/peepcode/' "$HOME/.zshrc" > ~/.tmpfile && mv ~/.tmpfile "$HOME/.zshrc"
sed 's/(git)/(bundler zsh_reload rvm z osx terminalapp sublime themes light-rails light-git light-utils mx)/' "$HOME/.zshrc" > ~/.tmpfile && mv ~/.tmpfile "$HOME/.zshrc"
sed "s@\(.*ZSH_CUSTOM=.*$\)@ZSH_CUSTOM=~/.zsh_custom@" "$HOME/.zshrc" > ~/.tmpfile && mv ~/.tmpfile "$HOME/.zshrc"
echo '' >> "$HOME/.zshrc"
echo '' >> "$HOME/.zshrc"
echo 'source "$HOME/.configure"' >> "$HOME/.zshrc"
echo 'export EDITOR="~/bin/subl -w"' >> "$HOME/.zshrc"

if hash brew 2>/dev/null; then
  echo "Homebrew is installed"
else
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo chown -R $USER /usr/local
fi

echo "Updating brews..."
brew update
brew install gpg
brew install wget
brew install node
brew install tree
npm install --global trash
brew install z

echo "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
# echo '`brew --prefix`/etc/profile.d/z.sh' >> "$HOME/.zshrc"
echo 'source "$HOME/.rvm/scripts/rvm"' >> "$HOME/.zshrc"

source "$HOME/.rvm/scripts/rvm"
echo "bundler" >> ~/.rvm/gemsets/global.gems
echo "omglog" >> ~/.rvm/gemsets/global.gems
echo "git-smart" >> ~/.rvm/gemsets/global.gems
echo "wirble" >> ~/.rvm/gemsets/global.gems

rvm install 2.2.0


echo "Setup Complete!"
