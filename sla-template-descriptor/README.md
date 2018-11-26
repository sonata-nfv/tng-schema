# SLA Template Descriptor + Schema

A SLA Template Descriptor, refers to the core SLA Template document that incorporates metrics, as specific objectives or quality attributes,
parameters as well as expressions (i.e. rules) between parameters. The proposed YAML Schema , based on ISO/IEC DIS 19086-2, aims to specify the main 
“building blocks” of a SLA template and also present an expression (i.e. function) that allows a Service Provider to specify any metric included in a 
template (e.g. availability, response time, etc.)   

Therefore, the main SLA Templates building block of the reference model are the following:   
- **root block** with general descriptions  
- **sla_template** block with details regarding the SLA Template and its objectives   

# Sections of the SLA Template Descriptor
Following, we discuss the various sections of a policy descriptor. The general descriptor section contains some of the mandatory fields that have to 
be present in each and every sla template descriptor. 

## General Descriptor Section   
At the root block, we first have the mandatory fields, that describe and identify the sla template descriptor in a unique way.

* *schema* (optional) provides a link to the schema that is used to describe the sla template and can be used to validate the sla template descriptor file. This is related to the original JSON schema specification.
*  *name* is the name of the sla template.  
*  *vendor* is the vendor of the sla template.    
*  *version* is the version of the sla template.  

The general descriptor block also contains some optional components as outlined below.

*  *author* (optional) describes the author of the sla template descriptor.
*  *description* (optional) provides an arbitrary description of the sla template.
 
 
## SLA Template Section
An SLA template descriptor has to include an sla_template block. The following three fields are mandatory:      

*  *template_name* - is the name of the SLA Template.  
*  *offer_date* - is the creation date of the template.     
*  *expiration_date* - is the expiration date of the template.  
*  *provider_name* - the network operator that provides the specific template (e.g. Telefonica)
*  *template_initiator* - the initiator of the template (on behalf of the provider)


### NS Section
An SLA template descriptor has to include at least one ns block as child of sla_template block. The ns block include the following:

*  *ns_uuid* the uuid of the corresponding NS 
*  *ns_name* the name of the corresponding NS 
*  *ns_vendor* the vendor of the corresponding NS 
*  *ns_version* the version of the corresponding NS 
*  *ns_description* the description of the corresponding NS 

#### Guarantee Terms Section
An SLA template descriptor has to include an array of guarantee terms for the corresponding NS (as a child of the ns block). The guaranteeTerms array include the following:

*  *guaranteeID* the identifier of the guarantee term
*  *guarantee_name* the name of the guarantee term
*  *guarantee_definition* ta definition for the guarantee term
*  *guarantee_threshold* the value of the guarantee term
*  *guarantee_operator* the operator of the guarantee term expression
*  *guarantee_unit* the unit of the guarantee term
*  *guarantee_period
*  *target_slo* that is an object describing in detail the guarantee term (monitoring period, expression etc.)

#### Licensing Section
An SLA template descriptor include an object which define the type of license for the Network Service described in th template. The Licensing object include the following:

*  *service_licence_type* - the type of the license (Trial | Public | Private)
*  *service_licence_instances* - the allowed NS instances per user and per license 
*  *service_licence_period* - - The license period. 
*  *service_licence_expiration_date* - the license expiration date 



