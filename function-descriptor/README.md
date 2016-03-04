# Virtual Network Function Descriptor + Schema 
According to ETSI VNF [1], a VNF Descriptor (VNFD) is a deployment template which describes a VNF in terms of deployment and operational behaviour requirements. The VNFD also contains connectivity, interface and KPIs requirements that can be used by NFV-MANO functional blocks to establish appropriate Virtual Links within the NFVI between VNFC instances, or between a VNF instance and the endpoint interface to other Network Functions.

Our function descriptor schema specifies the content of a VNFD. It is based on the T-NOVA [2] flavor of the ETSI VNFD that can be found at [3]. It is, however, adapted and extended to meet the SONATA specific needs.

The schema is written in YAML based on JSON Schema [4] which can be easily tranlated to JSON, e.g. by using a json-to-yaml translator [5].

## Sections of the Function Descriptor

Below we discuss the various section of a network function descriptor. The general descriptor section contains some of the manditory fields that have to be present in each and every function descriptor. All other sections might be optional.

#### General Descriptor Section

At the root level, we first have the mandatory fields, that describe and identify the virtual network function in a unique way.

- **descriptor_version** identifies the version of the function descriptor schema that is used to describe the network function.
- **$schema** (optional) provides a link to the schema that is used to describe the network function and can be used to validate the VNF descriptor file. This is related to the original JSON schema specification.

Moreover, the VNF signature, i.e the *vnf_group*, the *vnf_name*, and the *vnf_version*, is of great importance as it idtenfies the VNF uniquely.

- **vnf_group** will identify the VNF uniquely across all VNFs. It should at least be comprised of the reverse domain name that is under your controll. Moreover, it might have as many sub-groups as needed. For example: eu.sonata-nfv.nec.
- **vnf_name** is the name of the VNF without its version. It can be created with any name written in lower letters and no strange symbols.
- **vnf_version** names the version of the VNF descritor. Any typical version with numbers and dots, such as 1.0, 1.1, and 1.0.1 is allows here. The VNF version must be increased with any new (changed) instance of the network function descriptor. Please note: The whole network function is composed of the descriptor and other artifacts, like virtual machine images. Thus, the network function may change, even if the description remains constant, just because another artifact changes. This might or might not be reflected in the version of the package descriptor.

The general descriptor section also contains some optional components as outlined below.

- **vnf_author** (optional) describes the author of the network function descriptor.
- **vnf_description** (optional) provides an arbitrary description of the VNF.

#### Virtual Deployment Units Section

The virtual deployment unit section ...

- **virtual_deployment_units** contains all the virtual deployment units (VDUs) that are handled by the network function.

- **id**
- **resource_requirements**

- **vm_image** (optional)
- **vm_image_format** (optional)
- **vm_image_md5** (optional)
- **connection_points** (optional)
- **monitoring_parameters** (optional)
- **scale_in_out** (optional)

#### Connection Points Section

- **connection_points** (optional)

- **id**
- **type**
- **virtual_link_reference** (optional) (deprecated)

#### Virtual Links Section

- **virtual_links**

- **id**
- **connectivity_type**
- **connection_points_reference**
- **access** (optional)
- **external_access** (optional)
- **root_requirement** (optional)
- **leaf_requirement** (optional)
- **dhcp** (optional)
- **qos** (optional)


#### VNF Lifecycle Events Section

#### Deployment Flavours Section


---
#### References
[1] [ETSI Network Functions Virtualization (NFV) - Management and Orchestration](https://www.etsi.org/deliver/etsi_gs/NFV-MAN/001_099/001/01.01.01_60/gs_NFV-MAN001v010101p.pdf)
[2] [T-NOVA FP7 European Project](http://www.t-nova.eu/)
[3] [TeNOR VNFD Schema](https://github.com/T-NOVA/TeNOR/blob/master/vnfd-validator/assets/schemas/vnfd_schema.json)
[4] [JSON Schema](http://json-schema.org/)
[5] [YAML-to-JSON Translatore](http://jsontoyaml.com/)
