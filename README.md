# fortunes
Custom fortune files (that don't exist elsewhere) if you want those, clone those.

```
Usage: make [DESTINATION=<fortune directory>] [usage | [[clean] [all | offensive | unoffensive] [install | uninstall]]]
Targets:
        usage:
                Show this message.
        clean:
                Clean up all locally generated files, mainly the various .dat
                files.
        all:
                Generate the .dat files for all configured fortunes, including
                offensive fortunes.
        offensive:
                Generate the .dat files for ONLY the (potentially) offensive
                fortunes.
        unoffensive:
                Generate the .dat files for ONLY the safe, unoffensive
                fortunes.
        install:
                Install all currently generated .dat files and their
                respective fortunes. Note: this requires some .dat files to
                have been generated by a previously specified generation
                target, one of [all | offensive | unoffensive].
        uninstall:
                Uninstall all currenlt install .dat files and their respective
                fortunes. Note: this may remove fortunes installed by others
                projects or packages if there are name collisions.
```
