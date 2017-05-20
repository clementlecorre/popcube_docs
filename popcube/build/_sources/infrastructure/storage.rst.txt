.. _minio : https://www.minio.io

.. _miniofs : https://github.com/minio/minfs

.. _mc : https://github.com/minio/mc

.. _plugin : https://github.com/minio/minfs/tree/master/docker-plugin


Stockage et réplication
====================================================

Toutes les données sont stockées sur un cluster `minio`_

* Core `miniofs`_
* CLI `mc`_
* Docker `plugin`_

Minio
-------

.. image:: ../../_static/logo/minio.svg

* S3 amazon

Aavoir une compatibilité S3 amazon.
Les plugins et les SDKs S3 sont assez nombreux sur le marché du cloud.

* Web ui

Une interface pour gérer les buckets.

* Erasure Code

Minio protège les données contre les pannes de matériel et la corruption de données.


Web Ui
^^^^^^^^^^^^

Pour la mises en cluster il est obligatoire d'avoir 4 noeud minio mini

Web interface

.. image:: ../../_static/infrastructure/minio/web_1.png

Share object

.. image:: ../../_static/infrastructure/minio/web_2.png

Public link

.. image:: ../../_static/infrastructure/minio/web_3.png


Minio CLI
^^^^^^^^^^^^

Installation et copie des fichiers dans le bucket `management`

.. image:: ../../_static/infrastructure/minio/cli_1.png

Integration avec docker
^^^^^^^^^^^^^^^^^^^^^^^^


Installation du plugin
""""""""""""""""""""""""""

(Très très très très simple ...)

.. image:: ../../_static/infrastructure/minio/docker_1.png

Déclaration d'un volume minio dans le docker-compose `v3`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

.. image:: ../../_static/infrastructure/minio/docker_2.png

* Term 1 : client
* Term 2 : API_1
* Term 3 : API_2

.. image:: ../../_static/infrastructure/minio/docker_3.png

Les fichiers générés par l'API sont bien présent dans les deux conteneurs
