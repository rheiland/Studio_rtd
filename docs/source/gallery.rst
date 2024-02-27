Gallery
=====

.. _gallery:

Work in progress...

template
--------

.. image:: ./gallery_imgs/template1.png
   :width: 200px
.. image:: ./_static/template_prolif_death.mp4

A very simple model that has 1 cell type ("default") and 1 (unused) substrate ("substrate"). The number of initial cells (=5) are specified as a `User Parameter`. The simulation time is 5 days and results are output every hour. This cell type has a phenotype that includes:

* cell cycle resulting in proliferation
* cell death
* default adhesion and repulsion (mechanics)
* no motility
* no secretion


biorobots
---------

.. image:: ./gallery_imgs/biorobots0.png
   :width: 200px
.. image:: ./gallery_imgs/biorobots_12hr.png
   :width: 200px
.. image:: ./gallery_imgs/biorobots_2days.png
   :width: 200px
.. image:: ./gallery_imgs/biorobots_12hr_director_signal.png
   :width: 200px
.. image:: ./gallery_imgs/biorobots_12hr_cargo_signal.png
   :width: 200px

* 3 cell/agent types: director, cargo, and worker
* 2 substrates (signals): director, cargo
* workers pickup and deliver cargo to directors, using chemotaxis to signals

cancer biorobots
----------------

Similar to the biorobots sample, but now delivering a drug to treat a tumor. Therapy (cargo and worker cells) appears at 7 days, after the tumor has grown in size.

.. image:: ./gallery_imgs/cancerbots_6days.png
   :width: 200px
.. image:: ./gallery_imgs/cancerbots_7days.png
   :width: 200px
.. image:: ./gallery_imgs/cancerbots_8days.png
   :width: 200px
.. image:: ./gallery_imgs/cancerbots_10days.png
   :width: 300px
.. image:: ./gallery_imgs/cancerbots_userparams.png
   :width: 300px

* 3 cell types: cancer, cargo, and worker
* 3 substrates: oxygen, chemoattractant, therapeutic

celltypes3
----------

heterogeneity
-------------

A growing tumor that experiences cell death as oxygen is depleted.
Cancer cells (from .svg output) are color-coded in C++. Live cells are green, but shaded by an oncoprotein value.
Apoptotic cells are red; necrotic are brown. Note in the images with 2 colorbars, the Studio can color cells' custom variables (scalars) with a continuous colormap, e.g., oncoprotein, using
the "full" (.mat, not .svg) output files.

.. image:: ./gallery_imgs/hetero_1hr.png
   :width: 200px
.. image:: ./gallery_imgs/hetero_10days.png
   :width: 200px
.. image:: ./gallery_imgs/hetero_15days.png
   :width: 200px
.. image:: ./gallery_imgs/hetero_32days.png
   :width: 200px

* 1 cell type: cancer
* 1 substrate: oxygen

