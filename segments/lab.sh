# Print the current working directory (trimmed to max length).
# NOTE The trimming code's stolen from the web. Courtesy to who ever wrote it.

# Source lib to get the function get_tmux_pwd
source "${TMUX_POWERLINE_DIR_LIB}/tmux_adapter.sh"

TMUX_POWERLINE_SEG_PWD_MAX_LEN_DEFAULT="40"

generate_segmentrc() {
        read -d '' rccontents  << EORC
# Maximum length of output.
export TMUX_POWERLINE_SEG_PWD_MAX_LEN="${TMUX_POWERLINE_SEG_PWD_MAX_LEN_DEFAULT}"
EORC
        echo "$rccontents"
}

__process_settings() {
        if [ -z "$TMUX_POWERLINE_SEG_PWD_MAX_LEN" ]; then
                export TMUX_POWERLINE_SEG_PWD_MAX_LEN="${TMUX_POWERLINE_SEG_PWD_MAX_LEN_DEFAULT}"
        fi
}


run_segment() {
		directories=(
			"$HOME/lab/asm"
			"$HOME/lab/python"
			"$HOME/lab/ruby"
			"$HOME/lab/rust"
			"$HOME/lab/c#"
			"$HOME/lab/c++"
			"$HOME/lab/c"
			"$HOME/lab/html"
			"$HOME/lab/php"
			"$HOME/lab/java"
			"$HOME/lab/javascript"
			"$HOME/lab/go"
			"$HOME/lab/github"
		)
		outputs=(
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
			" "
		)

        __process_settings
        # Truncate from the left.
        tcwd=$(get_tmux_cwd)
for ((i=0; i<${#directories[@]}; i++)); do
    if [[ "$tcwd" == "${directories[i]}" ]]; then
        echo "${outputs[i]}"
        return 0
	elif [[ "$tcwd" == "${directories[i]}"* ]]; then
        echo "${outputs[i]}"
        return 0
    fi
done


}
