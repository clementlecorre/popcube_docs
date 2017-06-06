
Conteneur
====================================================

Docker utilise simplement des fonctionnalités natives de Linux comme son noyau, ses LXC et cgroups

Docker permet de créer des environnements (appelées containers) de manière à isoler des applications.

Dans le cas de  Docker, le kernel va partager les ressources du système hôte et interagir avec le(s) container(s). Techniquement, Docker n'est pas une VM, pas le moins du monde, mais en terme d'utilisation, Docker peut-être apparenté à une VM.

Comme le container n'embarque pas d'OS, à la différence de la machine virtuelle, il est par conséquent beaucoup plus léger que cette dernière. Il n'a pas besoin d'activer un second système pour exécuter ses applications. Cela se traduit par un lancement beaucoup plus rapide, mais aussi par la capacité à migrer plus facilement un container (du fait de son faible poids) d'une machine physique à l'autre. Autre avantage : les containers Docker, du fait de leur légèreté, sont portables de cloud en cloud.

Cluster swarm
----------------

Conception décentralisée.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Au lieu de gérer la différenciation entre les rôles de nœud au moment du déploiement, le Docker Engine gère toute spécialisation au moment de l'exécution. Vous pouvez déployer les deux types de nœuds, de MANAGER et de WORKER, en utilisant le Docker-engine.

Modèle de service déclaratif
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Docker Engine utilise une approche déclarative pour vous permettre de définir l'état désiré des différents services dans votre stack d'applications. Par exemple, vous pouvez décrire une application composée d'un service Web front-end avec des services de mise en file d'attente de messages et d'un backend de base de données.

Scaling
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour chaque service, vous pouvez déclarer le nombre de tâches que vous souhaitez exécuter. Lorsque vous augmentez ou descendez, le gestionnaire de swarm s'adapte automatiquement en ajoutant ou en supprimant des tâches pour maintenir l'état désiré.

Conciliation de l'état désiré
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Le nœud manager de swarm surveille constamment l'état du cluster et réconcilie toutes les différences entre l'état actuel et l'état souhaité exprimé. Par exemple, si vous configurez un service pour exécuter 10 replica d'un conteneur, et une worker qui héberge deux de ces répliques se bloque, le manager créera deux nouvelles replica pour remplacer les replica qui se sont écrasées.

Le manager Swarm attribue les nouvelles répliques aux travailleurs en cours d'exécution et disponibles.



Réseau multi-hôte (overlay network)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Vous pouvez spécifier un overlay network pour vos services.

Le manager de swarm attribue automatiquement les adresses aux conteneurs sur le overlay network lorsqu'il initialise ou met à jour l'application.


Découverte du service
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Les nœuds du manager Swarm assignent à chaque service dans swarm un nom DNS unique et les load balances exécutant des conteneurs.

Vous pouvez interroger tous les conteneurs qui fonctionnent dans swarm à travers un serveur DNS intégré dans swarm.

Rolling updates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Au moment du déploiement, vous pouvez appliquer les mises à jour du service aux nœuds de façon incrémentielle.


Le manager Swarm vous permet de contrôler le délai entre le déploiement du service sur différents ensembles de noeuds.

Si quelque chose ne va pas, vous pouvez roll-back a la version précédente.



Etats du cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Exemple::

  docker@docker-01:~$ docker node ls
  ID                           HOSTNAME   STATUS  AVAILABILITY  MANAGER STATUS
  fuptalg81pxdsnpwkuewfa648    docker-02  Ready   Active        Reachable
  rsjyyzupmv8lucak1ydkp0rfl    docker-03  Ready   Active        Leader
  sjxyentbtr71eal698jv38w7c    docker-05  Ready   Drain
  xthdbocmuvdtgpuqrcyrzq9v7 *  docker-01  Ready   Active        Reachable



Storage
--------

Pour le stockage on utilise MINIO : `expliqué dans la parti stockage <storage.html#integration-avec-docker>`__.



Stack
--------

Toutes les organisations sont créée avec docker-compose `v3` en stack.
