Guide
=====

.. _guide:

Guide
-----

PhysiCell Studio is a graphical tool to simplify PhysiCell model editing. It provides a multi-tabbed GUI that allows graphical editing of the model and its associated XML, including the creation/deletion of fundamental objects, e.g., substrates (or signals) in the microenvironment, and cell types. It also lets users run their model and interactively visualize results, allowing for more rapid model refinement.

This User Guide provides brief, but hopefully sufficient, guidance on using the Studio - at least its contents (not the challenges involved in developing your particular model). If you experience problems or have questions, please contact us using an appropriate PhysiCell community Slack channel or the [Issues section](https://github.com/PhysiCell-Tools/PhysiCell-Studio/issues) of the Studio GitHub repository. The latter is preferred when reporting a fatal error using the Studio. When reporting problems, please provide the Studio version # (found in the `Studio->About` menu) and the steps to reproduce the problem. We welcome Pull Requests in the [Studio repository](https://github.com/PhysiCell-Tools/PhysiCell-Studio) (see instructions there) for bug fixes and suggested improvements.

This Guide will be updated as the Studio itself is updated, however there may be a lag. Therefore, if you are running a recent release of the Studio, you may notice some differences in the content described here.


.. image:: ./guide_imgs/tabs_only.png
* The top-level tabs of the Studio that allow model objects and parameters to be edited.

Dependencies
------------

We recommend installing the `Anaconda Python distribution <https://www.anaconda.com/products/individual>` to have the necessary Python modules (used by the GUI, data parsing, and visualization). In the future, we plan to provide a self-contained Studio bundled package.

Installing and Running
----------------------

The most common way to run the Studio is from a PhysiCell root directory. Of course you can always download just the Studio and explore (File->Open) the example .xml configuration files (in its /config folder), however, without an executable model, you won't be able to run a simulation and plot results. Therefore, for this Guide, we assume you have installed
PhysiCell and have compiled a sample model. (In the terminal command lines shown below, PhysiCell has been installed into a directory `~/PhysiCell`, but yours may be something different depending how you installed it). To download the Studio and have it be installed in its own
directory inside the PhysiCell directory, click this link and download the `get_studio.py`:

* https://github.com/PhysiCell-Tools/PhysiCell-Studio/blob/main/get_studio.py 

.. image:: ./guide_imgs/download_get_studio.png

Then run the script:

.. code-block:: console

  ~/PhysiCell$ python get_studio.py


It will download and install the latest version of the Studio into a directory called `studio` within your PhysiCell directory. The `get_studio.py` script will also print out sample commands for running the Studio, e.g.:


.. code-block:: console

  ~/PhysiCell$ python studio/bin/studio.py          # if no arguments, it tries to load config/PhysiCell_settings.xml 
  or,
  ~/PhysiCell$ python studio/bin/studio.py -c <config_file.xml> -e <executable_program>   # be explicit about the config file and executable
  and,
  ~/PhysiCell$ python studio/bin/studio.py --help


Note:

* there are ways to create an alias and/or a symbolic link to make it easier to run the Studio
* you may need to prefix your executable name with `./`, depending on your PATH environment variable
* this guide will use a Unix-style command syntax; Windows syntax may differ (e.g., you will probably need a ".exe" suffix on the executable program name)

It is important to understand that the XML configuration file you are editing in the Studio will be updated (overwritten) when you do `File->Save` or *when you Run a simulation*. Also, the rules you have in your Rules table will automatically be written to the folder/file you have specified in that tab. But the ICs requires that you explicitly `Save` to the .csv file from the ICs tab. The Studio does not do "instantaneous" updates to the XML, so if it encounters a fatal error and crashes, any changes you made will not be automatically saved. Neither does it track changes you made and warn you of unsaved changes when you quit the Studio. Therefore, if you are working on your own model, it is a good practice to `File->Save` (has keyboard shortcut) occasionally and adopt the habit of making backup copies of any files you consider critical.

Overview
--------

.. image:: ./guide_imgs/tabs_only.png

PhysiCell Studio consists of multiple tabs, each representing a logical grouping of model parameters and/or functionality.
Each tab will be described in detail in the sections below, but briefly they are:

* `Config Basics` - define the domain and other misc parameters of the simulation
* `Microenvironment` - define the microenvironment, i.e., one or more substrates (signals) and their parameters
* `Cell Types` - define one or more cell types and the phenotype parameters associated with each
* `User Params` - define optional "user" parameters that are unique to a particular model 
* `Rules` - optional "rules" associated with a cell type that define cell behaviors in response to signals
* `ICs` - convenience functionality to define simple 2D initial conditions (ICs) for cells
* `Run` - run a simulation and show the normal PhysiCell output to the terminal
* `Plot` - provide plotting options for visualizing output results (even while the simulation is being run)
