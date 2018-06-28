# Package Specification

5GTANGO's generic NFV package format is specified in the tng-schema wiki:

* [5GTANGO Package Specification (latest)](https://github.com/sonata-nfv/tng-schema/wiki/PkgSpec_LATEST)

These folder contains some example 5GTANGO SDK projects that can be used to generate 5GTANGO packages using the [`tng-sdk-package`]() tool. You find more information about 5GTANGO SDK's project format in the [`tng-sdk-project`]() repository and wiki.

## Packaging the example projects (generating `*.tgo` packages)

### Install `tng-sdk-package` tool

`tng-sdk-package` is written in Python (version >= 3.5) and can be installed using `pip`:

```bash
pip install git+https://github.com/sonata-nfv/tng-sdk-package
```

### Package the projects

```bash
# network service project
tng-pkg -p 5gtango-ns-project-example/
# VNF-only project
tng-pkg -p 5gtango-vnf-project-example/
# Test project (contains a test for the 5GTANGO V&v)
tng-pkg -p 5gtango-test-project-example/
```

###  Full examples

```bash
# network service project
tng-pkg -p 5gtango-ns-project-example/
2018-06-28 10:14:52 [INFO] [packager.py] Packager created: TangoPackager(7f509432-2044-4221-9305-3c89281b0897)
2018-06-28 10:14:52 [INFO] [packager.py] Creating 5GTANGO package using project: '5gtango-ns-project-example/'
2018-06-28 10:14:53 [INFO] [packager.py] Package created: 'eu.5gtango.ns-package-example.0.1.tgo'
2018-06-28 10:14:53 [INFO] [packager.py] Packager done (0.1570s): TangoPackager(7f509432-2044-4221-9305-3c89281b0897)
===============================================================================
P A C K A G I N G   R E P O R T
===============================================================================
Packaged:    5gtango-ns-project-example/
Project:     eu.5gtango.ns-package-example.0.1
Artifacts:   6
Output:      eu.5gtango.ns-package-example.0.1.tgo
Error:       None
Result:      Success.
===============================================================================


# VNF-only project
tng-pkg -p 5gtango-vnf-project-example/
2018-06-28 10:15:10 [INFO] [packager.py] Packager created: TangoPackager(e2b77a23-a7d7-40ca-ac03-7de38e90df46)
2018-06-28 10:15:10 [INFO] [packager.py] Creating 5GTANGO package using project: '5gtango-vnf-project-example/'
2018-06-28 10:15:10 [INFO] [packager.py] Package created: 'eu.5gtango.vnf-package-example.0.1.tgo'
2018-06-28 10:15:10 [INFO] [packager.py] Packager done (0.0781s): TangoPackager(e2b77a23-a7d7-40ca-ac03-7de38e90df46)
===============================================================================
P A C K A G I N G   R E P O R T
===============================================================================
Packaged:    5gtango-vnf-project-example/
Project:     eu.5gtango.vnf-package-example.0.1
Artifacts:   5
Output:      eu.5gtango.vnf-package-example.0.1.tgo
Error:       None
Result:      Success.
===============================================================================


# Test project (contains a test for the 5GTANGO V&v)
tng-pkg -p 5gtango-test-project-example/
2018-06-28 10:15:26 [INFO] [packager.py] Packager created: TangoPackager(6cda4596-8fec-4acb-8502-0425e7ebe2cb)
2018-06-28 10:15:26 [INFO] [packager.py] Creating 5GTANGO package using project: '5gtango-test-project-example/'
2018-06-28 10:15:26 [INFO] [packager.py] Package created: 'eu.5gtango.simple-ttcn3-test.0.1.tgo'
2018-06-28 10:15:26 [INFO] [packager.py] Packager done (0.4160s): TangoPackager(6cda4596-8fec-4acb-8502-0425e7ebe2cb)
===============================================================================
P A C K A G I N G   R E P O R T
===============================================================================
Packaged:    5gtango-test-project-example/
Project:     eu.5gtango.simple-ttcn3-test.0.1
Artifacts:   6
Output:      eu.5gtango.simple-ttcn3-test.0.1.tgo
Error:       None
Result:      Success.
===============================================================================

```

