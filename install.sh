APT_PACKAGES="neovim"
if command -v apt &>/dev/null; then
	sudo apt update && sudo apt install -y $APT_PACKAGES
fi
# Install oh my posh
curl -s https://ohmyposh.dev/install.sh | bash -s

