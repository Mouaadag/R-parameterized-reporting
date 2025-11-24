# Génération de Rapports 

## L'idée derrière les rapports paramétrés

Dans de nombreuses organisations, le besoin de produire des rapports similaires mais adaptés à des contextes spécifiques (comme différentes périodes, départements ou entités) est fréquent. La génération manuelle de ces rapports peut être répétitive, sujette aux erreurs et chronophage.

C'est là que les **rapports paramétrés** entrent en jeu. L'idée est d'avoir un modèle de rapport unique qui peut être automatiquement rempli et adapté en fonction de certains paramètres. Cela permet de produire rapidement et de manière cohérente de multiples rapports personnalisés à partir d'une seule source, sans copier-coller ni modifications manuelles.

## À propos de ce projet

Ce projet est un exemple concret et fonctionnel de la mise en œuvre de rapports paramétrés. Il est conçu pour générer automatiquement des rapports annuels détaillés sur les accidents du travail.

### Comment ça marche ?

1. **Données source** : Le projet prend en entrée un fichier de données (`data/at-taux.csv`) contenant des indicateurs d'accidents du travail sur plusieurs années.
2. **Modèle unique** : Un seul fichier Quarto (`rapport_template.qmd`) sert de modèle pour tous les rapports. Ce modèle est intelligemment conçu pour intégrer des visualisations R et du texte qui s'adaptent dynamiquement en fonction de l'année spécifiée.
3. **Automatisation** : Un script R (`render_reports.R`) parcourt les données, détecte toutes les années disponibles, puis utilise le modèle Quarto pour générer un rapport HTML distinct pour chaque année.

### Ce que ce projet vous permet de faire

- **Générer des rapports annuels** : Obtenez un rapport HTML dédié à l'analyse des accidents du travail pour chaque année présente dans vos données.
- **Analyse rapide** : Chaque rapport inclut des indicateurs clés, des graphiques d'évolution mensuelle (nombre d'accidents, taux de fréquence, taux de gravité) et un tableau récapitulatif.
- **Cohérence** : Assure une présentation uniforme et sans erreur pour tous les rapports, quelle que soit l'année.
- **Gain de temps** : Élimine le besoin de créer ou d'adapter manuellement des rapports pour chaque période.
