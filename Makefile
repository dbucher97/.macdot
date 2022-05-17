all: zsh git

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

clean:
	rm -f ~/.zshrc ~/.profile ~/.gnuutils ~/.gitconfig
