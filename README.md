# mac-env
Scripts for mac env

Download zip
Edit your name and email address
Extract it

```
mv ~/Downloads/mac-env-master ~/mac-env-master
vim ~/mac-env-master/env.sh
sh ~/mac-env-master/env.sh
```

Execute this command for Prezto.
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Copy .zshrc if you need it.