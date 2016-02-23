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

*Voir le fichier `.gitalias`*
