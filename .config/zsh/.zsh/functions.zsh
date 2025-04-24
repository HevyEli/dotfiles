#My custom functions

# Access to GPT in the CLI. Requires https://github.com/openai/openai-python
gpt() {
    openai api chat_completions.create -m gpt-3.5-turbo -g user "\"$*\""
}

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}