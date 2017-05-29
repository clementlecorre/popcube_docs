
Automatisation
====================================================


Ansible est un outil open-source de gestion de configuration écrit en python (aussi dispo en version commerciale avec une interface graphique et un service de déploiement). La configuration se fait via des fichiers appelés “Playbooks”.

Les avantages : 

* Un système déclaratif : syntaxe YAML facilement lisible, ce qui rend l’apprentissage très rapide.

* Templating des fichiers de configuration : qui permet d’avoir des fichiers dynamiquement générés en fonction de ce que vous voulez, tel que le rôle du serveur, ou bien dépendant d’un autre serveur. En plus le langage de template par défaut est Jinja2, ça plaira aux amateurs de Django.

Quasiment rien à installer. A part Ansible sur votre machine hôte, tout ce dont vous avez besoin c’est d’un accès root via SSH sur vos serveurs cibles.


Provisionning des machines virtuel
------------------------------------------

.. todo:: @Jeremy

Ajout aux cluster swarm
---------------------------

Pour rejoindre le cluster j'utilise le roles : 

 `Github du roles swarm <https://galaxy.ansible.com/atosatto/docker-swarm/>`_

 Exemple Playbooks::

    TASK [atosatto.docker-swarm : Install python-pip.] *****************************
    skipping: [sw01] => (item=(0, u'python-pip'))

    TASK [atosatto.docker-swarm : Install the Python SNI support packages.] ********
    skipping: [sw01] => (item=python-dev)
    skipping: [sw01] => (item=libssl-dev)
    skipping: [sw01] => (item=libffi-dev)

    TASK [atosatto.docker-swarm : Install the Python SNI python-pip dependencies.] ***
    skipping: [sw01] => (item=pyopenssl)
    skipping: [sw01] => (item=ndg-httpsclient)
    skipping: [sw01] => (item=pyasn1)

    TASK [atosatto.docker-swarm : Import Docker APT public key.] *******************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Install yum-utils if necessary.] *****************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Install apt-transport-https if necessary.] *******
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Add the YUM Docker repository.] ******************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Add the APT Docker repository.] ******************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Install Docker dependencies.] ********************
    skipping: [sw01] => (item=linux-image-extra-virtual)

    TASK [atosatto.docker-swarm : Install the Docker Engine.] **********************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Enable the Docker daemon as a service and start it.] ***
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Install docker-py 1.9.0 to fix Ansible issue 17495] ***
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Install docker-py] *******************************
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Add the Docker administrators to the Docker group] ***
    skipping: [sw01] => (item=root)

    TASK [atosatto.docker-swarm : Kill the ansible_user active SSH connections] ****
    skipping: [sw01]

    TASK [atosatto.docker-swarm : Check if "Swarm Mode" is enabled.] ***************
    ok: [sw01]

    TASK [atosatto.docker-swarm : Init "Swarm Mode" on the first manager.] ********* 

Conteneur
---------------------------

Réseaux et dns
^^^^^^^^^^^^^^^^^^^^

Je ping la database de l'organisation de maxime:: 

    docker@docker-02:~$ docker exec -it maxime_api.1.93ms44c6jdslhhazikwbdmrki /bin/sh
    /go/src/github.com/titouanfreville/popcubeapi # ping maxime_database
    PING maxime_database (10.0.3.4): 56 data bytes
    64 bytes from 10.0.3.4: seq=0 ttl=64 time=0.080 ms
    64 bytes from 10.0.3.4: seq=1 ttl=64 time=0.092 ms

Depuis la database je ping le conteneur disponible::

    docker@docker-02:~$ docker service scale maxime_api=5
    docker@docker-03:~$ docker exec -it maxime_database.1.rrppb6d5qaed3cm8n7oa42qes /bin/bash
    root@1c32df28a830:/#
    root@1c32df28a830:/# ping maxime_api
    PING maxime_api (10.0.3.2): 56 data bytes
    64 bytes from 10.0.3.2: icmp_seq=0 ttl=64 time=0.053 ms
    64 bytes from 10.0.3.2: icmp_seq=1 ttl=64 time=0.100 ms
    root@1c32df28a830:/# ping maxime_api.1.m19g9tbv4m6kx4794i1aoi0hh
    PING maxime_api.1.m19g9tbv4m6kx4794i1aoi0hh (10.0.3.18): 56 data bytes


    root@1c32df28a830:/# dig tasks.maxime_api

        ; <<>> DiG 9.9.5-9+deb8u11-Debian <<>> tasks.maxime_api
        ;; global options: +cmd
        ;; Got answer:
        ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42947
        ;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 0

        ;; QUESTION SECTION:
        ;tasks.maxime_api.		IN	A

        ;; ANSWER SECTION:
        tasks.maxime_api.	600	IN	A	10.0.3.7
        tasks.maxime_api.	600	IN	A	10.0.3.9
        tasks.maxime_api.	600	IN	A	10.0.3.3
        tasks.maxime_api.	600	IN	A	10.0.3.11
        tasks.maxime_api.	600	IN	A	10.0.3.18

        ;; Query time: 0 msec
        ;; SERVER: 127.0.0.11#53(127.0.0.11)
        ;; WHEN: Mon May 29 12:23:16 UTC 2017
        ;; MSG SIZE  rcvd: 194

