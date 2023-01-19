# Dotfiles profile
# ================
#
# Dependencies
# ------------
#
# - markane
# - codium
# - r
# - pandoc
#
# Configuration tips
# ------------------
#
#     echo 'export EDITOR=/usr/local/bin/codium' >> ~/.profile
#     echo 'export DOTFILES_ROOT=$HOME/dotfiles' >> ~/.profile
#     echo 'export KASTEN_ROOT=$HOME/Documents/kasten' >> ~/.profile
#     echo 'source $DOTFILES_ROOT/profile.sh' >> ~/.profile

export PATH="$DOTFILES_ROOT/bin:$PATH"

source $DOTFILES_ROOT/kasten.sh

function dotfiles_validate() {
  # Check that the environment variables are set.
  local variables_unset=0
  if [ -z "${DOTFILES_ROOT}" ]; then
    echo $'\e[1;31m'Variable not set: DOTFILE_ROOT$'\e[0m'
    variables_unset=1
  fi

  if [ -z "${KASTEN_ROOT}" ]; then
    echo $'\e[1;31m'Variable not set: KASTEN_ROOT$'\e[0m'
    variables_unset=1
  fi

  if [ "$variables_unset" -ne "0" ]; then
    return 1
  fi

  # TODO: Install markane.
}

