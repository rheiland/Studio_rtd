Guide
=====

.. _guide:

PhysiCell Studio is a graphical tool to simplify PhysiCell model editing. It provides a multi-tabbed GUI that allows graphical editing of the model and its associated XML, including the creation/deletion of fundamental objects, e.g., substrates (or signals) in the microenvironment, and cell types. It also lets users run their model and interactively visualize results, allowing for more rapid model refinement.

This User Guide provides brief, but hopefully sufficient, guidance on using the Studio - at least its contents (not the challenges involved in developing your particular model). If you experience problems or have questions, please contact us using an appropriate PhysiCell community Slack channel or https://github.com/PhysiCell-Tools/PhysiCell-Studio/issues of the Studio GitHub repository. The latter is preferred when reporting a fatal error using the Studio. When reporting problems, please provide the Studio version # (found in the `Studio->About` menu) and the steps to reproduce the problem. We welcome Pull Requests to the `development` branch of https://github.com/PhysiCell-Tools/PhysiCell-Studio (see instructions there) for bug fixes and suggested improvements.

This Guide will be updated as the Studio itself is updated, however there may be a lag. Therefore, if you are running a recent release of the Studio, you may notice some differences in the content described here.


.. image:: ./guide_imgs/tabs_only.png
* The top-level tabs of the Studio that allow model objects and parameters to be edited.

Running
-------

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
