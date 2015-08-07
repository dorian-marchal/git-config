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
