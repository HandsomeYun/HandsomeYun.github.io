---
layout: post
title: "Packaging pyHFO from GitHub into a macOS App"
date: 2024-01-11 16:00:00
description: "A step-by-step guide to packaging the pyHFO project from GitHub into a macOS app using py2app."
tags: pyHFO packaging macOS py2app tutorial
categories: packaging
featured: false
---

In this post, we will walk you through packaging the **pyHFO** project from GitHub into a macOS app using **py2app**. This guide assumes you have access to the pyHFO repository and outlines the steps from setting up the project environment to creating a distributable `.dmg` file for users.

### Step 1: Clone the pyHFO Repository

1. **Clone the pyHFO repository** from GitHub:

    ```bash
    git clone https://github.com/HandsomeYun/pyHFO.git
    cd pyHFO
    ```

### Step 2: Set Up a Virtual Environment

2. **Create and activate a virtual environment** with Python 3.7:

    ```bash
    conda create -n pyhfo python=3.7
    conda activate pyhfo
    ```

### Step 3: Modify `requirements.txt`

3. **Update the `requirements.txt` file** to the following versions to ensure compatibility with the pyHFO project:

    ```
    HFODetector==0.0.21
    matplotlib==3.7.1
    mne==1.4.2
    numpy==1.25.0
    p_tqdm==1.4.0
    pandas==2.0.3
    openpyxl==3.1.2
    PyQt5==5.15.10
    PyQt5_sip==12.13
    pyqtgraph==0.13.3
    scipy==1.11.1
    scikit-image==0.21.0
    torch==2.0.1
    torchvision==0.15.2
    tqdm==4.65.0
    ```

4. **Install the dependencies** listed in `requirements.txt`:

    ```bash
    pip install -r requirements.txt
    pip install wheel
    ```

### Step 4: Package pyHFO with py2app

5. **Run py2app to package the project**:

    ```bash
    python setup.py py2app
    ```

6. **Rename the app** to `pyHFO`:

    After the app is created in the `dist/` directory, rename it to `pyHFO.app` for consistency.

    ```bash
    mv dist/your_app_name.app dist/pyHFO.app
    ```

### Step 5: Copy Additional Resources

7. **Copy additional resources (e.g., model checkpoints)** to the app’s resources directory:

    ```bash
    cp -r /path/to/pyHFO/ckpt/ /path/to/pyHFO/dist/pyHFO.app/Contents/Resources/lib/python3.11/ckpt
    ```

### Step 6: Create a DMG Installer

8. **Create a disk image (.dmg) for easy distribution**:

    1. Create an empty folder.
    2. Drag both the **Applications folder alias** and **pyHFO.app** into the folder.
    3. Run the following command to create a compressed DMG file:

    ```bash
    hdiutil create -volname "pyHFO" -srcfolder /path/to/pyHFO/DownloadFolder -ov -format UDZO -size 1000m /path/to/pyHFO.dmg
    ```

### Step 7: Finalizing the App Installation on User Machines

9. **Important for macOS users**: After dragging the app to the Applications folder, run the following command to make macOS recognize the app as safe:

    ```bash
    sudo xattr -cr /Applications/pyHFO.app
    ```

This will remove quarantine attributes and allow the app to run without security warnings.

---

### Conclusion

With these steps, you've successfully packaged the **pyHFO** project from GitHub into a macOS app, created a distributable `.dmg` file, and ensured that users can install and run the app securely. This guide provides a robust process for converting Python projects into standalone macOS applications.
