# dotfiles

This is the centralized repo for my dotfiles

* .git.aliases based on this [article](https://haacked.com/archive/2019/02/14/including-git-aliases/)
* .gitignore based on the [visual studio gitignore on Github](https://github.com/github/gitignore)
* .gitattributes based on [this repo](https://github.com/alexkaratarakis/gitattributes)
* .editorconfig based on [this repo](https://github.com/RehanSaeed/EditorConfig)
* .ohmyposh config file taken from [this gist](https://gist.github.com/shanselman/1f69b28bfcc4f7716e49eb5bb34d7b2c)

To install .git.aliases the following comand can be used:

```sh
curl -o ~/.gitconfig.aliases https://raw.githubusercontent.com/jaxelr/dotfiles/master/git/.gitconfig.aliases
git config --global include.path "~/.gitconfig.aliases"
```
