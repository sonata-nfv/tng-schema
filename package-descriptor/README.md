# Package Descritor Schema
The schema file for the package descriptor used by SONATA. It specifies the structure of the package descriptor. It makes sure the relevant information is provided to parse the package in a meaningful way.


### Example

```
---
---
descriptor_version: "1.0"

package_group: "eu.sonata.nfv"
package_name: "example-package"
package_version: "1.1"
package_maintainer: "Michael Bredel, NEC Labs Europe"
package_description: > 
  "My first package descriptor"

entry_service_template: "path/to/entry-service-description"
sealed: true

package_content:
 - name: "/path/to/descriptor"
   content-type: "application/sonata.service_descriptor"
   md5: "00236a2ae558018ed13b5222ef1bd9f3"
   sealed: false
 - name: "/path/to/descriptor"
   content-type: "application/sonata.service_descriptor"
   sealed: true
 - name: "/path/to/vm-image"
   content-type: "application/sonata.image"

package_resolvers:
  - name: "http://www.bredel-it.de/path/to/catalog"
    credentials: "my (optional) credentials"

package_dependencies:
 - name: "my-dependent-package"
   group: "eu.sonata.nfv"
   version: "1.0"
   credentials: "my (optional) credentials"

artifact_dependencies:
  - name: "my-vm-image"
    url: "http://www.bredel-it.de/path/to/vm-image"
    md5: "00236a2ae558018ed13b5222ef1bd9f3"
    credentials: "my (optional) credentials"
```
