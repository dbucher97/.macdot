all: zsh git

zsh: profile
	@echo "~> Linking zshrc"
	ln -snf $(PWD)/.zshrc ~/.zshrc

profile:
	@echo "~> Linking profile and gnu"
	ln -snf $(PWD)/.profile ~/.profile
	ln -snf $(PWD)/.gnuutils ~/.gnuutils
	@touch ~/.pprofile

git:
	@echo "~> Linking git"
	ln -snf $(PWD)/.gitconfig ~/.gitconfig

clean:
	rm -f ~/.zshrc ~/.profile ~/.gnuutils ~/.gitconfig
