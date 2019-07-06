# Git prompt

Pour faciliter l'utilisation de git en ligne de commande, j'utilise un prompt custom.
Ce bash prompt permet de voir sur quelle référence (branche, tag, commit) vous êtes et le statut du repo.

Le script permettant de mettre en place ce prompt (à inclure dans votre `.bashrc`) est `bash-prompt.sh`.

### Installation

Clonez ce dépôt :

```bash
cd ~ && git clone https://github.com/dorian-marchal/git-config
```

*Sourcez* le prompt depuis votre `.bashrc` :

```bash
echo ". ~/git-config/.bash-prompt.sh" >> ~/.bashrc
```

Rechargez le bashrc pour appliquer les changements :

```bash
. ~/.bashrc
```

__Screenshot :__

![screenshot](https://cloud.githubusercontent.com/assets/6225979/7671431/4c5fc2ce-fcd0-11e4-81f0-db91da522592.png)

__Notes :__

- Le script parse la sortie de git, si git ne fait pas ses sorties en anglais, le prompt ne fonctionnera pas correctement.

  ```bash
  # Ajouter cet alias dans le .bashrc pour passer git en anglais :
  # alias git='LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 git'
  # avec la commande suivante :
  echo "alias git='LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 git'" >> ~/.bashrc
  
  # Puis rechargez votre ~/.bashrc
  . ~/.bashrc
  ```

- L'autocomplétion bash doit être activée pour que ça fonctionne. Dans le cas contraire, vous verrez sans doute une ligne de ce genre :

  ```
  __git_ps1: command not found
  ```
  
  Installer le package `bash-completion` peut suffire :
  ```bash
  apt-get install bash-completion
  ```
