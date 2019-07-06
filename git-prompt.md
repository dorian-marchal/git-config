# Git prompt

Pour faciliter l'utilisation de git en ligne de commande, j'utilise un [prompt custom](./bash-prompt.sh).
Ce bash prompt indique sur quelle référence (branche, tag, commit) vous êtes et le statut du repo.

Ce prompt doit être sourcé dans le `~/.bashrc` et se trouve dans [`bash-prompt.sh`](./bash-prompt.sh).

### Installation

Clonez ce dépôt :

```bash
cd ~ && git clone https://github.com/dorian-marchal/git-config
```

Sourcez le prompt depuis votre `.bashrc` :

```bash
echo ". ~/git-config/.bash-prompt.sh" >> ~/.bashrc
```

Rechargez le bashrc pour appliquer les changements :

```bash
. ~/.bashrc
```

__Screenshot :__

![screenshot](https://image.noelshack.com/fichiers/2019/27/6/1562427625-screenshot-from-2019-07-06-17-39-44.png)

- L'autocomplétion bash doit être activée pour que le prompt fonctionne. Dans le cas contraire, vous verrez sans doute une ligne de ce genre :

  ```
  __git_ps1: command not found
  ```

  Installer le package `bash-completion` peut suffire :
  ```bash
  sudo apt install bash-completion
  ```
