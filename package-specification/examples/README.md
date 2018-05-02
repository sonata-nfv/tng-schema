# Package Specification

5GTANGO's generic NFV package format is specified in the tng-schema wiki:

* [5GTANGO Package Specification (latest)](https://github.com/sonata-nfv/tng-schema/wiki/PkgSpec_LATEST)

These folder contains some example packages. Each sub-folder represents one (unzipped) example package. To generate packages from them, just zip them and append the file ending: `*.tgo`.

Automatically package all examples: `./pack.sh`

Manually create package file (*.tgo):

```bash
cd package-specification/examples/5gtango-ns-package-example/
zip -r ../5gtango-ns-package-example.tgo ./
```
