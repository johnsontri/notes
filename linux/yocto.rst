Yocto
===============================================================================
.. code-highlight: shell

I got an intel edison board and ``yocto`` installed.

Connect to it via serial port::

    $ sudo screen /dev/ttyUSB0 115200


Install python35
----------------------------------------------------------------------

::

    $ wget <python source>
    $ tar xzvf <Python.tar.gz>
    $ cd <Python source dir>

    $ ./configure --prefix=/usr/local
    $ make -j 2  # There are two cpus on this SoC
    $ make test  # optional
    $ make install

Check your pip installed::

    $ pip3 -V
    pip 7.1.2 from /usr/local/lib/python3.5/site-packages (python 3.5)


Install GNU Screen
----------------------------------------------------------------------

::

    $ ./autogen.sh
    $ ./configure --prefix=/usr/local
    $ make -j 2
    $ make install


Run EC
----------------------------------------------------------------------

::

    $ cd /path/to/ec
    $ cd setup


Patch the ``startup.sh``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code-block:: diff

    --- startup.sh.orig
    +++ startup.sh
    @@ -17,7 +17,7 @@
    
     # wait for screen.
     while [ 1 ]; do
    -    ps aux | grep -v grep | grep SCREEN | grep easyconnect > /dev/null 2>&1
    +    ps | grep -v grep | grep SCREEN | grep easyconnect > /dev/null 2>&1
         if [ $? -eq 0 ]; then
             break
         fi
    @@ -28,12 +28,3 @@
     add_to_screen Exec. ec/ './main_na.py' >> $LOG  2>&1
     add_to_screen sim   ec/ './simulator.py' >> $LOG 2>&1
     add_to_screen CCM   ccm/ 'python3 main.py' >> $LOG 2>&1
    -
    -sleep 5
    -#firefox http://localhost:7788/connection > /dev/null 2> /dev/null &
    -/opt/google/chrome/google-chrome --app=http://localhost:7788/connection \
    -    > /dev/null 2>&1 &
    -
    -sleep 2
    -add_to_screen arrange ccm/arrangement/ './arrange_window.sh' >> $LOG 2>&1
    -


Prepare ``virtualenv``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

::

    $ cd /path/to/ec
    $ pyvenv-3.5 .venv
    $ source .venv/bin/activate


Patch the ``ec/requirements.txt``
**************************************************

.. code-block:: diff

    --- requirements.txt.orig
    +++ requirements.txt
    @@ -1,5 +1,3 @@
     flask
     sqlalchemy
    ---allow-external mysql-connector-python
    -mysql-connector-python
     sphinx

::

    $ pip install -r ec/requirements.txt


Run it!
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

::

	$ /path/to/ec/startup.sh

Then relax.
