git-config
==========

Liste de toutes les ressources dont j'ai besoin pour mettre en place mon workflow habituel sur Git

Mise en place de l'environnement Git
------------------------------------

### Git prompt

Pour faciliter l'utilisation de git en ligne de commande, j'utilise __[Ultimate GIT PS1 bash prompt](http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt)__.
Ce bash prompt permet de voir sur quelle branche vous êtes et le statut de cette branche.

Le script permettant de mettre en place ce prompt (à inclure dans votre `.bashrc`) se trouve dans `.ultimate-git-ps1-bash-prompt`.

Pour l'inclure, copiez-collez simplement le fichier dans votre home et *sourcez* le dans votre `.bashrc` :

```bash
cp .ultimate-git-ps1-bash-prompt ~
echo ". ~/.ultimate-git-ps1-bash-prompt 2> /dev/null" >> ~/.bashrc
```

Rechargez le bashrc pour voir les changements :

```bash
. ~/.bashrc
```

__Screenshot :__

![screenshot](http://mediadoneright.com/sites/mediadoneright.com/files/manual/GIT_PS1_CUSTOMIZATION.png)

__Notes :__

- Le script parse la sortie de git, si git ne fait pas ses sorties en anglais, le prompt ne fonctionnera pas correctement.
- L'autocomplétion bash doit être activée pour que ça fonctionne. Dans le cas contraire, vous verrez sans doute une ligne du genre :


```
__git_ps1: command not found
```
