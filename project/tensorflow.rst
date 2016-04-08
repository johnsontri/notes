TensorFlow
===============================================================================

.. highlight:: shell

- General computing platform

:Tensor: The n-dimension data
:Flow: The operation

- written in CPP
- offer python interface via SWIG
- GPU support
    - Optional
    - Linux only
    - Cuda Toolkit >= 7.0


Installation
----------------------------------------------------------------------

- require ``gcc``

- clone with submodule::

    $ git clone --recurse-submodules https://github.com/tensorflow/tensorflow

- build system: `Bazel <http://bazel.io/>`_
- build python wheel package::

    bazel build -c opt //tensorflow/tools/pip_package:build_pip_package -j 6

- SWIG::

    pacman -S swig


Configuring GPU
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

::

    └─[iblis@pandapc Oops]% ./configure
    Please specify the location of python. [Default is /home/iblis/venv/py35/bin/python]:
    Do you wish to build TensorFlow with GPU support? [y/N] y
    GPU support will be enabled for TensorFlow
    Please specify which gcc nvcc should use as the host compiler. [Default is /sbin/gcc]:
    Please specify the Cuda SDK version you want to use, e.g. 7.0. [Leave empty to use system default]: 7.5.18
    Please specify the location where CUDA 7.5.18 toolkit is installed. Refer to README.md for more details. [Default is /usr/local/cuda]: /opt/cuda
    Please specify the Cudnn version you want to use. [Leave empty to use system default]: 5.0.4
    Please specify the location where cuDNN 5.0.4 library is installed. Refer to README.md for more details. [Default is /opt/cuda]:
    Please specify a list of comma-separated Cuda compute capabilities you want to build with.
    You can find the compute capability of your device at: https://developer.nvidia.com/cuda-gpus.
    Please note that each additional compute capability significantly increases your build time and binary size.
    [Default is: "3.5,5.2"]: 5.0
    Setting up Cuda include
    Setting up Cuda lib64
    Setting up Cuda bin
    Setting up Cuda nvvm
    Configuration finished
