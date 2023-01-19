function kasten_journal() {
  (cd "$KASTEN_ROOT" && markane new journals)
}

function kasten_open() {
  (cd "$KASTEN_ROOT" && fd . notes papers journals people sources archive | sort -r | fzf --preview="bat -f --style='plain' {}" --preview-window=wrap --ansi | xargs codium)
}

function kasten_source() {
  local citationKey=$(cd "$KASTEN_ROOT" && markane bibliography | jq '.[] | ."citation-key"' --raw-output | fzf --preview-window=wrap --preview="markane bibliography -c {} | jq 'try ((.author | map(.family + \", \" + .given) | join(\", \")) + \". \") catch \"\" + .title + \".\n\n\" + .abstract' --raw-output --raw-output")
  [[ ! -z "$citationKey" ]] && (cd "$KASTEN_ROOT" && markane new sources -c "$citationKey")
}

alias m=markane

alias k=kasten_open
alias kj=kasten_journal
alias ks=kasten_source
