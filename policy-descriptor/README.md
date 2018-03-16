# Runtime Policy Descriptor + Schema 

A Network Service Runtime Policy Descriptor (RPD) is a deployment template attached optionally to a Network Service referencing a set of enforcement rules, upon which certain actions are taken in order to meet some objectives described by specific SLAs. Policies themselves are formulated as event-condition-actions tuples with the semantics of “on event(s), if condition(s), do action(s).” 

Our network service policy descriptor schema specifies the runtime policy to be enforced upon a NSD. It is based on concepts defined by state of the art policy models such as SUPA [1], DEN-ng Policy Model [2], XACML [3] and The Policy Continuum [4].
It is, however, adapted and extended to meet the 5GTango specific needs.

The schema is written in YAML based on JSON Schema [5] which can be easily tranlated to JSON, e.g. by using a json-to-yaml translator [6].

## Sections of the Runtime Policy Descriptor

Following, we discuss the various sections of a policy descriptor. The general descriptor section contains some of the mandatory fields that have to be present in each and every policy descriptor. All other sections might be optional.

#### General Descriptor Section

At the root level, we first have the mandatory fields, that describe and identify the policy in a unique way.

- **descriptor_schema** referenced to the corresponding schema of a descriptor (e.g., URL or local path)
- **$schema** (optional) provides a link to the schema that is used to describe the policy and can be used to validate the policy descriptor file. This is related to the original JSON schema specification.

Moreover, the policy signature, i.e the *name*, is of great importance as it identifies the policy uniquely.
- **name** is the name of the policy. It can be created with any name written in lower letters and no strange symbols.

The general descriptor section also contains some optional components as outlined below.

- **author** (optional) describes the author of the policy descriptor.
- **description** (optional) provides an arbitrary description of the policy.


#### policyRules Section

A policy has to include a list with at least one poliy rule.
For each one of the policy rules, the following three fields are mandatory:

- **name** is the unique name of the policy rule. It can be created with any name written in lower letters and no strange symbols.
- **conditions** is a set of expressions that bind with logical operators the conditions and thresholds that should be satisfied in order to trigger the actions list. It is detailed at the Conditions section.
- **actions** is a set of actions that can be enforced upon the satisfaction of the conditions section. It is detailed at the Actions section.

Each policy rule also contains some optional components as outlined below.

- **salience** (optional) Each rule has an integer priority attribute which defaults to zero and can be negative or positive. Salience is a form of priority where rules with higher priority values are given higher priority when ordered in the Activation queue of the inference engine.
- **inertia** (optional) indicates the period of time (minutes, hours, days) the policy rule stays inactive after being triggered. 
- **duration** (optional) and  **aggregation** (optional) indicate the specific time window and aggregation function (min,max,average). Sliding time windows allow the enablement of rules that will only match events occurring in the last X time units.

#### Conditions Section

The conditions section contains all the information regarding the events and thresholds that should be satisfied in order to trigger the actions list.The section is mandatory and starts with:

- **condition** represents the logical operator to join with the rule conditions presented by the following field "rules".
- **rules** can be a list of expressions as defined at expression seccion OR can have the form of a nested recursive **conditions** eg. contain a **condition** and **rules** fields. 

#### Expression Section

The expression section contains all the information regarding how a threshold can be matched to a specific event.The section is mandatory and contains the following fields:

- **id** the id of the event
- **field** the field as shown to the policy editor
- **type** the type of the event value. This can be string, double or integer.
- **operator** the operator of the threshold. This is defined at the operator enumeration and for the time being can be "equal","less" or "greater"
- **value** the value of the threshold. 

#### Actions Section

The actions section contains all the information regarding the actions that can be enforced upon the satisfaction of the conditions section.The section is mandatory and starts with:

- **actions** contains all the actions that can be enforced by the various orchestration 5GTango mechanisms.

This section has to have at least one item with the following information:

- **action_type** represents the type of the action.Action types come from a declared enumeration. For the time being, the following types are supported:  Infrastructure, Orchestration, LifecycleManagement, NetworkMechanism, AlterConfiguration, Profile & Log.
- **name** represents the name of the action. Action names are also an enumeration and depend on the action types. e.g. LifecycleManagement type can get the name of start, stop or restart.  
- **target** refers to the NS / VNF / VDU instace where the action is going to be enforced.

Each action also contains some optional components as outlined below.
- **stability_period** indicates the period of time (minutes, hours, days) this action should not be enforced again upon being triggered 
 

#### References
[1] [ Generic Policy Information Model for Simplified Use of Policy Abstractions (SUPA) draft-ietf-supa-generic-policy-info-model-03](https://tools.ietf.org/html/draft-ietf-supa-generic-policy-info-model-03)
[2][Policy-Based Context Integration & Ontologies in Autonomic Applications to Facilitate the Information Interoperability in NGN] (https://pdfs.semanticscholar.org/4cd5/fe204d1467800e84cf6fa5665546d1bb3e6d.pdf)
[3] [eXtensible Access Control Markup Language (XACML) ](http://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-os-en.html) 
[4] [The Policy Continuum – A Formal Model](http://www.tssg.org/files/archives/2007_MACE_SDavy_Jennings_final.pdf )
[5] [JSON Schema](http://json-schema.org/)
[6] [YAML-to-JSON Translatore](http://jsontoyaml.com/)
