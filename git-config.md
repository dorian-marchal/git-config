# Git config

*Quelques paramètres utiles dans Git*

---

## Configurer l'éditeur utilisé par Git

Il est possible de changer l'éditeur utilisé par Git :

```bash
git config --global core.editor <commande>

# par exemple pour Sublime Text installé dans `~/apps/st2/` :
git config --global core.editor "~/apps/st2/sublime_text -n -w"
```

