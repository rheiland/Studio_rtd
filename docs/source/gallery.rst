Gallery
=====

.. _gallery:

Work in progress...

template
--------

.. image:: ./gallery_imgs/template1.png
   :width: 240px

A very simple model that has 1 cell type ("default") and 1 (unused) substrate ("substrate"). The number of initial cells (=5) are specified as a `User Parameter`. The simulation time is 5 days and results are output every hour. This cell type has a phenotype that includes:

* cell cycle resulting in proliferation
* cell death
* default adhesion and repulsion (mechanics)
* no motility
* no secretion


biorobots
---------

.. image:: ./gallery_imgs/biorobots0.png
   :width: 240px
.. image:: ./gallery_imgs/biorobots_12hr.png
   :width: 240px
.. image:: ./gallery_imgs/biorobots_2days.png
   :width: 240px
.. image:: ./gallery_imgs/biorobots_12hr_director_signal.png
   :width: 240px
.. image:: ./gallery_imgs/biorobots_12hr_cargo_signal.png
   :width: 240px

* 3 cell/agent types: director, cargo, and worker
* 2 substrates (signals): director, cargo
* workers pickup and deliver cargo to directors, using chemotaxis to signals

cancer biorobots
----------------

Similar to the biorobots sample, but now delivering a drug to treat a tumor. Therapy (cargo and worker cells) appears at 7 days, after the tumor has grown in size.

.. image:: ./gallery_imgs/cancerbots_6days.png
   :width: 240px
.. image:: ./gallery_imgs/cancerbots_7days.png
   :width: 240px
.. image:: ./gallery_imgs/cancerbots_8days.png
   :width: 240px
.. image:: ./gallery_imgs/cancerbots_10days.png
   :width: 240px
.. image:: ./gallery_imgs/cancerbots_userparams.png
   :width: 360px


