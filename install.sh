#!/bin/sh

if [ -e "$HOME/.dotfiles" ]; then
  echo ""
  echo ""
  echo "!!! dotfiles already installed"
  echo ""
  echo "  To star over run: uninstall_dotfiles"
  echo ""
  exit
fi

pushd "$HOME"
git clone git@github.com:mattnichols/dotfiles.git "$HOME/.dotfiles"
pushd "$HOME/.dotfiles"

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
    if [[ $name != 'install.sh' && $name != 'uninstall.sh' && $name != 'README.md' ]]; then
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
popd

# Install Oh My ZSH
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Configure Oh My Zsh
sed 's/robbyrussell/peepcode/' "$HOME/.zshrc" > ~/.tmpfile && mv ~/.tmpfile "$HOME/.zshrc"
sed 's/(git)/(ruby rvm rails zsh_reload sublime bundler common-aliases)/' "$HOME/.zshrc" > ~/.tmpfile && mv ~/.tmpfile "$HOME/.zshrc"
echo '' >> "$HOME/.zshrc"
echo '' >> "$HOME/.zshrc"
echo 'source "$HOME/.aliases"' >> "$HOME/.zshrc"
echo 'source "$HOME/.configure"' >> "$HOME/.zshrc"
echo 'source "$HOME/.prompt"' >> "$HOME/.zshrc"
echo 'export EDITOR=subl' >> "$HOME/.zshrc"



echo Installing RVM...
if hash brew 2>/dev/null; then
  echo "Homebrew is installed"
else
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Updating brews..."
brew update
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
echo 'source "$HOME/.rvm/scripts/rvm"' >> "$HOME/.zshrc"

source "$HOME/.rvm/scripts/rvm"
zsh -c "source ~/.zshrc && rvm install 2.2.0"
zsh -c "source ~/.zshrc && rvm system 2.2.0"
zsh -c "source ~/.zshrc && rvm use 2.2.0 && rvm @global do gem install bundler"
