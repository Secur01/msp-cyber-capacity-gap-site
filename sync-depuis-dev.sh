#!/usr/bin/env bash
#
# Ce dépôt N'EST PAS le projet. C'est une cible de publication.
#
# La source, le moteur, les tests (93 tests, 135+ mutations prouvées) et les
# quatre habillages vivent dans ~/projects/msp-cyber-capacity-gap (privé,
# Secur01/msp-cyber-capacity-gap). Ce script copie SON livrable ici — jamais
# l'inverse. `index.html` ne s'édite jamais à la main dans CE dépôt : toute
# correction se fait dans le dépôt de développement, puis se republie ici par
# ce script.
#
# C'est la leçon « copie qui diverge » du reste du travail Secur01 : deux
# copies d'un même calcul finissent par ne plus dire la même chose. Une seule
# source, une commande pour republier.
#
set -euo pipefail

DEV="${DEV_REPO:-$HOME/projects/msp-cyber-capacity-gap}"
ICI="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[ -f "$DEV/dist/index.html" ] || {
  echo "Introuvable : $DEV/dist/index.html — lancez d'abord \`npm run build\` dans le dépôt de dev." >&2
  exit 1
}

# Le livrable n'est copié que si ses propres tests sont verts. On ne publie
# pas un fichier qu'on n'a pas vérifié.
if ! (cd "$DEV" && npm test >/dev/null 2>&1); then
  echo "Les tests du dépôt de dev échouent : rien n'est copié ici." >&2
  exit 1
fi

if cmp -s "$DEV/dist/index.html" "$ICI/index.html"; then
  echo "Déjà à jour — rien à copier."
  exit 0
fi

cp "$DEV/dist/index.html" "$ICI/index.html"
echo "Copié depuis $DEV/dist/index.html ($(wc -c < "$ICI/index.html") octets)."
echo "Reste à faire : git add -A && git commit && git push"
