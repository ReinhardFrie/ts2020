.. _citrixgoldimage:

------------------------------------
Building & Optimizing the Gold Image
------------------------------------

Introduction

**In this lab you will...**

Deploying a VM
++++++++++++++

If you completed the :ref:`move` lab, skip to `Installing the VDA`_. Otherwise, follow the steps below to provision a VM to begin building your gold image.

#. In **Prism Central**, select :fa:`bars` **> Virtual Infrastructure > VMs**.

   .. figure:: images/1.png

#. Click **Create VM**.

#. Select your assigned cluster and click **OK**.

#. Fill out the following fields:

   - **Name** - *Initials*\ -GoldImage
   - **Description** - (Optional) Description for your VM.
   - **vCPU(s)** - 2
   - **Number of Cores per vCPU** - 1
   - **Memory** - 4 GiB

   - Select **+ Add New Disk**
       - **Type** - DISK
       - **Operation** - Clone from Image Service
       - **Image** - Win10v1903.qcow2
       - Select **Add**

   - Select **Add New NIC**
       - **VLAN Name** - *User Assigned VLAN*
       - Select **Add**

#. Click **Save** to create the VM.

#. Select your Move VM and click **Power On**.

Installing the VDA
++++++++++++++++++

#. Open the VM console or connect via RDP.

#. Change the **Computer Name** (e.g. *Initials*\ -GoldImage) and join the **NTNXLAB.local** domain using the following credentials:

   - **User Name** - NTNXLAB\\Administrator
   - **Password** - nutanix/4u

   .. figure:: images/1b.png

   .. note::

      Open **Control Panel > System and Security > System > Change Settings** to access the traditional Windows domain join field in Windows 10.

#. Restart your VM and log in using the following credentials:

   - **User Name** - NTNXLAB\\Administrator
   - **Password** - nutanix/4u

#. In **Prism Central**, select your GoldImage VM and click **Actions > Update**.

   .. figure:: images/2.png

#. Under **Disks > CD-ROM**, select :fa:`pencil` and fill out the following fields:

   - **Operation** - Clone from Image Service
   - **Image** - Citrix_Virtual_Apps_and_Desktops_7_1912.iso

#. Click **Update > Save**.

#. Within the VM console, open **D:\\AutoSelect.exe** to launch the Citrix installer.

   .. figure:: images/3.png

#. Select **Virtual Apps and Desktops > Start**.

   .. figure:: images/4.png

#. Select **Prepare Machines and Images** to begin installation of the Virtual Desktop Agent.

   .. figure:: images/5.png

#. Select **Create a MCS master image** and click **Next**.

   .. figure:: images/6.png

#. Under **Core Components**, select **Citrix Workspace App** in addition to the default **Virtual Desktop Agent** selection. Click **Next**.

   .. figure:: images/6b.png

#. Under **Additional Components**, select **Citrix User Personalization Layer** in addition to the default selections, and click **Next**.

   .. figure:: images/7.png

#. Under **Delivery Controller**, select **Let Machine Creation Services do it automatically** from the drop down, and click **Next**..

   .. figure:: images/8.png

# Under **Features**, click **Next**.

   .. figure:: images/9.png

   <info about default optimizations>

#. Allow the installer to automatically configure required Windows Firewall port accessibility, click **Next**.

#. Click **Install** to begin the VDA installation. This process should take approximately 5 minutes.

#. When prompted, de-select **Collect diagnostic information** for Citrix Call Home and click **Next**.

   .. figure:: images/10.png

#. Click **Finish** and wait for the VM to restart.

Running Citrix Optimizer
++++++++++++++++++++++++

#. Within the VM console, download http://10.42.194.11/workshop_staging/CitrixOptimizer.zip and extract to a directory.

#. Right-click **CitrixOptimizer.exe** and select **Run as Administrator**.

   .. figure:: images/12.png

#. Select the recommended optimization template based on the Windows build being used for the gold image.

   .. figure:: images/13.png

#. Click **Select All** to select all available optimizations and click **Analyze**.

   .. figure:: images/14.png

#. Click **View Results** to see a detailed report of the status of each available optimization.

#. Return to the **Citrix Optimizer** and click **Done > Optimize** to apply the selected optimizations.

   .. figure:: images/15.png

#. Once the tool has completed, you can click **View Results** to view an updated report. You can now close the tool.

Running VMware OS Optimization Tool
+++++++++++++++++++++++++++++++++++

#. Within the VM console, download http://10.42.194.11/workshop_staging/VMwareOSOptimizationTool.zip and extract to a directory.

#. Right-click **VMwareOSOptimizationTool.exe** and select **Run as Administrator**.

#. Click the **Select All** checkbox, and click **Analyze**.

   .. figure:: images/16.png

#. Note the outstanding optimizations not applied in the **Analysis Summary** pane.

   .. figure:: images/17.png

#. Click **Optimize** to apply the remaining optimizations.

   .. figure:: 18.png

#. Review the results and then restart your Gold Image VM.
