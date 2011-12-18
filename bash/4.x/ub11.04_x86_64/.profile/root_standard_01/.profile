# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n

export PATH="$HOME/.ec1/ec1_admins_scripts/bin:$PATH"
export RUBYLIB="$HOME/.ec1/ec1_admins_scripts/lib:$RUBYLIB"

