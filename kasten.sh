function kasten_journal() {
  (cd "$KASTEN_ROOT" && fd . journals | sort -r | fzf --preview="bat -f --style='plain' {}" --preview-window=wrap --ansi | xargs codium)
}

function kasten_open() {
  (cd "$KASTEN_ROOT" && fd . notes sources tasks archive | sort -r | fzf --preview="bat -f --style='plain' {}" --preview-window=wrap --ansi | xargs codium)
}

function kasten_open_index() {
  (cd "$KASTEN_ROOT" && codium notes/20220629_index.md)
}

function kasten_new_source() {
  local citationKey=$(cd "$KASTEN_ROOT" && markane bibliography | jq '.[] | ."citation-key"' --raw-output | fzf --preview-window=wrap --preview="markane bibliography -c {} | jq 'try ((.author | map(.family + \", \" + .given) | join(\", \")) + \". \") catch \"\" + .title + \".\n\n\" + .abstract' --raw-output --raw-output")
  [[ ! -z "$citationKey" ]] && (cd "$KASTEN_ROOT" && markane new sources -c "$citationKey")
}

function kasten_new_source_fiction() {
  local citationKey=$(cd "$KASTEN_ROOT" && markane bibliography | jq '.[] | ."citation-key"' --raw-output | fzf --preview-window=wrap --preview="markane bibliography -c {} | jq 'try ((.author | map(.family + \", \" + .given) | join(\", \")) + \". \") catch \"\" + .title + \".\n\n\" + .abstract' --raw-output --raw-output")
  [[ ! -z "$citationKey" ]] && (cd "$KASTEN_ROOT" && markane new sources -c "$citationKey" -T source_fiction)
}

alias m=markane

alias k=kasten_open
alias kj=kasten_journal
alias ki=kasten_open_index
alias ks=kasten_new_source
alias ksf=kasten_new_source_fiction
