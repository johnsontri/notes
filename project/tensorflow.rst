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

- Pypi::

    pip install numpy wheel


Configuring GPU
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

::

    └─[iblis@pandapc Oops]% ./configure
    Please specify the location of python. [Default is /home/iblis/venv/py35/bin/python]:
    Do you wish to build TensorFlow with GPU support? [y/N] y
    GPU support will be enabled for TensorFlow
    Please specify which gcc nvcc should use as the host compiler. [Default is /sbin/gcc]: /usr/bin/gcc
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


Patches
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- cc_configure.bzl:
    For bazel bazel <= 0.2.1
    ::
        cd tensorflow/tensorflow
        wget https://github.com/bazelbuild/bazel/blob/master/tools/cpp/cc_configure.bzl


- WORKSPACE
.. code-block:: diff

    diff --git a/WORKSPACE b/WORKSPACE
    index d3e01b7..033685b 100644
    --- a/WORKSPACE
    +++ b/WORKSPACE
    @@ -20,6 +20,9 @@ tf_workspace()
    load("//tensorflow:tensorflow.bzl", "check_version")
    check_version("0.1.4")

    +# load("//tensorflow:cc_configure.bzl", "cc_configure")
    +# cc_configure()
    +
    # TENSORBOARD_BOWER_AUTOGENERATED_BELOW_THIS_LINE_DO_NOT_EDIT

    new_git_repository()

- third_party/gpus/crosstool/CROSSTOOL
.. code-block:: diff

    diff --git a/third_party/gpus/crosstool/CROSSTOOL b/third_party/gpus/crosstool/CROSSTOOL
    index a9f26f5..1bc2138 100644
    --- a/third_party/gpus/crosstool/CROSSTOOL
    +++ b/third_party/gpus/crosstool/CROSSTOOL
    @@ -57,6 +105,8 @@ toolchain {
    # used by gcc. That works because bazel currently doesn't track files at
    # absolute locations and has no remote execution, yet. However, this will need
    # to be fixed, maybe with auto-detection?
    +  cxx_builtin_include_directory: "/home/iblis/git/tensorflow/third_party/gpus/cuda/include"
    +  cxx_builtin_include_directory: "/opt/cuda/include"}


2D Conv
----------------------------------------------------------------------

input 的圖片是 128x128 然後 rgb 3 channel，所以 input tensor 是 128x128x3

若 filter 是 5x5 然後有 64 片 filter -> filter tensor 5x5x64

conv 出來的東西應該是 128x128x3x64 之類的。 just guessing
