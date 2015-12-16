title: Lab 04 - Virtualization
---

## Lab 04 - Virtualization


#### Pedagogical objectives

* Use hardware virtualization and software containers

* Measure the impact of virtualization and containerization on
  performance


#### Overview

In this lab you will measure the overhead of virtual machines and
software containers. You will create a virtual machine ("guest") on
your local machine ("host") as well as a software container inside the
guest. Using a performance benchmarking tool you will compare the
performance of three environments:

* the host
* the virtual machine
* the software container.

The benchmarking tool (Geekbench) is platform-independent, it runs on
Linux, Windows and Mac OS X. If you are curious you can run it also on
your smartphone and compare the results.


### Task 1: Create virtual machine and software container

In this part you will install the base tools you need to perform the
different tasks of this lab.

1. Install on your local machine Vagrant to create a virtual
   environment. We provide scripts for installing and running Docker
   inside this virtual environment.

    * [Vagrant](https://www.vagrantup.com/)

2. Clone the following repository to your machine:
   <https://github.com/SoftEng-HEIGVD/Teaching-HEIGVD-AIT-2015-Labo-04>

3. Once you have installed everything, start the Vagrant VM from the
   project folder with the following command:

   ```bash
   $ vagrant up
   ```

   This will download an Ubuntu Linux image and initialize a Vagrant
   virtual machine with it. Vagrant then runs a provisioning script
   inside the VM that installs Docker and creates a Docker container.

   The provisioning of the VM and the container will take several
   minutes. There will be occasional error messages from
   `dpkg-preconfigure`, `debconf` or `invoke-rc.d`. You can safely
   ignore them.

4. Install the Geekbench benchmarking tool. Go to the
   [Geekbench website](http://www.primatelabs.com/geekbench/) and
   download and install the version appropriate for your host.


### Task 2: Run benchmark in different environments

In this task you will run the benchmarking tool on different
environments.

1. Run the benchmark on the host in 32-bit mode. Make sure your
   machine is connected to power and no other programs are running.

   You should see output similar to this:

        Geekbench 3.3.2 Tryout : http://www.primatelabs.com/geekbench/

        Geekbench 3 is in tryout mode.
        [...]
        Running Gathering system information
        [...]
        Uploading results to the Geekbench Browser. This could take a minute or two 
        depending on the speed of your internet connection.
        [...]

   In the lab report provide

    * The URL of your benchmark results at <http://browser.primatelabs.com/>
    * The system information reported by the benchmark

2. Log into the Vagrant VM and run the benchmark, making sure that
   your machine is in the same condition as during the previous
   benchmark:

        cd dist/Geekbench-3.3.2-Linux
        ./geekbench

   In the lab report provide the same information as for the previous
   benchmark.

3. Now run the benchmark inside the container:

        docker run softengheigvd/geekbench

   In the lab report provide the same information as for the previous
   benchmarks.

4. Compare the results. Using a spreadsheet create a bar chart
   comparing the benchmark results of host, guest VM and
   container. Use the performance of the host as baseline and
   calculate the performance of guest VM and container as percentage
   of host performance.

   Compare the following scores:

    * Overall score (single-core and multi-core)
    * Integer performance score (single-core and multi-core)
    * Memory performance score (single-core and multi-core)


### Task 3: Compare storage footprints

In this task you will compare the storage footprints of virtual
machines and software containers.

1. Find out where the content of the virtual disk of the Vagrant
   virtual machine is stored on the host. Tip: use the VirtualBox
   GUI. What is the name of the file and how big is it? How big does
   the virtual disk appear to the guest? How do you explain the
   difference?

2. Consult the
   [Docker documentation about Local storage and AUFS](https://docs.docker.com/engine/userguide/storagedriver/aufs-driver/#local-storage-and-aufs)
   and examine the directory where the content of the virtual file
   system of the container is stored in the Vagrant virtual machine
   (`/var/lib/docker/aufs`). How much space is used? How big does the
   virtual file system appear to the container (tip: use `docker exec
   -ti <containerid> bash` to login to the running container). How do
   you explain?

### Lab deliverables

Write your lab report in Markdown (.md) or a word processor format
(ODF, Word), or PDF. Markdown is preferred.

Put the report into the shared folder at
**\\\eistore1.einet.ad.eivd.ch\cours\tic\MGF\AIT\Rendus**.  Organize
your submissions in folders like so:

* folder `albert.einstein` (your user id)
    * folder `lab04`
        * file `report.txt`


#### Lab due date

Deliver your results at the latest 15 minutes before class Tuesday,
January 12, 2016.

