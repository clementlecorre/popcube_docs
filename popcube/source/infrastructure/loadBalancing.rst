
.. _Traefik : https://traefik.io

Load Balancing
===========================

Load Balancing externe
------------------------

Le Load Balancing répartit la charge entre les adresses IP publique des différents noeud du cluster swarm sur les différents datacenters.


.. image:: ../../_static/infrastructure/lb/external_lb.png


Load Balancing : Swarm mode routing mesh
-------------------------------------------------


Le maillage de réseau interne de Swarm permet à chaque noeud du cluster d'accepter les connexions à tout port de service publié dans swarm en acheminant toutes les demandes entrantes vers les noeuds disponibles hébergeant un service avec le port publié.


.. image:: ../../_static/infrastructure/lb/swarm_lb.png


Revers proxy / Load Balancing interne
-------------------------------------------------

`Traefik`_ Est un proxy HTTP inverse moderne et un équilibreur de charge conçu pour déployer des microservices avec facilité.
Il supporte plusieurs backends (Docker, Swarm, Kubernetes, Marathon, Mesos, Consul, Etcd, Zookeeper, BoltDB, Eureka, Amazon DynamoDB, Rest API, fichier ...) pour gérer sa configuration automatiquement et dynamiquement.


.. image:: ../../_static/infrastructure/lb/internal_lb.png

`Traefik`_ écoute sur la sockets docker

Selon les labels (swarm) du service, `Traefik`_ génére automatiquement la configuration de redirections


Exemple :

.. code-block:: yaml
   :linenos:

    deploy:
      labels:
        traefik.port: "3000"
        traefik.frontend.rule: "Host:${ORGANISATION}.popcube.xyz"
        traefik.backend.loadbalancer.sticky: "true"
        traefik.backend.loadbalancer.swarm: "true"
        traefik.docker.network: "traefik-net"


Traefik
^^^^^^^^^^


Configuration

.. image:: ../../_static/infrastructure/lb/traefik_dashboard.png


Statistiques


.. image:: ../../_static/infrastructure/lb/traefik_health.png
