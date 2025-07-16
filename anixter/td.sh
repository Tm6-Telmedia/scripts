cd "$(dirname "$0")"
tmpfile=$(mktemp)

find . -type f -name '*.tab' -exec cat {} ';' > "$tmpfile"
mv "$tmpfile" todos.tab
cut -f2- todos.tab > todos_sin_columna.tab
