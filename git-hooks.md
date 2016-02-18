# Git hooks

### `hooks/notify-tmp-commit.sh`

Ce `pre-commit` hook permet d'éviter de faire un commit par dessus un commit temporaire (fait avec l'alias `git ctmp`).
Pour l'installer, faire un lien symbolique vers `hooks/notify-tmp-commit.sh` dans `git/hooks`:

```sh
# Par exemple
ln -s ~/.git-config/hooks/notify-tmp-commit.sh .git/hooks/pre-commit
```
