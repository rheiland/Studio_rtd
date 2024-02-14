Guide
=====

.. _guide:

PhysiCell Studio is a graphical tool to simplify PhysiCell model editing. It provides a multi-tabbed GUI that allows graphical editing of the model and its associated XML, including the creation/deletion of fundamental objects, e.g., substrates (or signals) in the microenvironment, and cell types. It also lets users run their model and interactively visualize results, allowing for more rapid model refinement.

This User Guide provides brief, but hopefully sufficient, guidance on using the Studio - at least its contents (not the challenges involved in developing your particular model). If you experience problems or have questions, please contact us using an appropriate PhysiCell community Slack channel or https://github.com/PhysiCell-Tools/PhysiCell-Studio/issues of the Studio GitHub repository. The latter is preferred when reporting a fatal error using the Studio. When reporting problems, please provide the Studio version # (found in the `Studio->About` menu) and the steps to reproduce the problem. We welcome Pull Requests to the `development` branch of https://github.com/PhysiCell-Tools/PhysiCell-Studio (see instructions there) for bug fixes and suggested improvements.

This Guide will be updated as the Studio itself is updated, however there may be a lag. Therefore, if you are running a recent release of the Studio, you may notice some differences in the content described here.


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

Sample model: virus-macrophage
------------------------------

We will illustrate the Studio using the PhysiCell virus-macrophage model, i.e., we assume you have created
this model:

.. code-block:: console
  ~/PhysiCell$ make reset
  ~/PhysiCell$ make virus-macrophage-sample
  ~/PhysiCell$ make 

If the resulting config/PhysiCell_settings.xml is in a "flattened" format (which the Studio requires)
then you should be able to run:

.. code-block:: console
  ~/PhysiCell$ python studio/bin/studio.py -p -e virus-sample

# However, if you happen to have an older, hierarchical .xml format then you will need to use the flattened one in the studio folder:

.. code-block:: console
  ~/PhysiCell$ python studio/bin/studio.py -c studio/config/virus_macrophage.xml -e virus-sample

Config Basics
-------------

.. image:: ./guide_imgs/config_virus.png

* === Domain ===
* define the model domain size (we recommend leaving dx=dy=dz=20). A 2D model will have Z range: [-dz/2, dz/2, dz]
* === Times ===
* `Max Time` - of the simulation. `+1 day` convenience button to add 1440 mins (1 day)
* `Diffusion/Mechanics/Phenotype dt` - 3 time scales in a PhysiCell model (rf. the PhysiCell method paper). Only modify if you're an advanced user.
* === Misc runtime params ===
* `# threads` - # of OpenMP threads (to help speed up calculations)
* `output folder` - where the output files will be written; relative to where you Run the simulation.
* `Save data(intervals)` - there are (primarily) two types of output files saved by PhysiCell: `SVG` (.svg; for cells' positions, sizes, colors) and `Full` (.mat; for substrate concentrations and custom data). Currently, in the Plot tab, when you plot *both* cells and substrates, it assumes those files were written at the same simulation time. Therefore, you should provide the *same* interval value for both if you plan to plot both. The `Sync` checkbox helps ensure this. However, if you only plan to plot cells' SVG files, then you can set the `Full` interval to a very high value or simply uncheck it to not have any substrate or cells' custom data saved.
* `Plot SVG substrate` - option to also plot a substrate concentration in the .svg files. If this is enabled, you will need to provide the proper arguments to the `SVG_plot` function in your main.cpp (namely, a custom coloring function for the selected substrate). Refer to the `interaction` sample project for an example.
* === Initial conditions of cells ===
* `enable` - check if you are providing a text file that contains data for the initial conditions of cells, including their positions, cell types, etc.
* === Cells' global behaviors
*  `virtual walls` - if checked, indicates that cells should be nudged away from the domain boundaries when they get too close

Microenvironment
----------------

.. image:: ./guide_imgs/microenv_virus.png

* Define the substrates (or signals) used in the model
* Selecting one in the box on the left will update the parameters on the right.
* The `New` button will create a new substrate with default parameters
* The `Copy` button will create a new substrate with the same parameters as the currently selected substrate
* The `Delete` button will delete the currently selected substrate
* To rename a substrate, double-click it, modify the name, and press the Enter/Return key
* The parameters on the right should be mostly self-explanatory. However, note that the `Dirichlet BC`(Boundary Condition) `Apply to all` button only copies the value provided to each of the boundaries. It does *not* toggle on (enable) those boundaries. You must explicitly enable any boundary that you want to be Dirichlet conditions.
* `calculate gradients` - check if you want substrate gradients to be computed at each "Mechanics dt" timestep. You would need to do so, for example, if certain cell types were chemotaxing (rf. Cell Types | Motility subtab).
* `track in agents` - check if you want cells to keep track of the substrate concentration during secretion


Cell Types
----------

.. image:: ./guide_imgs/celltypes_virus.png

* This tab is used to define one or more cell types and the phenotype for each. Therefore it exposes a large number of parameters. Note that it has subtabs, one for each phenotypic cell behavior.
* On the left is a table of all cell types defined. You can create a `New` one which will be populated with default PhysiCell parameter values, or make a `Copy` of the currrently selected cell type, or `Delete` the selected one. Creating new cell types will always be appended at the end of the table and will be assigned a name with a random 3-character suffix. You should rename them to be more meaningful to your model. (The table should maintain a sequential numbering of cell type IDs, starting with 0.)
* You can rename a cell type by double-clicking its name, typing a new name, and pressing Enter.
* WARNING! Currently, if you rename or delete a cell type, we do not automatically update any rules (in the Rules tab) that used them. However, if you quit the Studio and restart it with the same config file, it will perform a validation check of the cell type names used in Rules and let you know if some reference undefined cell types (and simply not insert those into the rules table).
* On the right, the `Reset to PhysiCell defaults` does just that - it resets all parameter values to their defaults in the core PhysiCell code. This can be useful if you have been experimenting with different parameter values to see the effect they have on your model, but then decide to do a "reset" of the parameters in this section. This same button appears on the other phenotype subtabs and applies to the parameters in each. WARNING: some tabs have dropdown widgets that contain either a list of all substrates or a list of all cell types. The outcome of the `Reset to PhysiCell defaults` will be to reset parameters associated with EVERY object in the dropdown(s). This will likely change in the future.


Cycle
*****

Death
*****

User Params
-----------

.. image:: ./guide_imgs/user_params_virus.png

User parameters are general model parameters (as opposed to Cell Types | Custom Data parameters which are specific to cell data). User parameters are accessed in your model's C++ code. Search for `parameters.ints, parameters.doubles`, etc, in various sample projects' `custom.cpp` files. You can click/drag a column separator in this table to change its width. (Unfortunately, that column width information is not retained if you exit the Studio and start it again)

