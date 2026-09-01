Introduction
============

.. _introduction:

PhysiCell Studio is a graphical tool to help create PhysiCell models, run simulations, and interactively visualize results. 

A PhysiCell model is primarily defined with a XML configuration file which specifies primary objects: cell types and substrates (sometimes referred to as signals). Each of these primary objects will have several parameters associated with them to define their behaviors. If there is also an intracellular submodel associated with each cell, then additional files will be referenced in the configuration file.
Other optional (.csv) files can be referenced in the configuration file to provide: initial conditions (cell positions, etc.) and cell rules to further define their behaviors.

PhysiCell Studio lets users avoid hand-editing an XML configuration file.

Installation
------------

Galaxy tool (zero install)
**************************

We offer PhysiCell Studio as an interactive tool in the Galaxy platform: https://physicell-studio.readthedocs.io/en/latest/galaxy.html . This version provides a precompiled binary executable (template) model. We may add additional binary models in the future. However, using this version prevents a user from using custom.cpp code for a model.

If you have Galaxy-specific questions, see https://help.galaxyproject.org/.

Desktop tool
************

PhysiCell Studio requires Python and some additional modules listed in `requirements.txt` (found in the Studio source code's root directory). If you do not already have Python installed on your computer, there are a few ways to install it, depending on your operating system (OS):

* in general, for any OS: https://www.python.org/downloads/
* Windows: Python from the Microsoft Store
* Anaconda: any OS, but bundled with LOTS of additional modules: https://www.anaconda.com/products/individual

After you have installed Python, you will need to open a terminal window (e.g., Command Prompt on Windows), change directory to where you installed the PhysiCell Studio source code, and run `pip install -r requirements.txt` (or possibly `pip3 install -r requirements.txt`).


Running
-------

How/where you run PhysiCell Studio will depend on whether you also plan to write custom C++ code for your PhysiCell model. 
The alternative is to run a precompiled `executable` model which can then be used by the Studio to create many different models.

Starting with PhysiCell 1.14.1, we now provide several downloadable "Assets" which include precompiled
executable models. See, for example, the template-win.tar.gz asset ("-win" for Windows) which you can download and uncompress to have an executable `project` and default `config/PhysiCell_settings.xml` configuration file. 
So you should be to run `project` from the command line and see simulation output be printed to the screen. 
One of these executable models, e.g., `project`, could be used in the Studio (in the `Run` tab).

But if you do plan to use the Studio with a full PhysiCell source code installation, it's best to install/run the Studio from the PhysiCell root directory. Therefore, we assume you have installed
PhysiCell and have compiled a sample model. (In the terminal command lines shown below, PhysiCell has been installed into a directory `~/PhysiCell`, but yours may be something different depending how you installed it). To download the Studio and have it be installed in its own
directory inside the PhysiCell directory, click this link and download the "get_studio.py" Python script:

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


(Rather than run the `get_studio.py` Python script, you can also manually download a specific release of the Studio from https://github.com/PhysiCell-Tools/PhysiCell-Studio/releases).

Note:

* there are ways to create an alias and/or a symbolic link to make it easier to run the Studio
* you may need to prefix your executable name with `./`, depending on your PATH environment variable
* this guide will use a Unix-style command syntax; Windows syntax may differ (e.g., you will probably need a ".exe" suffix on the executable program name)
