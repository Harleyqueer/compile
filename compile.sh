#!/bin/bash

# Vérifie si un argument a été fourni
if [ $# -ne 1 ]; then
    echo "Usage: $0 <fichier_source.c>"
    exit 1
fi

# Nom du fichier source
fichier_source="$1"

# Vérifie si le fichier existe
if [ ! -f "$fichier_source" ]; then
    echo "Erreur: le fichier '$fichier_source' n'existe pas."
    exit 1
fi

# Nom du fichier binaire (on enlève l'extension .c)
nom_binaire="${fichier_source%.c}"

# Compilation avec les options spécifiées
gcc -Wall -Wextra -Werror -o "$nom_binaire" "$fichier_source"

# Vérifie le résultat de la compilation
if [ $? -eq 0 ]; then
    echo "Compilation réussie : '$nom_binaire' a été créé."
else
    echo "Erreur lors de la compilation."
    exit 1
fi

