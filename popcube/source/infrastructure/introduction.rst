Introduction
============
Popcube est une solution de messagerie instantanée qui se veut rapide, efficace et sécurisée.

Contraintes
===========

Haute Disponibilité
-------------------
L'infrastructure doit être capable de supporter tout type charge.

Pour cela, il faut utiliser 2 datacenters qui fonctionnent en mode actif/actif avec un CDN.

Dans chaque datacenter, il faut un cluster actif/passif pour le serveur frontend.

Stockage et Sauvegarde
----------------------

1. Stockage

Historique de conversation
Réplication sur tout les noeuds pour que les ressources mis en ligne par les utilisateurs puissent être tout le temps accessible.
Changement à chaud des disques

2. Sauvegarde

Etablir un plan de sauvegarde sur un 3ème datacenter pour qu'il puisse assurer une reprise du service (mode dégradé).

La sauvegarde se fera tous les jours à 2H avec un dump des bases de données et des ressources partagées par les utilisateurs.

Une copie des données devra être présente sur le datacenter d'un prestataire pour qu'il puisse effectuer les sauvegardes sur bande tous les jours.

Réseaux
-------
Choix libre pour les protocoles IPv4/IPv6 ainsi que pour le nombre de lien intersite.

Sécurité
--------
Implémenter 2 solutions de sécurité (bannissement IP, chiffrement) car les utilisateurs partageront des données sensibles.

1. Bannissement sur les échecs de connexions

Les adresses IP qui auront échoués 10 fois lors des tentatives de connexion à l'application devront être bannies pendant une durée de 5 minutes.

Si elle rééchoue au bout de 10 essais, elle sera bannie durant 1 semaine.

Enfin, elle est bannie pour 2 mois si 10 autres tentatives ont échouées ...

2. Chiffrement

Les connexions entre les 3 datacenters doivent être entièrement chiffrées.
