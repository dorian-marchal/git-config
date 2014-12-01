# Git alias

*Quelques alias pour faciliter l'utilisation de git en ligne de commande*

---

## Mettre en place les alias sous Ubuntu

Les alias sont dans le fichier `.gitalias` à la racine du dépôt.
Pour installer ces alias, copiez-collez simplemebnt le contenu de ce fichier dans `~/.gitconfig`.

Sous git 1.7.10+ (`git --version`), il est possible de placer ce fichier dans `~/.gitalias`
et ajoutez cette ligne dans le fichier `~/.gitconfig` :

```bash
[include]
path = .gitalias
```

Il est aussi possible de faire un alias pour `git` (dans mon cas, `g`) de manière classique (par exemple en l'ajoutant dans votre `~/.bashrc`).
Dans ce cas, il faudra ajouter quelques lignes pour faire fonctionner l'autocomplétion de git avec l'alias :

```bash
# alias git -> g
alias g='git'

# à décommenter sous Ubuntu 13.04+
# source /usr/share/bash-completion/completions/git

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g
```

## Mettre en place les alias avec Git Bash sous Windows

## Liste des alias

```bash
# git add
git a
```

```bash
# git commit --amend
git amend
```

```bash
# git branch
git b
```

```bash
# git commit
git c
```

```bash
# git checkout
git co

# git checkout -b
git cob
```

```bash
# git diff --color
git d
```

```bash
# git branch --no-merged dev (fonctionnalités En Développement)
git ed
```

```bash
# git gui
git g
```

```bash
# gitk --all
git k
```

```bash
# git log --pretty=oneline --abbrev-commit --graph ORIG_HEAD.. --stat --no-merges --decorate
git lc
```

```bash
# git merge --no-ff -m
git m
# utilisation :
g m "Effectue telle modif" to-merge-branch


# git merge
git mff
```

```bash
# git log --pretty=oneline --abbrev-commit --graph
git ol

# git --no-pager ol (Affiche tous les logs sans pagination, utile pour `grep`)
git olnp
```

```bash
# git push
git p
```

```bash
# git pull
git pl
```

```bash
# git rebase
git rb
```

```bash
# git status
git s
```

```bash
# git stash
git st

# git stash list
git stl

# git stash apply
git sta

# git stash drop
git std

# git stash show -p
git sts

# git stash pop
git stp
```

```bash
# git reset --soft HEAD^ (Annuler un commit)
git unc
```

```bash
# git shortlog -sne
git who
```
