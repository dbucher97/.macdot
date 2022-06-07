all: zsh git nvim alacritty

zsh: profile
	@echo "\033[0;32m~> Linking zshrc\033[0m"
	ln -snf $(PWD)/.zshrc ~/.zshrc

profile:
	@echo "\033[0;32m~> Linking profile and gnu\033[0m"
	ln -snf $(PWD)/.profile ~/.profile
	ln -snf $(PWD)/.gnuutils ~/.gnuutils
	@touch ~/.pprofile

git:
	@echo "\033[0;32m~> Linking git\033[0m"
	ln -snf $(PWD)/.gitconfig ~/.gitconfig

nvim:
	@echo "\033[0;32m~> Linking nvim\033[0m"
	@mkdir -p ~/.config
	ln -snf $(PWD)/nvim ~/.config/nvim

alacritty:
	@echo "\033[0;32m~> Linking alacritty\033[0m"
	@mkdir -p ~/.config
	ln -snf $(PWD)/nvim ~/.config/alacritty

clean:
	rm -f ~/.zshrc ~/.profile ~/.gnuutils ~/.gitconfig ~/.config/nvim
