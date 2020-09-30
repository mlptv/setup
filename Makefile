# This Makefile will install anything missing from your Mac
#
# If you need to set up a new Mac, run setup.sh
# After editing a file in this repo,
# run make all to check if dotfiles need updating
# Existing packages will not be updated,
# To update all packages, run update.sh

AG = $(shell brew --prefix)/bin/ag
BASH = $(shell brew --prefix)/bin/bash
BAT = $(shell brew --prefix)/bin/bat
BREW = $(shell brew --prefix)/bin/brew
BTM = $(shell brew --prefix)/bin/btm
EXA = $(shell brew --prefix)/bin/exa
FASD = $(shell brew --prefix)/bin/fasd
FD = $(shell brew --prefix)/bin/fd
FZF = $(shell brew --prefix)/bin/fzf
GH = $(shell brew --prefix)/bin/gh
GIT = $(shell brew --prefix)/bin/git
NVIM = $(shell brew --prefix)/bin/nvim
NODE = $(shell brew --prefix)/bin/node
RSTATS = $(shell brew --prefix)/bin/r
RENAME = $(shell brew --prefix)/bin/rename
RG = $(shell brew --prefix)/bin/rg
SCIM = $(shell brew --prefix)/bin/scim
TMUX = $(shell brew --prefix)/bin/tmux
VIM = $(shell brew --prefix)/bin/vim
VSCODE_LIVESHARE = $(wildcard ~/.vscode/extensions/ms-vsliveshare.vsliveshare-*)
VSCODE_PYTHON = $(wildcard ~/.vscode/extensions/ms-python.python-*)
VSCODE_VIM = $(wildcard ~/.vscode/extensions/vscodevim.vim-*)
XPDF = $(shell brew --prefix)/bin/xpdf

all: ag bash bat bottom brew coc conda exa fasd fd flycut font fzf git ipy iterm jupyter jetbrains karabiner neovim ptpython radian rename repo rg rstudio scim shiftit tmux vim vimr vscode xpdf zsh

ag: $(AG)
bash: $(BASH) ~/.bash_profile ~/.bashrc ~/.inputrc
bat: $(BAT)
bottom: $(BTM) ~/.config/bottom/bottom.toml
brew: $(BREW)
coc: ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
conda: ~/miniconda/bin/conda
exa: $(EXA)
fasd: $(FASD)
fd: $(FD)
flycut: /Applications/Flycut.app
font: ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
fzf: $(FZF)
git: $(GIT) $(GH) ~/.gitconfig ~/.gitignore_global
ipy: ~/miniconda/envs/py ~/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/startup/keybindings.py
iterm: ~/com.googlecode.iterm2.plist /Applications/iTerm.app
jetbrains: /Applications/JetBrains\ Toolbox.app ~/.ideavimrc
jupyter: ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings
karabiner: ~/.config/karabiner/karabiner.json /Applications/Karabiner-Elements.app
neovim: $(NVIM) ~/.config/nvim/init.vim
ptpython: ~/miniconda/bin/ptpython
radian: ~/miniconda/bin/radian
rename: $(RENAME)
repo: ~/mskar/setup
rg: $(RG)
rstudio: ~/miniconda/envs/r ~/.config/rstudio/keybindings/editor_bindings.json ~/.config/rstudio/keybindings/rstudio_bindings.json ~/.config/rstudio/rstudio-prefs.json
scim: $(SCIM)
shiftit: /Applications/ShiftIt.app
tmux: $(TMUX) ~/.tmux.conf ~/.tmux.conf.local ~/.tmux/plugins/tpm
vim: $(VIM) ~/.vimrc
vimr: /Applications/VimR.app
vscode: /Applications/Visual\ Studio\ Code.app $(VSCODE_LIVESHARE) $(VSCODE_PYTHON) $(VSCODE_VIM) ~/Library/Application\ Support/Code/User/keybindings.json ~/Library/Application\ Support/Code/User/settings.json
xpdf: $(XPDF)
zsh: ~/.zsh/powerlevel10k ~/.p10k.zsh ~/.zshrc ~/.zsh/zsh-autosuggestions ~/.zsh/zsh-syntax-highlighting

