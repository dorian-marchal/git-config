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

Les *feature branch* sont des branches locales qui ne doivent pas
nécessairement être poussées sur `origin`
