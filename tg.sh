TG_TOKEN=$(< "$PROJECT_DIR"/.tgtoken)
if [[ -n "$TG_TOKEN" ]]; then
    CHAT_ID="-1001141611339"
    commit_head=$(git log --format=format:%H | head -n 1)
    commit_link="https://github.com/$ORG/$repo/commit/$commit_head"
    echo -e "Sending telegram notification"
    printf "<b>Brand: %s</b>" "$brand" >| "$PROJECT_DIR"/working/tg.html
    {
        printf "\n<b>Device: %s</b>" "$codename"
        printf "\n<b>Version:</b> %s" "$release"
        printf "\n<b>Fingerprint:</b> %s" "$fingerprint"
        printf "\n<b>GitHub:</b>"
        printf "\n<a href=\"%s\">Commit</a>" "$commit_link"
        printf "\n<a href=\"https://github.com/%s/%s/tree/%s/\">%s</a>" "$ORG" "$repo" "$branch" "$codename"
    } >> "$PROJECT_DIR"/working/tg.html
    TEXT=$(< "$PROJECT_DIR"/working/tg.html)
    curl -s "https://api.telegram.org/bot${TG_TOKEN}/sendmessage" --data "text=${TEXT}&chat_id=${CHAT_ID}&parse_mode=HTML&disable_web_page_preview=True" > /dev/null
    rm -rf "$PROJECT_DIR"/working/tg.html
fi