~/mskar/setup/.bash_profile: repo
~/mskar/setup/.gitconfig: repo
~/mskar/setup/.ideavimrc: repo
~/mskar/setup/.inputrc: repo
~/mskar/setup/.p10k.zsh: repo
~/mskar/setup/.tmux.conf.local: repo
~/mskar/setup/.vimrc: repo
~/mskar/setup/.zshrc: repo
~/mskar/setup/com.googlecode.iterm2.plist: repo
~/mskar/setup/config.py: repo
~/mskar/setup/.radian_profile: repo
~/mskar/setup/editor_bindings.json: repo
~/mskar/setup/init.vim: repo
~/mskar/setup/ipython_config.py: repo
~/mskar/setup/karabiner.json: repo
~/mskar/setup/keybindings.json: repo
~/mskar/setup/keybindings.py: repo
~/mskar/setup/rstudio-prefs.json: repo
~/mskar/setup/rstudio_bindings.json: repo
~/mskar/setup/settings.json: repo

$(AG):
	-brew install ag
$(BASH):
	-brew install bash
~/.bash_profile: ~/mskar/setup/.bash_profile
	curl https://raw.githubusercontent.com/mskar/setup/master/.bash_profile -o ~/.bash_profile
~/.bashrc: ~/mskar/setup/.bashrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.bashrc -o ~/.bashrc
~/.inputrc: ~/mskar/setup/.inputrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.inputrc -o ~/.inputrc
~/.config/bottom/bottom.toml: ~/mskar/setup/bottom.toml
	curl https://raw.githubusercontent.com/mskar/setup/master/bottom.toml -o ~/.config/bottom/bottom.toml --create-dirs
$(BAT):
	-brew install bat
$(BTM):
	-brew install clementtsang/bottom/bottom
$(BREW):
	-echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
~/.config/nvim/coc-settings.json: ~/mskar/setup/coc-settings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/coc-settings.json -o ~/.config/nvim/coc-settings.json --create-dirs
~/.vim/coc-settings.json: ~/mskar/setup/coc-settings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/coc-settings.json -o ~/.vim/coc-settings.json --create-dirs
~/miniconda/bin/conda:
	-curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh
	-bash ~/miniconda.sh -bp ~/miniconda
	-conda install -yc conda-forge cookiecutter neovim
$(EXA):
	-brew install exa
$(FASD):
	-brew install fasd
$(FD):
	-brew install fd
/Applications/Flycut.app:
	-brew cask install flycut
~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf:
	-brew cask install homebrew/cask-fonts/font-fira-code-nerd-font
	-ln -fs ~/Library/Fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.otf ~/Library/Fonts/FiraCodeRegularNerdFontComplete.otf
$(FZF):
	-brew install fzf
	-$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-fish --no-update-rc
$(GH):
	-brew install gh
$(GIT):
	-brew install git
~/.gitconfig: ~/mskar/setup/.gitconfig
	curl https://raw.githubusercontent.com/mskar/setup/master/.gitconfig -o ~/.gitconfig
~/.gitignore_global: ~/mskar/setup/.gitignore_global
	curl https://raw.githubusercontent.com/mskar/setup/master/.gitignore_global -o ~/.gitignore_global
/Applications/iTerm.app:
	-brew cask install iterm2
~/com.googlecode.iterm2.plist: ~/mskar/setup/com.googlecode.iterm2.plist
	curl https://raw.githubusercontent.com/mskar/setup/master/com.googlecode.iterm2.plist -o ~/com.googlecode.iterm2.plist
/Applications/JetBrainsToolbox.app:
	-brew cask install jetbrains-toolbox
	-ln -fs /Applications/JetBrains\ Toolbox.app /Applications/JetBrainsToolbox.app
~/.ideavimrc: ~/mskar/setup/.ideavimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.ideavimrc -o ~/.ideavimrc
/Applications/Karabiner-Elements.app:
	-brew cask install karabiner-elements
~/.config/karabiner/karabiner.json: ~/mskar/setup/karabiner.json
	curl https://raw.githubusercontent.com/mskar/setup/master/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
~/.ipython/profile_default/ipython_config.py: ~/mskar/setup/ipython_config.py
	curl https://raw.githubusercontent.com/mskar/setup/master/ipython_config.py -o ~/.ipython/profile_default/ipython_config.py --create-dirs
~/.ipython/profile_default/startup/keybindings.py: ~/mskar/setup/keybindings.py
	curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.py -o ~/.ipython/profile_default/startup/keybindings.py --create-dirs
