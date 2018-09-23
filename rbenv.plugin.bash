# Load rbebv, if you are using it

cite about-plugin
about-plugin 'load rbenv, if you are using it'

pathmunge "$HOME"/.rbenv/bin

if [[ -x `which rbenv` ]]; then
    eval "$(rbenv init -)"
fi

if [[ -d "$HOME"/.rbenv/plugins/ruby-build ]]; then
    pathmunge "$HOME"/.rbenv/plugins/ruby-build/bin
fi