Le nom de staks et service:: 

    root@1c32df28a830:/# nslookup maxime_api
    Server:		127.0.0.11
    Address:	127.0.0.11#53

    Non-authoritative answer:
    Name:	maxime_api
    Address: 10.0.3.2

    root@1c32df28a830:/# nslookup tasks.maxime_api
    Server:		127.0.0.11
    Address:	127.0.0.11#53

    Non-authoritative answer:
    Name:	tasks.maxime_api
    Address: 10.0.3.3
    Name:	tasks.maxime_api
    Address: 10.0.3.11
    Name:	tasks.maxime_api
    Address: 10.0.3.7
    Name:	tasks.maxime_api
    Address: 10.0.3.9
    Name:	tasks.maxime_api
    Address: 10.0.3.18


Mise a jours des conteneurs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Exmple : ajout d'un labels::

    docker@docker-02:~$ docker service update maxime_database --update-parallelism 2 --with-registry-auth --container-label-add xyz.popcube.org=maxime
    maxime_database

    "UpdateStatus": {
            "State": "completed",
            "StartedAt": "2017-05-29T12:11:49.342150133Z",
            "CompletedAt": "2017-05-29T12:12:32.897318749Z",
            "Message": "update completed"
        }
    docker@docker-02:~$ docker service update maxime_api    
    "UpdateStatus": {
                "State": "updating",
                "StartedAt": "2017-05-29T12:36:21.96182509Z",
                "CompletedAt": "1970-01-01T00:00:00Z",
                "Message": "update in progress"
            }    

            ID            NAME              IMAGE                                              NODE       DESIRED STATE  CURRENT STATE            ERROR  PORTS
            fg54tw7l62lb  maxime_api.1      registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-01  Running        Running 2 minutes ago
            m19g9tbv4m6k   \_ maxime_api.1  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-03  Shutdown       Shutdown 3 minutes ago
            93ms44c6jdsl   \_ maxime_api.1  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-02  Shutdown       Shutdown 27 minutes ago
            xyq4od3bl2l4   \_ maxime_api.1  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-01  Shutdown       Shutdown 3 days ago
            vitoudmvt0nd  maxime_api.2      registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-03  Running        Running 2 minutes ago
            tn1hudgg18ve   \_ maxime_api.2  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-01  Shutdown       Shutdown 3 minutes ago
            klvmqfyi3vn9  maxime_api.3      registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-02  Running        Running 2 minutes ago
            p3opbb8iq86w   \_ maxime_api.3  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-02  Shutdown       Shutdown 3 minutes ago
            n9wg7howeasg  maxime_api.4      registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-01  Running        Running 2 minutes ago
            f75oupbzedf1   \_ maxime_api.4  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-01  Shutdown       Shutdown 3 minutes ago
            uhha8n4lajcr  maxime_api.5      registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-02  Running        Running 2 minutes ago
            34sja7n3xcv5   \_ maxime_api.5  registry.popcube.xyz:5000/popcubeapi:alpha-1.1.11  docker-02  Shutdown       Shutdown 3 minutes ago                



Portabilité
^^^^^^^^^^^^^^^^

Les images se déplace facillement entre les noeuds 

Exemple de nos images docker::
    
    registry.popcube.xyz:5000/popcubeapi : 332 MB
    registry.popcube.xyz:5000/popcube_website : 18 MB

Monitoring
--------------------

Grace à l'écoute sur la socket les nodes exploreurs récoltent directement les nouveaux conteneurs qui sont créé.

Reverse Proxy
--------------------

Selon les labels (swarm) du service, Traefik génére automatiquement la configuration de redirections.