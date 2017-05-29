Hyperviseur
============

VMware ESXi
--------------------

VMware ESXi est un hyperviseur qui s'installe directement sur un serveur physique (type bare-metal) pour gérer des machines virtuelles.
Conçus de façon à ce que la surface d’attaque exposée aux logiciels malveillants et aux menaces réseau soit retreinte, il est fiable et sécurisé.

Une fonctionnalité qui le démarque des autres est le vMotion. Elle permet de déplacer des machines virtuelles à chaud d'un serveur physique à un autre sans interruption de service.

.. image:: ../../_static/infrastructure/hyperviseur/esxi.png

Vsphere client
--------------

Logiciel permettant d'administrer un ESXi ainsi que ses machines virtuelles.

.. image:: ../../_static/infrastructure/hyperviseur/vsphere.PNG

Vcenter
-------

C'est une appliance conçus par VMware qui permet de créer et manager un cluster d'ESXi (un hyperviseur d'hyperviseur) car dans notre cas, nous avons besoin d'assurer une haute disponibilité des services.

.. image:: ../../_static/infrastructure/hyperviseur/vcenter.PNG

Clustering
^^^^^^^^^^

Depuis l'interface Vcenter, nous ajoutons les différents ESXi afin de pouvoir les gérer.

Nous créons ensuite un cluster de tous ces hyperviseurs en apppliquant les meileures pratiques pour faire de la haute disponibilité.

.. image:: ../../_static/infrastructure/hyperviseur/cluster.PNG

Stockage
^^^^^^^^

Des baies de stockage seront présentes dans chaque datacenter pour provisionner un stockage en ISCSI afin de stocker les différentes machines virtuelles.
Ajout du stockage ISCSI sur un hyperviseur:

.. image:: ../../_static/infrastructure/hyperviseur/stockage.PNG

Vue globale
-----------
.. image:: ../../_static/infrastructure/hyperviseur/hyperviseur.PNG
