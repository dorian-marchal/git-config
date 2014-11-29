# Git alias

*Quelques alias pour faciliter l'utilisation de git en ligne de commande*

---

## Liste des alias

a = add

amend = commit --amend

b = branch

c = commit

co = checkout

d = diff --color

g = !git gui

k = !gitk --all

lc = !git ol ORIG_HEAD.. --stat --no-merges

m = merge --no-ff
mff = merge

ol = log --pretty=oneline --abbrev-commit --graph

p = push

pl = pull

rb = rebase

rmm = !git ls-files -d -z | xargs -0 git-rm && git status

s = status

st  = stash
stl = stash list
sta = stash apply
std = stash drop
sts = stash show -p
stp = stash pop

unc = reset --soft HEAD^

who = shortlog -sne

## Mettre en place les alias sous Ubuntu

## Mettre en place les alias sous Windows