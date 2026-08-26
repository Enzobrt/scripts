#!/run/current-system/sw/bin/bash

TOGGL_TOKEN="8f8c4d8e6fd148018caef8909e617845"
WORKSPACE_ID="21377382"
AUTH=$(echo -n "$TOGGL_TOKEN:api_token" | base64)

SCRIPT_DIR="/home/enzo/Documents/Programación/scripts"
TIME_FILE="$SCRIPT_DIR/toggl_time.txt"

start_timer() {
    echo "Starting Toggl timer..."

    curl -s -X POST \
        "https://api.track.toggl.com/api/v9/workspaces/$WORKSPACE_ID/time_entries" \
        -H "Authorization: Basic $AUTH" \
        -H "Content-Type: application/json" \
        -d "{
            \"description\": \"Minecraft\",
            \"tags\": [\"gaming\"],
            \"start\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",
            \"duration\": -1,
            \"workspace_id\": $WORKSPACE_ID,
            \"created_with\": \"minecraft-monitor\"
        }"
    echo
}

update_timer() {
    PID=$(pgrep -af java | grep -E -- '--launchTarget|fml\.mcVersion|net\.minecraft' | head -n1 | cut -d' ' -f1)

    if [ -n "$PID" ]; then
        ps -p "$PID" -o etime= > "/home/enzo/Documents/Programación/scripts/toggl_time.txt"
    fi
}

is_minecraft_running() {
    pgrep -af java | grep -E -- 'fml\.mcVersion|--launchTarget' > /dev/null
}

stop_timer() {
    echo "Stopping Toggl timer..."

    ENTRY=$(curl -s \
        "https://api.track.toggl.com/api/v9/me/time_entries/current" \
        -H "Authorization: Basic $AUTH")

    ENTRY_ID=$(echo "$ENTRY" |
        grep -o '"id":[0-9]*' |
        head -n1 |
        cut -d: -f2)

    if [ -n "$ENTRY_ID" ]; then
        curl -s -X PATCH \
            "https://api.track.toggl.com/api/v9/workspaces/$WORKSPACE_ID/time_entries/$ENTRY_ID/stop" \
            -H "Authorization: Basic $AUTH"
        echo
    else
        echo "No active Toggl timer found."
    fi
}

MC_RUNNING=false

echo "Monitoring for Minecraft..."

while true; do
    if is_minecraft_running; then
        if [ "$MC_RUNNING" = false ]; then
            MC_RUNNING=true
            echo "Minecraft detected!"
            start_timer
            echo "Opening Eww widget..."
            eww open toggl-widget
        fi
        update_timer
    else
        if [ "$MC_RUNNING" = true ]; then
            MC_RUNNING=false
            echo "Minecraft closed."
            stop_timer
            echo "Closing Eww widget..."
            eww close toggl-widget
        fi
    fi
    sleep 2
done
