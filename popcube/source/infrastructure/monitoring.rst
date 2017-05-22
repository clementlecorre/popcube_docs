Monitoring de l'infrastucture
====================================


.. _grafana : https://grafana.com



Interne
--------

*  ElasticSearch

Puissant moteur de recherche utilisé par exemple par github

* Logstash

Analyse des logs

* Kibana

Les données brutes sont analysées dans Logstash, stockées dans Elasticsearch, mais ne sont pas encore exploitables. Kibana est une interface Web qui se connecte au cluster Elasticsearch, et permet de faire des requêtes en mode texte pour générer des graphiques


* grafana

Grafana vous permet d'interroger, visualiser, alerter et comprendre vos paramètres, peu importe où ils sont stockés.

* prometheus

Prometheus est une boîte à outils de monitoring et d'alerte.
Il s'agit maintenant d'un projet Open Source autonome et maintenu indépendamment de toute entreprise.

* node-exporter / docker-exporter


L'exportateur de Prometheus pour les métriques de matériel et d'OS exposées par les nœuds.


Grafana
^^^^^^^^^^^^^^^^^^

`grafana`_

Les noeuds et les conteneur sont ajoutés/supprimés automatiquement a la supervision


.. image:: ../../_static/infrastructure/monit/grafana_1.png

.. image:: ../../_static/infrastructure/monit/grafana_2.png

.. image:: ../../_static/infrastructure/monit/grafana_3.png


Externe
--------

cloud weave
^^^^^^^^^^^^^^^^^^


Vue des conteneurs

.. image:: ../../_static/infrastructure/monit/scop_1.png

Vue des connexions réseaux In/out

.. image:: ../../_static/infrastructure/monit/scop_2.png

Vue des docker-hosts

.. image:: ../../_static/infrastructure/monit/scop_3.png
