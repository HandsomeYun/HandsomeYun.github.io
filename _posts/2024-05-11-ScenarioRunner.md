---
layout: post
title: "Getting Started with Scenario Runner for CARLA"
date: 2024-05-11 15:09:00
description: "A detailed guide on setting up and using Scenario Runner with CARLA simulator."
tags: carla scenario-runner tutorial
categories: carla-posts
featured: false
---

In this post, I’ll walk you through setting up **Scenario Runner** for **CARLA**, a popular autonomous driving simulator. Scenario Runner allows you to run complex scenarios using the OpenSCENARIO standard and extend CARLA’s capabilities.

### Preparation: Installing Scenario Runner

First, ensure you install the version of Scenario Runner that matches your CARLA version. You can find the relevant release on GitHub:

[Scenario Runner Releases](https://github.com/carla-simulator/scenario_runner/releases)

For example, if you're using **CARLA 0.9.12**, download the matching version:

````markdown
```bash
# Example for CARLA 0.9.12
https://github.com/carla-simulator/scenario_runner/releases/tag/0.9.12
```
````

### Setting Up a Virtual Environment

CARLA and Scenario Runner work best with Python 3.7, so we’ll create a virtual environment using Conda:

````markdown
```bash
# Create a virtual environment for Scenario Runner
$ conda create --name scrun python=3.7

# Activate the virtual environment
$ conda activate scrun
```
````

Next, install the required dependencies:

````markdown
```bash
# Navigate to your Scenario Runner folder and install dependencies
$ cd ~/path_to_scenario_runner
$ pip install -r requirements.txt
```
````

Setting Up Environment Variables
You need to set environment variables for CARLA and Scenario Runner so Python can find the appropriate libraries.

````markdown
```bash
# Set the CARLA installation directory
$ export CARLA_ROOT=/path/to/your/carla/installation

# Set the Scenario Runner installation directory
$ export SCENARIO_RUNNER_ROOT=/path/to/your/scenario/runner

# Set the Python path for CARLA
$ export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.12-py3.7-linux-x86_64.egg
$ export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
```
````

Optional: Add to .bashrc
To avoid setting these environment variables every time, you can add them to your .bashrc file:

````markdown
```bash
$ gedit ~/.bashrc
```
````

Paste the following lines at the end of the file:

````markdown
```bash
export CARLA_ROOT=/path/to/your/carla/installation
export SCENARIO_RUNNER_ROOT=/path/to/your/scenario/runner
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.12-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
```
````

You can also create an alias for quickly navigating to the Scenario Runner folder:

````markdown
```bash
alias open_scenario_runner="cd /path_to_scenario_runner"
```
````

### Running Scenario Runner

Once everything is set up, you can start using Scenario Runner. Open a terminal and run:

````markdown
```bash
# Example for running a traditional scenario
$ python scenario_runner.py --scenario FollowLeadingVehicle_1 --reloadWorld
```
````

You can also run custom scenarios using OpenSCENARIO files:

````markdown
```bash
# Running an OpenSCENARIO file
$ python scenario_runner.py --openscenario /path/to/openscenario.xosc --reloadWorld
```
````

### Running Manual Control

To interact manually with the CARLA environment, open another terminal and use the manual_control.py script:

````markdown
```bash
# Install pygame first, if you haven't
$ pip install pygame

# Run the manual control script
$ python manual_control.py
```
````

### Listing Available Scenarios

To see the full list of available scenarios, run the following command:

````markdown
```bash
$ python scenario_runner.py --list
```
````

This will display all predefined scenarios available in Scenario Runner.

### Conclusion

Scenario Runner adds significant flexibility to the CARLA simulator, allowing you to run complex scenarios. By following this guide, you should now be able to set up Scenario Runner and explore different scenarios. Stay tuned for more advanced usage and tips!

For additional documentation, visit the Scenario Runner Documentation.
