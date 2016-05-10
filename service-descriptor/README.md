# son-schema::network service descriptor
According to ETSI VNF [1], a Network Service Descriptor (NSD) is a deployment template for a Network Service referencing all other descriptors which describe components that are part of that Network Service

Our network service descriptor schema specifies the content of a NSD. It is based on the T-NOVA [2] flavor of the ETSI NSD that can be found at [3]. It is, however, adapted and extended to meet the SONATA specific needs.

The schema is written in YAML based on JSON Schema [4] which can be easily tranlated to JSON, e.g. by using a json-to-yaml translator [5].

## Sections of the Service Descriptor

Below we discuss the various section of a network service descriptor. The general descriptor section contains some of the manditory fields that have to be present in each and every service descriptor. All other sections might be optional.

#### General Descriptor Section

At the root level, we first have the mandatory fields, that describe and identify the virtual network service in a unique way.

- **descriptor_version** identifies the version of the service descriptor schema that is used to describe the network service.
- **$schema** (optional) provides a link to the schema that is used to describe the network service and can be used to validate the VNF descriptor file. This is related to the original JSON schema specification.

Moreover, the service signature, i.e the *vendor*, the *name*, and the *version*, is of great importance as it identifies the network service uniquely.

- **vendor** will identify the NS uniquely across all NS vendors. It should at least be comprised of the reverse domain name that is under your controll. Moreover, it might have as many sub-groups as needed. For example: eu.sonata-nfv.nec.
- **name** is the name of the NS without its version. It can be created with any name written in lower letters and no strange symbols.
- **version** names the version of the NS descritor. Any typical version with numbers and dots, such as 1.0, 1.1, and 1.0.1 is allows here. The NS version must be increased with any new (changed) instance of the network function descriptor. Please note: The whole network service is composed of the descriptor and other artifacts, like VNFs. Thus, the network service may change, even if the description remains constant, just because another artifact changes. This might or might not be reflected in the version of the package descriptor.

The general descriptor section also contains some optional components as outlined below.

- **author** (optional) describes the author of the network service descriptor.
- **description** (optional) provides an arbitrary description of the network service.

#### Network Functions Section

The network functions section contains all the information regarding the VNFs that constitute the virtual network functions. The section is mandatory and starts with:

- **network_functions** contains all the VNFs that are handled by the network service.

This section has to have at least one item with the following information:

- **vnf_id** represents a unique identifer within the scope of the NSD. 
- **vnf_vendor**
- **vnf_name**
- **vnf_version**
- **description** (optional)


#### Connection Points Section

- **connection_points** (optional) The connection points of the overall NS, that connects the NS to the external world.

While the parent section is optional, once it is specified it has to have at least one item with the following information:

- **id** An NSD-unique id of a connection point which can be used for references.
- **type** The type of connection point, such as a virtual port, a virtual NIC address, a physical port, a physcial NIC address, or the endpoint of a VPN tunnel.
- **virtual_link_reference** (optional) (deprecated) A reference to a virtual link, i.e. the virtual_links:id.


#### Virtual Links Section

- **virtual_links** (optional) A NS internal virtual link interconnects at least two connection points.

While the parent section is optional, once it is specified it has to have at least some of the following information:

- **id** An NS-unique id of the virtual link which can be used for references.
- **connectivity_type** The connectivity type, such as point-to-point, point-to-multipoint, and multipoint-to-multipoint.
- **connection_points_reference** The references to the connection points connected to this virtual link.


#### Forwarding Graph Section

- **forwarding_graph**

- **id**
- **number_of_endpoints**
- **number_of_virtual_links**
- **constituent_virtual_links**
- **constituent_vnfs**
- **network_forwaring_paths**


#### VNF Lifecycle Events Section

- **lifecycle_events** (optional) An array that contains VNF workflows for specific lifecycle events such as *start*, *stop*, *Scale_out*, *update*, etc.

While the parent section is optional, once it is specified it has to have at least some of the following information:

- **start**
- **stop**
- **scale_out**


#### Auto-Scale Policy Section

- **auto_scale_policy** (optional)

While the parent section is optional, once it is specified it has to have at least some of the following information:

- **criteria**
- **action**


#### Monitoring Parameters Section

- **monitoring_parameters** (optional) The parameters used for monitoring.

While the parent section is optional, once it is specified it has to have at least some of the following information:

- **description**
- **metric**
- **unit**


---
#### References
[1] [ETSI Network Functions Virtualization (NFV) - Management and Orchestration](https://www.etsi.org/deliver/etsi_gs/NFV-MAN/001_099/001/01.01.01_60/gs_NFV-MAN001v010101p.pdf)
[2] [T-NOVA FP7 European Project](http://www.t-nova.eu/)
[3] [TeNOR NSD Schema](https://github.com/T-NOVA/TeNOR/blob/master/nsd-validator/assets/schemas/nsd_schema.json)
[4] [JSON Schema](http://json-schema.org/)
[5] [YAML-to-JSON Translatore](http://jsontoyaml.com/)
