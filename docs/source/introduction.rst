Introduction
============

.. _introduction:

PhysiCell Studio is a graphical tool to help create PhysiCell models, run simulations, and interactively visualize results. 

A PhysiCell model is primarily defined with a XML configuration file which specifies primary objects: cell types and substrates (sometimes referred to as signals). Each of these primary objects will have several parameters associated with them to define their behaviors. If there is also an intracellular submodel associated with each cell, then additional files will be provided in the configuration file.
Other optional files can be provided in the configuration file that provide initial conditions (e.g., cell positions) and cell rules to further define their behaviors.

PhysiCell Studio lets users avoid hand-editing an XML configuration file.

Dependencies
------------

We recommend installing the `Anaconda Python distribution <https://www.anaconda.com/products/individual>` to have the necessary Python modules (used by the GUI, data parsing, and visualization). In the future, we will provide a self-contained Studio bundled package.

