# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles
for file in ~/.{bash_prompt,exports,aliases,functions, extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# e.g. `**/qux` will enter `./foo/bar/baz/qux`
shopt -s autocd;

 # append to the Bash history file, rather than overwriting it
shopt -s histappend;

# TODO: add bash completion
