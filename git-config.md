# Git config

*Quelques paramètres / manip' utiles dans Git*

---

### Configurer le comportement par défaut d'un `push`

Pour qu'un `git push` effectué sur une branche pousse automatiquement les noveaux
commits de la branche sur l'upstream, exécuter cette commande :

```bash
git config --global push.default upstream
```

### Configurer l'éditeur utilisé par Git

Il est possible de changer l'éditeur utilisé par Git :

```bash
git config --global core.editor <commande>

# par exemple pour Sublime Text installé dans `~/apps/st2/` :
git config --global core.editor "~/apps/st2/sublime_text -n -w"
```


### Rétablir les permissions dans un dépôt Git

Une fausse manip' peut entraîner la modification des fichiers d'un dépôt Git.

Il est possible de les rétablir avec ces commandes

```bash
# À adapter au cas par cas
git diff --summary | grep --color 'mode change 100755 => 100644' | cut -d' ' -f7- | xargs -d'\n' chmod +x
git diff --summary | grep --color 'mode change 100644 => 100755' | cut -d' ' -f7- | xargs -d'\n' chmod -x
```

### Github-like diffs

Avec git 2.9+,

```shell
# https://github.com/so-fancy/diff-so-fancy
npm i -g diff-so-fancy

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
```

### Checkout facilement une PR Github (from https://gist.github.com/piscisaureus/3342247)

Locate the section for your github remote in the `.git/config` file. It looks like this:

```
[remote "origin"]
	fetch = +refs/heads/*:refs/remotes/origin/*
	url = git@github.com:joyent/node.git
```

Now add the line `fetch = +refs/pull/*/head:refs/remotes/origin/pr/*` to this section. Obviously, change the github url to match your project's URL. It ends up looking like this:

```
[remote "origin"]
	fetch = +refs/heads/*:refs/remotes/origin/*
	url = git@github.com:joyent/node.git
	fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
```

Now fetch all the pull requests:

```
$ git fetch origin
From github.com:joyent/node
 * [new ref]         refs/pull/1000/head -> origin/pr/1000
 * [new ref]         refs/pull/1002/head -> origin/pr/1002
 * [new ref]         refs/pull/1004/head -> origin/pr/1004
 * [new ref]         refs/pull/1009/head -> origin/pr/1009
...
```

To check out a particular pull request:

```
$ git checkout pr/999
Branch pr/999 set up to track remote branch pr/999 from origin.
Switched to a new branch 'pr/999'
```
