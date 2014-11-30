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
```

```bash
# git diff --color
git d
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
# git log --pretty=oneline --abbrev-commit --graph ORIG_HEAD.. --stat --no-merges
git lc
```

```bash
# git merge --no-ff
git m
# git merge
git mff
```

```bash
# git log --pretty=oneline --abbrev-commit --graph
git ol
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
