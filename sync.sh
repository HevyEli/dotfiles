# gcloud auth login

teller env >.config/eliasm/.env

rm ~/.zshrc

stow .

stow -v --adopt -t ~ zsh

echo "## Follow the instructions at https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions to enable Fira Code in VS Code" \
    | gum format

echo '## Execute `source ~/.zshrc`.' | gum format
