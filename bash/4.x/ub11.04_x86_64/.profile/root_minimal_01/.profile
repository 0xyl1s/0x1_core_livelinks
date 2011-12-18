# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n

#¬«««
source ~/.ec1/00mu/bash/00config/.profile.ec1local
#\¬«««

