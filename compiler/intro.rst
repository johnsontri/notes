Introduction
===============================================================================

Parts of compiler:

- Front-end
    - generate IR (itermediate representation)
    - 通常複雜度低

- Mid-end

- Back-end
    - 通常複雜度高


Generate Object File
----------------------------------------------------------------------

``prog.c`` -> pre-proccessing -> ``prog.s``


Quote from ``clang(1)``:

    Stage Selection Options

        -E     Run the preprocessor stage.

        -fsyntax-only
            Run the preprocessor, parser and type checking stages.

        -S     Run the previous stages as well as LLVM generation and
            optimization stages and target-specific code generation,
            producing an assembly file.

        -c     Run all of the above, plus the assembler, generating a target
            ".o" object file.
