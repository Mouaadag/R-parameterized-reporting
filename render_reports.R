# Script de génération des rapports paramétrés
# Ce script génère automatiquement un rapport pour chaque année présente dans les données

# Charger les packages nécessaires
if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
}
pacman::p_load(
  tidyverse,
  lubridate,
  quarto
)

# Message de démarrage
cat("===========================================\n")
cat("Génération des rapports paramétrés\n")
cat("===========================================\n\n")

# Créer le dossier rapports s'il n'existe pas
if (!dir.exists("rapports")) {
  dir.create("rapports")
  cat("✓ Dossier 'rapports' créé\n\n")
}

# Charger les données
cat("Chargement des données...\n")
donnees <- read_csv2(
  "data/at-taux.csv",
  locale = locale(encoding = "UTF-8")
)

# Nettoyer les noms de colonnes
colnames(donnees) <- c(
  "Date",
  "Nombre_Accidents",
  "Jours_Absences",
  "TF_mensuel",
  "TF_annuel",
  "TG_mensuel",
  "TG_annuel"
)


# Extraire les années uniques
donnees <- donnees %>%
  mutate(
    Date = as.Date(paste0(Date, "-01")),
    Annee = year(Date)
  )

annees <- donnees %>%
  distinct(Annee) %>%
  pull(Annee) %>%
  sort()

cat("✓ Données chargées\n")
cat(sprintf(
  "✓ %d années détectées: %s\n\n",
  length(annees),
  paste(annees, collapse = ", ")
))

# Créer un tibble avec les paramètres pour chaque rapport
rapports <- tibble(
  input = "rapport_template.qmd",
  output_file = str_glue("rapport_{annees}.html"),
  execute_params = map(annees, ~ list(annee = .x))
)

cat("Génération des rapports en cours...\n")
cat("-------------------------------------------\n")

# Générer tous les rapports
pwalk(rapports, function(input, output_file, execute_params) {
  annee <- execute_params$annee
  cat(sprintf("→ Génération du rapport %d... ", annee))

  # Render the report
  quarto_render(
    input = input,
    execute_params = execute_params,
    quiet = FALSE
  )

  # Move the generated file to the rapports directory
  source_file <- "rapport_template.html"
  dest_file <- file.path("rapports", output_file)

  if (file.exists(source_file)) {
    file.rename(source_file, dest_file)
  }

  cat("✓\n")
})

cat("-------------------------------------------\n\n")
cat("===========================================\n")
cat(sprintf("✅ %d rapports générés avec succès !\n", length(annees)))
cat("===========================================\n\n")
cat("Les rapports sont disponibles dans le dossier 'rapports/'\n\n")

# Lister les fichiers générés
fichiers <- list.files("rapports", pattern = "*.html", full.names = FALSE)
cat("Fichiers créés:\n")
for (fichier in fichiers) {
  cat(sprintf("  • %s\n", fichier))
}
