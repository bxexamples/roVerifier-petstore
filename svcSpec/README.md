# OVERVIEW

This directory (svcSpec) contains all the OpenApi (Swagger) files --
Service Definitions -- for all Web services.

Some services publish their service definitions (swagger files), in
such cases the service definition is OBTAINED from the service as json
files and then they are auto converted to yaml. In such cases the
obtained files should be considered read-only and should never be edited.

The authoritative and primary location of ALL web related service definitions is the
./svcSpec directory.
remote invocation (hence the name rinvoker) of operations for all related services.

Proper operation would require that there be only one place and one copy of
authorative service definitions (this directory).


# MANIFEST (Files And Directory Structure)

Many of the files in this directory are script generated and should be
considered as read-only.

The process of creating the service specific

## svcSpecManage.sh -- script

Running:

``` shell
svcSpecManage.sh
```

provides you a menu from which you can obtain the swagger.json file (-i xxSvcSpecObtain)
and then convert it to yaml with -i svcSpecUpdate

### Petstore Service API

Make sure that the service is reachable at http://petstore.swagger.io/v2/swagger.json

``` shell
svcSpecManage.sh -h -v -n showRun -p svcSpecUrl="http://petstore.swagger.io/v2/swagger.json" -i svcSpecObtain petstore-v2
svcSpecManage.sh -h -v -n showRun -i svcSpecUpdate petstore-v2
```

These in turn create:

  * petstoreSvc-v1-obtained.json
  * petstoreSvc-v1-obtained.yaml
  
  * petstoreSvc-v1-editor.yaml -- reflects verification of the yaml file with the swagger editor
  


# INTRODUCTION -- CONCEPTS

Swagger files specify collections of remote operations in the form of 
"Service Specifications" --svcSpec -- or "Service API" == svcApi.

# Creating Swagger (Open-Api) Service Specifications

There are three common ways of creating  Swagger Files

## Fully Human Generated 

Swagger files (Service Specifications) can be human generated/edited.

In that case,   https://editor.swagger.io/ can be used to edit the 
desired svcSpec.

When a human generated service specification, results into a performer service,
that performer service MUST publish its own service specification. This is usually done 
as https:.../swagger.json.

The original human generated service specification is usally postfixed as "-authored".

When machine generated, we will only two sets of swagger files, those
that are postfixed as "-authored" and those that are postfixed as
"-obtained".

Consumers of the service (invokers), should obtain the service
specification from the performer service and use the "-obtained"
service specifications -- not the "-authored" files.

## Machine Aggregated -- Human Native Language Annotated (java dropwizard)

For example through annotation in dropwizard (java) annotations or through
wsIcm (python). 

The annotation are typically done in segments. Then tools (dropwizard)
aggregate these.

In this case, a swagger code-generator is not used and the framework
(e.g. dropwizard) produced the environment.

When a Service Specification is machine generated/aggregated, it should *NEVER* be human edited.
Native Language Annotations should be edited instead.

When machine generated, we will only have swagger files that are postfixed as "-obtained".


## Machine Aggregated -- Human Swagger Annotated (wsIcm)

The actual swagger specification is included with the code in swagger
in pieces.  Each operation includes the relevant swagger file and the
callable that implements the operation.

The pieces are then machine aggregated to produce a complete swagger
file.  The swagger file is then used with the performer code generator
to produce service performers skeletons. The corresponding callable
that implement the operation are then added to the skeleton to produce 
complete performer services.


# Service Specifications Naming Conventions

A service specification file name has at least 4 components
and takes the form of:

   svcName-version-{authored|obtained}-perhapsOtherQualifications.{json|yaml}
   
1) svcName: is the name of the service -- it is unique within the subject domain.

2) version number: svcName's version number. often, v1, v2, etc.

3) Either authored or obtained -- as described above.

4) Optionally, other forms of qualification such as derferenced, etc.

5) Either json or yaml. These formats can be converted to one another.


## Converting Swagger.json Files To Swagger.yaml files

Use json2yaml to convert from json to yaml. 

You can also use the swagger editor to import an json file and get a yaml output.

You can use the swagger validator with a yaml input to get a json output.

# Validating Swagger Files 

Run the obtained swagger file through the editor
 https://editor.swagger.io/ 


After editing, verified the sagger document using tools such as:
  https://bigstickcarpet.com/swagger-parser/www/index.html

If there are problems with the references such as:
  $ref:  "#/definitions/SomeObj"

Use tools to dereference these.  Tools such as:

   https://bigstickcarpet.com/swagger-parser/www/index.html

In which case we will call the dereferenced one:
   xx-svcApi-deref.json
and the one with references as:
   xx-svcApi-ref.json

The service specification then needs to be subjected at a minimum to
the following processors:

  - Java Invoker Code Generator (./generate-webservice-java-client.sh)
  - Java Performer Code Generator (TBD)
  - Python+flask Performer Code Generator (TBD)
  - rinvoker (TBD)

Only after verifying that all of the above svcSpec processors are happy with the
svcApi, the Service Specification can be considered proper.

# Authors

Mohsen BANAN

Last edited:  [2019-08-12 Mon 18:29]
