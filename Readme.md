# dotfiles

This is the centralized repo for my dotfiles

* .git.aliases based on this [article](https://haacked.com/archive/2019/02/14/including-git-aliases/)
* .gitignore based on the [visual studio git ignore on Github](https://github.com/github/gitignore)
* .gitattributes based on the [this repo](https://github.com/alexkaratarakis/gitattributes)
* .editorconfig based on [this repo](https://github.com/RehanSaeed/EditorConfig)

To install .git.aliases i can use the following comand:

```sh
curl -o ~/.gitconfig.aliases https://raw.githubusercontent.com/jaxelr/dotfiles/master/git/.gitconfig.aliases
git config --global include.path "~/.gitconfig.aliases"
```
