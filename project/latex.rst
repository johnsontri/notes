LaTeX
===============================================================================

:math:`\LaTeX`

Command
----------------------------------------------------------------------

::

    \command[optional param]{param}

- command starts with ``\``

- whitespace is ignored after commands.

e.g:

.. math::

    \TeX and \LaTex.

- force whitespace after commands

.. math::

    \TeX and{} \LaTeX.

Comments
----------------------------------------------------------------------

::
    %

e.g.:

.. math::

    Hello % comment
    , World


File Structure
----------------------------------------------------------------------

::

    \documentclass{...}  % LaTeX2e doc required This
    \usepackage{...}     % setup
    \begin{document}

    content

    \end{document}
