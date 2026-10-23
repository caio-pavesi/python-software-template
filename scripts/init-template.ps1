# One-time setup: point the docs wiki submodule at this repository's wiki.

$originUrl = git remote get-url origin
$wikiUrl = ($originUrl -replace '\.git$', '') + '.wiki.git'

git config --file .gitmodules submodule.docs.url $wikiUrl

git submodule sync --recursive
git submodule update --init --recursive