$(NODE):
	-brew install node
$(NVIM):
	-brew install neovim
~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings:
	curl https://raw.githubusercontent.com/mskar/setup/master/shortcuts.jupyterlab-settings -o ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/shortcuts.jupyterlab-settings --create-dirs
~/.config/nvim/init.vim: ~/mskar/setup/init.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/init.vim -o ~/.config/nvim/init.vim --create-dirs
~/.config/nvim/ginit.vim: ~/mskar/setup/ginit.vim
	curl https://raw.githubusercontent.com/mskar/setup/master/ginit.vim -o ~/.config/nvim/ginit.vim --create-dirs
~/.zsh/powerlevel10k:
	-git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
~/.p10k.zsh: ~/mskar/setup/.p10k.zsh
	curl https://raw.githubusercontent.com/mskar/setup/master/.p10k.zsh -o ~/.p10k.zsh
~/miniconda/envs/py:
	conda create -yc conda-forge -n py python=3.8 joblib jupyterlab seaborn numpy pandas scikit-learn scipy
~/miniconda/bin/ptpython:
	-pip install ptpython
~/Library/Application\ Support/ptpython/config.py: ~/mskar/setup/config.py
	curl https://raw.githubusercontent.com/mskar/setup/master/config.py -o ~/Library/Application\ Support/ptpython/config.py --create-dirs
~/miniconda/bin/radian:
	-pip install radian
~/.radian_profile: ~/mskar/setup/.radian_profile
	curl https://raw.githubusercontent.com/mskar/setup/master/.radian_profile -o ~/.radian_profile
	ln -sf .radian_profile radian_profile.R
$(RENAME):
	-brew install rename
~/mskar/setup/:
	-git clone https://github.com/mskar/setup ~/py4ds/setup
$(RG):
	-brew install rg
$(RSTATS):
	-brew cask install r
~/miniconda/envs/r:
	conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse
~/.config/rstudio/rstudio-prefs.json: ~/mskar/setup/rstudio-prefs.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio-prefs.json -o ~/.config/rstudio/rstudio-prefs.json --create-dirs
~/.config/rstudio/keybindings/editor_bindings.json: ~/mskar/setup/editor_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/editor_bindings.json -o ~/.config/rstudio/keybindings/editor_bindings.json --create-dirs
~/.config/rstudio/keybindings/rstudio_bindings.json: ~/mskar/setup/rstudio_bindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/rstudio_bindings.json -o ~/.config/rstudio/keybindings/rstudio_bindings.json --create-dirs
$(SCIM):
	-brew install sc-im
/Applications/ShiftIt.app:
	-brew cask install shiftit
$(TMUX):
	-brew install tmux
~/.tmux.conf.local: ~/mskar/setup/.tmux.conf.local
	curl https://raw.githubusercontent.com/mskar/setup/master/.tmux.conf.local -o ~/.tmux.conf.local
~/.tmux.conf:
	curl https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -o ~/.tmux.conf
~/.tmux/plugins/tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$(VIM):
	-brew install vim
~/.vimrc: ~/mskar/setup/.vimrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.vimrc -o ~/.vimrc
/Applications/VimR.app:
	-brew cask install vimr
/Applications/VisualStudioCode.app:
	-brew cask install visual-studio-code
~/Library/Application\ Support/Code/User/settings.json: ~/mskar/setup/settings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/settings.json -o ~/Library/Application\ Support/Code/User/settings.json --create-dirs
~/Library/Application\ Support/Code/User/keybindings.json: ~/mskar/setup/keybindings.json
	curl https://raw.githubusercontent.com/mskar/setup/master/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json --create-dirs
$(VSCODE_PYTHON):
	-code --install-extension ms-python.python --force
$(VSCODE_VIM):
	-code --install-extension vscodevim.vim --force
$(VSCODE_LIVESHARE):
	-code --install-extension ms-vsliveshare.vsliveshare --force
$(XPDF):
	-brew install xpdf
~/.zshrc: ~/mskar/setup/.zshrc
	curl https://raw.githubusercontent.com/mskar/setup/master/.zshrc -o ~/.zshrc
~/.zsh/zsh-autosuggestions:
	-git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
~/.zsh/zsh-syntax-highlighting:
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

.PHONY: bash iterm jetbrains karabiner neovim rstudio tmux vim vscode zsh conda font git ipy repo shiftit flycut
