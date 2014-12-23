# Authentification SSH

*Génération et mise en place de clés SSH pour utiliser un dépôt Git sans avoir besoin de saisir ses pass*

## Générer un couple de clés

Entrez ces commandes dans un terminal :

```bash
ssh-keygen -t rsa
# (Entrez une passphrase pour la clé)
```

S'assurer que les droits sont bons sur la clé :

```bash
chmod 755 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
```

Récupérer tout le contenu de la clé publique :

```
cat ~/.ssh/id_rsa.pub
```

Copier le contenu affiché (tout le contenu et pas seulement la grande chaine bordélique) dans le presse-papier.

*__Note :__ Il est possible de ne pas mettre de passphrase pour la clé, mais dans ce cas toute personne ayant accès à votre clé peut avoir accès à vos dépôts.*

## Autoriser l'authentification via cette clé


### Sur un serveur sous Debian

*__Note :__ Le fonctionnement devrait être similaire pour tout autre serveur sous Linux.*

### Sur Github

*__Note :__ Il est possible de gérer l'authentification pour chaque dépôt dans les paramètres des dépôts en question.*

## Tester que tout fonctionne
