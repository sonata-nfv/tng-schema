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

*  *version* is the version of the sla template.  

The general descriptor block also contains some optional components as outlined below.

*  *author* (optional) describes the author of the sla template descriptor.

*  *description* (optional) provides an arbitrary description of the sla template.
 
 
## SLA Template Section
An SLA template descriptor has to include an sla_template block. The following two fields are mandatory:      

*  *offered_date* is the creation date of the template.     

*  *valid_until* is the expiration date of the template.  


## NS Section
An SLA template descriptor has to include at least one ns block as child of sla_template block. The following two fields are mandatory:   

*  *objectives* that describes the High Level Service Level Objective (SLO) (e.g. NS availability). The ns block contains at least one objective.   
    - *metrics* that corresponds to how to measure the objective. Each objective contains at least one metric.  
        - *rate* that describes the specific time window.     
        - *expression* that describes a function under which the specific metric of the SLA should obey. Each metric contains only one expression.   
            - *parameters* "links" the metric with a set of parameters that need to be accompanied with the metrics and included into the expression 
			(expressing in detail each metric). An expression contains at least one parameter.   

