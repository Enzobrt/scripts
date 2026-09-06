DIR=/home/enzo/
cd $DIR

while true; do
    INPUT=$(find . -maxdepth 3 | sort | wofi -d)

    if [ -z "$INPUT" ]; then
        break
    fi

    if [ -n "$INPUT" ]; then
        if [ "$INPUT" == . ]; then
            cd ..
        fi

        if [ -d "$INPUT" ]; then
            cd "$INPUT"
            DIR="$INPUT"
        fi

        if [ -f "$INPUT" ]; then
            #xdg-open "$INPUT"
            ghostty -e nvim "$INPUT"
            break
        fi
    fi

    echo "$DIR"
    echo "$INPUT"
done
