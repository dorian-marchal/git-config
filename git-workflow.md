# Workflow git

## Mettre en place un projet

__Créer la branche `dev` issue de `master`__ et la pousser sur `origin`

```bash
git checkout -b dev master
git push origin dev
```

### Développer une fonctionnalité

Le développement d'une fonctionnalité ne se fait jamais directement sur
`dev`, les commits doivent être fait sur une *feature branch* spécifique.

1. __Créer la branche `ma-fonctionnalite` issue de `dev`__

 ```bash
 git checkout -b ma-fonctionnalite master
 ```
2. __Récupérer les mise à jour d'`origin/dev`__
 
 Pendant le développement de la fonctionnalité, d'autres utilisateurs
 peuvent avoir poussé des commits sur `origin/dev`.
 Pour le vérifier, récupérer les modifications distantes :

 ```bash
 git fetch origin dev
 ```

 Si des modifications sont présentes, les intégrer dans la branche locale
 `dev` :

 ```bash
 # On se replace sur dev
 git checkout dev
 # On intégre les modifications distantes
 git merge origin/dev
 ```

 Puis rebaser le travail effectué dans `ma-fonctionnalite` sur `dev` :

 ```bash
 # On se remet sur ma-fonctionnalite
 git checkout ma-fonctionnalite
 # Avant de rebaser la fonctionnalité sur dev
 git rebase dev
 ```


 Les *feature branch* sont des branches locales qui ne doivent pas
 nécessairement être poussées sur `origin`

3. __Merger la fonctionnalité dans `dev`__

 Une fois le développement de la fonctionnalité terminé, la branche doit être
 mergée dans `dev` avec l'option `--no-ff` de façon à conserver l'historique
 de la branche. Idéalement, le commit de merge doit intégrer une courte
 description de la nouvelle fonctionnalité :

 ```bash
 git checkout dev
 git merge --no-ff ma-fonctionnalite -m "Ajoute ma fonctionnalité"
 ```

 La *feature branch* n'étant plus nécessaire, il est logique de la supprimer :

 ```bash
 git branch -d ma-fonctionnalite
 ```
