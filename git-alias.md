# Git alias

*Quelques alias pour faciliter l'utilisation de git en ligne de commande*

---

## Mettre en place les alias sous Ubuntu

Les alias sont dans le fichier `.gitalias` à la racine du dépôt.
Pour installer ces alias, copiez-collez simplement le contenu de ce fichier dans `~/.gitconfig`.

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

## Liste des alias

```bash
# git add
git a
```

```bash
# !git config -l | grep ^alias. (Liste les alias git)
git alias

# !git alias | grep -oP --color=never "alias\.$@=\K(.*)" (voir la description d'un alias)
git aliasg
# Exemple d'utilisation : git aliasg l
```

```bash
# git commit --amend
git amend
```

```bash
# git branch
git b

# git branch -d
git bd

# git branch -D
git bdel
```

```bash
# git commit
git c

# git commit -m
git cm
```

```bash
# git clone
git cl

# !"f() { git clone "git@github.com:$@.git"; }; f"
# (Clone un dépôt Github via le remote SSH)
# Utilisation : git clgh dorian-marchal/git-config
git clgh <user>/<repository>
```

```bash
# git checkout
git co

# git checkout -b
git cob
```

```bash
# git cherry-pick
git cp
```

```bash
# git describe --tags --match "v[0-9]*" --abbrev=0 (Dernier tag du type v[0-9]+)
git current-release
```


```bash
# git diff --color
git d

# git diff --color  --ignore-all-space --stat <commit>
git ds <commit>

# git diff --color  --ignore-all-space--short-stat <commit>
git dss <commit>
```

```bash
# git branch --no-merged dev (fonctionnalités En Développement)
git ed
```

```bash
# git fetch
git f
```

```bash
# echo "4b825dc642cb6eb9a060e54bf8d69288fbee4904" (First Commit : hash de la base de l'arbre git)
git fc
```


```bash
# git gui
git g

# git gui citool (quit git gui on commit)
git gci
```

```bash
# gitk --argscmd='git for-each-ref --format="%(refname)" refs/heads refs/tags'
# (Affiche les branches locales et les tags, seulement)
git k
# gitk --all (Affiche aussi les remote branches)
git ka
# gitk --argscmd='git for-each-ref --format="%(refname)" refs/heads refs/tags' --select-commit=<commit>
git ksc
# gitk --all --select-commit=<commit>
git kasc
```

```bash
# git log --all --graph --abbrev=5 --pretty=tformat:'%C(yellow)%h%Creset -%C(green bold)%d%Creset %s %C(white dim)(%cr) %C(blue bold)<%an>%Creset' --abbrev-commit
git l

# git --no-pager l (Affiche tous les logs sans pagination, utile pour `grep`)
git lnp

# !"f() { git lnp | grep --color -i \"$@\"; }; f" (permet de rechercher avec grep dans les logs)
git lg <pattern>


# !"f() { if [ -z \"$1\" ]; then lc=\"20\"; else lc=$1; fi; git lnp | head -n \"$lc\"; }; f"
# (Affiche les 20 premières lignes de log : Log Head)
git lh
# utilisation :
g lh
# ou (pour les n premières lignes):
g lh <n>

# git log -u <file>
g lu <file>
```

```bash
# git merge --no-ff -e (no fast forward avec message de commit)
git m
# utilisation :
g m <to-merge-branch>

# git merge
git mff
```

```bash
# git mergetool -y (sans confirmation)
git mt
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

# git status -s
git ss
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
# git submodule
git sub

# git submodule init
git subi

# git submodule update
git subu
```

```bash
# git reset HEAD -- (Annuler un `git add .`)
git una

# git reset --soft HEAD^ (Annuler un commit)
git unc
```

```bash
# git shortlog -sne (Nombre de commits par contributeur)
git who
```
