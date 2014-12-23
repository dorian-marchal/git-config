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

Ajouter la clé publique aux clés autorisées pour l'utilisateur concerné :

```bash
echo "CONTENU_DE_LA_CLE_PRECEDEMMENT_COPIE" >> ~/.ssh/authorized_keys
```

*__Note :__ La manipulation devrait être similaire pour tout autre serveur sous Linux.*

### Sur Github

Allez dans les paramètres de Github.

![github settings](http://www.dorian-marchal.com/assets/ssh-github-settings.png)

Dans la rubrique __SSH Keys__, cliquez sur __Add SSH key__ et ajoutez la clé depuis le formulaire :

![github key form](http://www.dorian-marchal.com/assets/ssh-github-key.png)

*__Note :__ Il est possible de gérer l'authentification pour chaque dépôt dans les paramètres des dépôts en question.*

## Tester que tout fonctionne

Pour vérifier que l'authentification SSH est bien fonctionnelle, essayez de vous connecter en SSH depuis le terminal (non valable pour Github) :

```bash
ssh user@host
```

Si vous êtes connecté sans avoir à saisir de mot de passe, tout est bon :+1:
