
.. _goconvey : https://github.com/smartystreets/goconvey

Outils de communication
===========================

Slack
------

Slack est une plate-forme de communication collaborative propriétaire (SaaS) ainsi qu'un logiciel de gestion de projets

Plugin :

* Monitoring avec grafana

.. image:: _static/methods/slack_grafana.png


* Travis

.. image:: _static/methods/slack_travis.png


* Github

.. image:: _static/methods/slack_git.png



* Trello

.. image:: _static/methods/slack_trello.png


Contrôle de version
===========================



Git permet, comme beaucoup de ses congénères (Subversion, CVS, Arch ou encore Darcs), de travailler à plusieurs sur un même projet. Mais contrairement à CVS ou Subversion, par exemple, Git ne fait pas de différence entre un dépôt principal et les copies locales chez les différents contributeurs.


Github
--------

GitHub est un outil gratuit pour héberger du code open source

**Les branches DEMO et DEVELOP doivent rester stable en toute circonstance. Si un merge casse la branche, il doit être revert puis corriger avant de le merge de nouveau.**

**La branche master sera mise à jour toute les semaines sur la branche develop. Aucun autre merge ne doit être réaliser sur master en aucune circonstance**

**La branche demo doit êter mise à jour sur develop avant chaque préparation de demo ou en fin de semaine**

Préparer son environement de travail
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Installez `git`, `docker` et `docker-compose`
* Récupérer le code source du projet : `git clone git@github.com:titouanfreville/{REPO}.git || git clone https://github.com/titouanfreville/{REPO}.git`
* Aller dans le dossier obtenu
* `docker-compose up`

Proposer une feature / Séparer les tâches
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Créer une issue sur github contenant un nom (résumant le travail à faire) et l'intégralité de la feature (ex : Nom : HELLO WORLD, Contenu : Créer une page de l'application permettant d'afficher le message : 'Hello World')
* Signaler la création de l'application.
* Voter et ce mettre d'accord ;)

Travailler sur une issue
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Quand une feature est acceptée**

* Créer une branche depuis la branche 'dévelop' nommer `issue-Numéro_de_l'issue-Nom`
* Créer les test unitaires liés à l'issue si non existant
* Faite votre feature
* Tester (lancer les test unitaires, etc.)
* Ouvrir une pull request de votre branche vers master

Format de commit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* ajouter le template de commit a la configuration git. `git config commit.template {Clone_ROOT}/.git_commit_message.txt`
* Un commit doit contenir : le numéro de l'issue (requis), un résumé du travail réaliser(requis), un détails du travail réalisé, la liste de ce qu'il reste à faire, un ping sur les différentes personne concerné par l'issue.

Finir une issue
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Quand une feature est en Pull Request**

* Une personne différente de celle ayant fait l'issue vérifie le code
* La feature est testé et une démo doit être faite (merge sur la branche demo)
* La PR est acceptée
* Merge la branche dans develop
* Tester que develop reste stable

Intégration continue
===========================


L'intégration continue est un ensemble de pratiques, vérifier à chaque modification de code source que le résultat des modifications ne produit pas de régression dans l'application développée.


Travis
-------

Pour faire simple, vous pouvez paramétrer Travis-CI pour qu’à chaque push, il exécute vos tests et vous indique si votre build (plusieurs "jobs") s’est bien déroulé ou non. Cela permet à chaque modification du projet, de s’assurer que tout fonctionne correctement. Cela s’appelle l’intégration continue.

Chaque feature/branch est tester a chaque commit/merge

Tests
===========================

Tests unitaire go
---------------------

On utilise _`goconvey`

GoConvey, un outil de test Go pour les gophers.
Utilisez-le dans le terminal ou le navigateur.

Exemple web ui
^^^^^^^^^^^^^^^^

* Erreur

.. image:: _static/methods/goconvey_fail.png

* OK

.. image:: _static/methods/goconvey_pass.png

* Detail du code

En rouge les zones non coverage

.. image:: _static/methods/goconvey_open.png

Linter
-------

L'utilitaire lint a été l'un des premiers outils d'analyse statique de code source.

Il s'agit d'un outil capable de détecter les erreurs et problèmes potentiels dans votre code.

* Linter pour golang

https://github.com/cl3m3nt666/docker-golinter


Test fonctionnel
------------------

Avec postman il est possible d'écrire des tests, effectué a chaque jobs travis

.. image:: _static/methods/postman.png

Example du fichier pour tester l'api

.. literalinclude:: _static/example/ping.postman.json
   :language: json
