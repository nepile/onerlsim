# The ONE Sanata Dharma University Mod

A modified [The ONE Simulator](https://github.com/knightcode/the-one-pitt) 
repository by students of Sanata Dharma University (Jarkom).

The ONE is an Opportunistic Network Environment simulator that provides a
powerful tool for generating mobility traces, running DTN messaging
simulations with different routing protocols, and visualizing both
simulations interactively in real-time and results after their completion.

## Complete Information

Please read this repository's [**wiki**](https://github.com/Trustacean/the-one-sdu-mod/wiki).

## Compiling, Running, and Documentation

This project uses a unified **Makefile** to automate building, running, and generating documentation seamlessly across both **Windows and Linux/macOS**. The execution scripts are safely contained within the `cmd/` directory.

### Compilation
To compile the simulator (outputs to the `target/` directory):
```
make compile
```

### Quick Running
To run the simulator with GUI:
```
make run 1 [path-to-setting-file]
```

To run the simulator in batch mode (no GUI):
```
make run-batch 1 [path-to-setting file]
```

**Note:** _If you do not have make installed, you can manually execute the scripts located in the `cmd/` folder (e.g., .`\cmd\compile.bat` and `.\cmd\one.bat` for Windows, or `./cmd/compile.sh` and `./cmd/one.sh` for Linux)._

### Generating Documentation
To generate Javadoc documentation for the source code:

```
make create-docs
```
_The generated HTML documentation will be available in the docs/ directory. Open docs/index.html to view it._

Configuring running with multiple parameters are elaborated in
[wiki#configuring](https://github.com/Trustacean/the-one-sdu-mod/wiki#configuring)
and [wiki#running](https://github.com/Trustacean/the-one-sdu-mod/wiki#running).

## Project Structure
This repository is organized to directories as follows:
```
.
├───cmd                          ### AUTOMATION SCRIPTS (Windows .bat & Linux .sh)
├───data                         ### 
│   ├───events                   # Events related data
│   └───spatial                  # Routes related data (MapBased)
│       ├───cluster              # cluster route
│       ├───HelsinkiMedium       # helsinki's routes
│       └───Manhattan            # manhattan's routes
├───docs                         ### GENERATED JAVADOCS (via make create-docs)
├───lib                          ### LOCAL LIBRARIES USED FOR CLASSPATH
├───reports                      ### OUTPUT DIRECTORY FOR REPORTS
├───settings                     ### SETTINGS GROUPING
│   ├───demos                    # Feature demos
│   ├───examples                 # Examples
│   ├───wdm_settings             # WDM (idk what these are)
│   ├───default_settings.cfg     # default setting, don't delete/modify
│   └───demo.cfg                 # demo setting
├───src                          ### SOURCE FILES
│   ├───applications             # application implementations
│   ├───core                     # simulator core classes
│   ├───gui                      # simulator GUI files
│   ├───input                    # simulator inputs
│   ├───interfaces               # simulator interfaces
│   ├───movement                 # movement models
│   ├───reinforcement            # reinforcement utility
│   ├───report                   # reporting files
│   ├───routing                  # forwarding algorithms
│   ├───test                     # simulator tests
│   └───ui                       # simulator text UI stuff
├───target                       ### JAVA BINARY OUTPUT DIRECTORY
├───toolkit                      ### LEGACY GRAPHING KIT
└───Makefile                     ### UNIFIED BUILD & RUN AUTOMATION SCRIPT
```
Strictly follow the above structure.

## Important Note
This modern repository uses **Java SDK 21** (LTS) to both compile and run the simulator.
Older versions of Java SDK are not supported. If you want to use the older versions,
refer to the legacy repositories at:
- https://github.com/knightcode/the-one-pitt 
- https://github.com/akeranen/the-one.