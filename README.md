# MSP Cyber Capacity Gap

Un outil d'une seule page, à donner à un propriétaire de MSP. Il entre la taille de
son parc et de son équipe ; la page lui rend la charge de cybersécurité **mesurée
chez Secur01** pour un parc de cette taille — en heures et en personnes — et l'écart
avec l'équipe dont il dispose.

**La thèse** : opérer une vraie division de cybersécurité prend des heures que
personne ne compte. L'ajouter par-dessus les opérations TI, avec la même équipe, est
généralement hors de portée. La page ne l'affirme pas — elle laisse le calcul le
montrer, à partir de données réelles plutôt que d'une estimation.

**➡ [Voir la page](https://secur01.github.io/msp-cyber-capacity-gap-site/)**

## Ce que la page calcule

Sept nombres en entrée (utilisateurs gérés, postes gérés, boîtes courriel gérées,
techniciens, part de leur temps prise par les opérations TI, heures de
cybersécurité déclarées aujourd'hui, heures productives par personne) donnent :

- **la charge de cybersécurité requise**, en heures par mois et en personnes à
  temps plein — dérivée de ratios mesurés, pas estimés ;
- **la couverture** de cette charge par l'équipe actuelle, avec un verdict
  (couvert / sous-capacité / hors de portée de l'équipe actuelle) ;
- **trois réalités mesurées** qui expliquent pourquoi une moyenne ne suffit pas :
  la dispersion entre clients d'une même taille, la variabilité d'un mois à
  l'autre, et la concentration du temps sur une faible part des interventions.

Chaque affirmation renvoie à la mesure qui la fonde, datée, avec ses hypothèses
énoncées explicitement (« Ce que ce calcul suppose »).

## D'où viennent les chiffres

Mesuré chez Secur01 sur **24 mois** (2024-09 à 2026-08) — **12 327 billets** et
**5 960 heures** de travail de cybersécurité réalisé par nos équipes. Ni une enquête
ni un sondage sectoriel : nos propres feuilles de temps, au dixième d'heure.

## Confidentialité

Le fichier ne fait aucune requête réseau : aucun script tiers, aucune police
externe, aucun envoi de données. Ouvert depuis le disque, il fonctionne
entièrement hors ligne. Rien de ce qu'un lecteur y saisit ne quitte son
navigateur.

## Ce dépôt

`index.html` est le seul fichier qui compte : il se télécharge et s'ouvre
directement, sans serveur. Il est aussi publié tel quel par GitHub Pages, à
l'adresse ci-dessus.

Ce dépôt est une **cible de publication**, pas le projet. La source — le moteur de
calcul, le texte bilingue FR/EN, les mesures, les tests (93 tests, 135+ mutations
vérifiées) et les autres habillages visuels — vit dans un dépôt de développement
distinct et privé. `index.html` ne se modifie jamais ici à la main ; il se republie
depuis ce dépôt de développement via [`sync-depuis-dev.sh`](sync-depuis-dev.sh).

— Secur01, fournisseur de services de sécurité gérés.
