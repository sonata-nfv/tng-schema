# son-schema::function descriptor
According to ETSI VNF [1], a VNF Descriptor (VNFD) is a deployment template which describes a VNF in terms of deployment and operational behaviour requirements. The VNFD also contains connectivity, interface and KPIs requirements that can be used by NFV-MANO functional blocks to establish appropriate Virtual Links within the NFVI between VNFC instances, or between a VNF instance and the endpoint interface to other Network Functions.

Our function descriptor schema specifies the content of a VNFD. It is based on the T-NOVA [2] flavor of the ETSI VNFD that can be found at [3]. It is, however, adapted and extended to meet the SONATA specific needs.

The schema is written in YAML based on JSON Schema [4] which can be easily tranlated to JSON, e.g. by using a json-to-yaml translator [5].

---
#### References
[1] [ETSI Network Functions Virtualization (NFV) - Management and Orchestration](https://www.etsi.org/deliver/etsi_gs/NFV-MAN/001_099/001/01.01.01_60/gs_NFV-MAN001v010101p.pdf)
[2] [T-NOVA FP7 European Project](http://www.t-nova.eu/)
[3] [TeNOR VNFD Schema](https://github.com/T-NOVA/TeNOR/blob/master/vnfd-validator/assets/schemas/vnfd_schema.json)
[4] [JSON Schema](http://json-schema.org/)
[5] [YAML-to-JSON Translatore](http://jsontoyaml.com/)
