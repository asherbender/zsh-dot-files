# Get plugins if they do not exist.
zsh-clone-plugins(){
    for pth in "${(@k)PACKAGES}"; do
        if [ ! -d "$pth" ]; then
            echo "\ngit clone $PACKAGES[$pth] $pth"
            git clone $PACKAGES[$pth] $pth
        fi
    done
}

# Update plugins.
zsh-update() {
    for repo in "${PLUGINS}"/*/; do
        echo "\nUpdating ${repo}"
        (cd "${repo}" \
            && git pull \
            && git submodule update --recursive)
    done
}

# Ensure plugins are installed.
zsh-clone-plugins
