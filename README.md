# Génération de Rapports Paramétrés sur les Accidents du Travail

## L'idée derrière les rapports paramétrés

Dans de nombreuses organisations, le besoin de produire des rapports similaires mais adaptés à des contextes spécifiques (comme différentes périodes, départements ou entités) est fréquent. La génération manuelle de ces rapports peut être répétitive, sujette aux erreurs et chronophage.

C'est là que les **rapports paramétrés** entrent en jeu. L'idée est d'avoir un modèle de rapport unique qui peut être automatiquement rempli et adapté en fonction de certains paramètres. Cela permet de produire rapidement et de manière cohérente de multiples rapports personnalisés à partir d'une seule source, sans copier-coller ni modifications manuelles.

## À propos de ce projet

Ce projet est un exemple concret et fonctionnel de la mise en œuvre de rapports paramétrés. Il est conçu pour générer automatiquement des rapports annuels détaillés sur les accidents du travail.

### Comment ça marche ?

1.  **Données source** : Le projet prend en entrée un fichier de données (`data/at-taux.csv`) contenant des indicateurs d'accidents du travail sur plusieurs années.
2.  **Modèle unique** : Un seul fichier Quarto (`rapport_template.qmd`) sert de modèle pour tous les rapports. Ce modèle est intelligemment conçu pour intégrer des visualisations R et du texte qui s'adaptent dynamiquement en fonction de l'année spécifiée.
3.  **Automatisation** : Un script R (`render_reports.R`) parcourt les données, détecte toutes les années disponibles, puis utilise le modèle Quarto pour générer un rapport HTML distinct pour chaque année.

### Ce que ce projet vous permet de faire

-   **Générer des rapports annuels** : Obtenez un rapport HTML dédié à l'analyse des accidents du travail pour chaque année présente dans vos données.
-   **Analyse rapide** : Chaque rapport inclut des indicateurs clés, des graphiques d'évolution mensuelle (nombre d'accidents, taux de fréquence, taux de gravité) et un tableau récapitulatif.
-   **Cohérence** : Assure une présentation uniforme et sans erreur pour tous les rapports, quelle que soit l'année.
-   **Gain de temps** : Élimine le besoin de créer ou d'adapter manuellement des rapports pour chaque période.

## Utilisation

### Prérequis

-   [R](https://www.r-project.org/)
-   [Quarto](https://quarto.org/)
-   Les packages R suivants : `pacman`, `tidyverse`, `lubridate`, `quarto`, `scales`.

### Installation

1.  Clonez ce dépôt :
    ```sh
    git clone https://github.com/votre-nom-utilisateur/votre-repo.git
    cd votre-repo
    ```

2.  Installez les dépendances R (gestion via `renv`) :
    Ouvrez une console R dans le répertoire du projet et exécutez :
    ```r
    renv::restore()
    ```

### Génération des rapports

Pour lancer la génération des rapports, exécutez le script R principal depuis votre terminal :

```sh
Rscript render_reports.R
```

Tous les rapports HTML générés seront sauvegardés dans le dossier `rapports/`.

## Structure du projet

-   `render_reports.R`: Le script orchestrateur qui lit les données, identifie les paramètres (années) et lance la génération de chaque rapport.
-   `rapport_template.qmd`: Le modèle de rapport Quarto. C'est ici que la structure, le contenu textuel et les visualisations R sont définis, en utilisant des variables paramétrées.
-   `data/at-taux.csv`: Le fichier CSV contenant les données brutes des accidents du travail.
-   `rapports/`: Le répertoire de sortie où tous les rapports HTML finaux sont stockés.
-   `.Rprofile`, `renv.lock`, `renv/`: Fichiers et répertoire liés à `renv` pour une gestion reproductible des packages R.

## Personnalisation et extension

-   **Adapter aux nouvelles données** : Remplacez `data/at-taux.csv` par votre propre jeu de données. Assurez-vous que la structure des colonnes est compatible ou adaptez le script `render_reports.R` et le modèle `rapport_template.qmd` en conséquence.
-   **Modifier le design/contenu** : Éditez `rapport_template.qmd` pour changer la mise en page, ajouter de nouvelles analyses, graphiques ou modifier le texte des rapports.
-   **Nouveaux paramètres** : Vous pouvez étendre le concept pour paramétrer les rapports par d'autres variables (ex: départements, régions) en modifiant le script `render_reports.R` pour extraire ces nouveaux paramètres et le modèle `rapport_template.qmd` pour les utiliser.