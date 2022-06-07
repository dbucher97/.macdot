all: zsh git nvim alacritty tmux karabiner keyboard latexindent.yaml stylua.toml .latexmkrc

zsh: profile
	@echo "\033[0;32m~> Linking $@\033[0m"
	mkdir -p ~/.local/share/zsh/
	curl -L git.io/antigen > ~/.local/share/zsh/antigen.zsh
	ln -snf $(PWD)/.zshrc ~/.zshrc

profile:
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/.profile ~/.profile
	ln -snf $(PWD)/.gnuutils ~/.gnuutils
	@touch ~/.pprofile

git:
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/.gitconfig ~/.gitconfig

nvim: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

alacritty: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

tmux:
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/.tmux.conf ~/.tmux.conf

keyboard:
	@echo "\033[0;32m~> Linking $@\033[0m"
	@mkdir -p "~/Library/Keyboard Layouts/"
	cp -r "$(PWD)/osx-keyboard-layout-german-no-deadkeys/German No Deadkeys.bundle" \
		"~/Library/Keyboard Layouts/"

yabai: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

spacebar: yabai config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

skhd: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

kitty: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

karabiner: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

latexindent.yaml: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

stylua.toml: config
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/.config/$@

.latexmkrc:
	@echo "\033[0;32m~> Linking $@\033[0m"
	ln -snf $(PWD)/$@ ~/$@

config:
	@mkdir -p ~/.config

clean:
	rm -rf ~/.zshrc ~/.profile ~/.gnuutils ~/.gitconfig ~/.config/nvim ~/.tmux.conf \
		"~/Library/Keyboard Layouts/German No Deadkeys.bundle" ~/.config/yabai \
		~/.config/spacebar ~/.config/skhd ~/.config/kitty ~/.config/karabiner \
		~/.config/latexindent.yaml ~/.config/stylua.toml ~/.local/share/zsh/antigen.zsh
