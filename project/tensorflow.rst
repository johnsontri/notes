TensorFlow
===============================================================================

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

- clone with submodule::

    $ git clone --recurse-submodules https://github.com/tensorflow/tensorflow

- build system: `Bazel <http://bazel.io/>`_
- build python wheel package::

    bazel build -c opt //tensorflow/tools/pip_package:build_pip_package -j 6
