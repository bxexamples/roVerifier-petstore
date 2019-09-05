# SCOPE AND PURPOSE

This directory contains programs and data files that can be used
for regression testing/validation of the Web Services.

# SCRIPT SEEDs

The scripts mentioned below are based on simple wrappers over layered seeds.
As a result the scripts inherit capabilities from several seed origins.
These seed origins include:

## Interactive Command Modules (ICM) Seeds

Scripts mentioned below are ICMs (Interactive Command Modules) 
that import commands from the unisos.icm module.

unisos.icm permits cmnd() methods of icm.Cmnd class to be exposed at 
command line with "-i" switch and include the following features.

### Frequently Invoked Menu Example

Running the ICM with no options, params, cmnds or args or using the 
--example option produces frequently invoked menu examples.

The examples menu is often tailored to desired usage patterns.
This is the best way of getting started.


### Usage --help

Running the ICM with --help provides the usual getopt usage information.

### Logging

With -v 30 -- default -- ICM results go to stdout.

With -v 20, ICMs also report Swagger specified inputs and output
with -v 15, ICMs also report http traffic as seen by requests
with -v 1, ICMs also report digestion of the swagger file

### Debugging

You can enable run time tracing of key callables 
(those decorated with @icm.subjectToTracking) by including:

 -v 1 --callTrackings monitor+ --callTrackings invoke+ 
 
 
### Loading Of Additional Python Code

Additional code can be added to an ICM at run time with the 

--load additionalCode.py

### ICMs command-line syntax

All ICMs follow the  command-line invocation syntax specified below

``` bash
icmName --optionNameN --parmNameN=paramValueN -i cmndName arg1 argn

```

### ICM Player Invocations -- GUI ICM-Players

In addition to the command-line invokation model, ICMs can also be invoked 
through GUI interfaces called ICM-Players. See PLPC-180050 for details.


## rinvoker Seeds (Remote Invoker)

Some of the scripts mentioned below are derived from 
rinvoker-seeds.

rinvoker-seeds are part of: Machine-to-Machine Web Services
Interactive Command Modules (ICM) Seeds -- which are pcakged at:

https://pypi.org/project/unisos.mmwsIcm/

these are included as:

``` python
from unisos.mmwsIcm import wsInvokerIcm
from unisos.mmwsIcm import ro
```

rinvoker seeds provide the following parameters and commands:

### Parameter:  --svcSpec= (url, or swagger-file) 

The swagger file as a url or as a json/yaml file is specified with the 
--svcSpec= parameter.

### Parameter:  --perfSap= (url)

The Performer Service Access Point Address (perfSap)  is specified as a URL
with the --perfSap= parameter.

### Parameter:  --header= (file)

Additional headers (e.g., a token) can be included with the --svcSpec= parameter.

### Parameter:  --resource= (string, corresponding to SvcSpec)

The resource to be invoked should be specified with the 
--resource= parameter

### Parameter:  --opName= (string, corresponding to SvcSpec)

The operation name to be invoked should be specified with the 
--opName= parameter

### Argument: name=value  (string=string corresponding to SvcSpec's URL Params)

### Argument: bodyStr=jsonStr  (bodyStr=string corresponding to SvcSpec's Body)

### Cmnd: -i svcOpsList

svcOpsList command digests the Service Specification (swagger-file)
specified on command line as --svcSpec= parameter and produces a
complete list of **ALL** remotely invokable commands with their corresponding
--resource, --opName and url or body arguments.

Applicable options, parameters and arguments are:

  * Parameter (Mandatory) : --svcSpec=
  * Parameter (Optional)  : --perfSap=
  * Parameter (Optional)  : --headers=

## opScn-Seed (Remote Operation Scenarios)

Some of the scripts mentioned below are derived from 
opScn-seeds.

rinvoker-seeds are part of: Machine-to-Machine Web Services
Interactive Command Modules (ICM) Seeds -- which are pcakged at:
https://pypi.org/project/unisos.mmwsIcm/


opScn-seed provides the following parameters and commands:

### Parameter:  --load= (file, python remote operation specification code and data)

The --load= parameter can be repeated to aggregate loading of multiple scenario files.

### Cmnd: -i roListInv

roListInv command serially invokes the list of ro.Ro_Op() operations 
specified in the loaded scenario files.

roListInv displays the invokation and its results. But does not do any verifications.

Applicable options, parameters and arguments are:

  * Parameter (Mandatory) : --load=

### Cmnd: -i roListExpectations

roListExpectations command serially invokes the list of ro.Ro_OpExpectation()
specified in the loaded scenario files.

roListExpectations displays the invokation and its results and
additionally runs the list of preInvokeCallables and
postInvokeCallables. 

postInvokeCallables can include functions that verify the results of the invocation 
were as expected.

Applicable options, parameters and arguments are:

  * Parameter (Mandatory) : --load=


# SCRIPTs


## ./petstoreRinvoker.py

Provides for command line execution of every operation specified in the 
swagger file.

## ./petstoreOpScn.py

Provides for invokation and validation of Operation Scenarios (opScn)
which are passed to the ICM with the --load option.

Available OpScns are described below in the "Data Files" section.

The output format is:

 * ->:: Invoke Request
 * <-:: Invoke Response
 * ==:: Invoke Validation (SUCCESS or FAILURE) 
 
Additional information for each is include with "**" tags.

This output format can then be used in outline or org-mode.

# DATA FILES

## ./opScnCommon.py

Specifies common parameters and capabilities.

All opScn-s in this directory import opScnCommon.py

## ./opScn-210-adds.py

Includes operations that add data to the Web Service.

## ./opScn-220-gets.py

Includes operations that verify correctness of data in Web Service.

## ./opScn-230-errMsgs.py

Includes operations related to resource="ErrorMessages".

## More opScns

The above is just a starting point, in due course we intend to 
verify each and every operation provided by Web Services.

# RESULT EXAMPLE FILES

A couple of output files are included:

## ./resultExample-v30.out

petstoreOpScnWeb.py  --load opScn-210-adds.py --load opScn-220-gets.py --load opScn-230-errMsgs.py -i roListExpectations > ./resultExample-v30.out

## ./resultExample-v15.out

petstoreOpScnWeb.py -v 15 --load opScn-210-adds.py --load opScn-220-gets.py --load opScn-230-errMsgs.py -i roListExpectations > ./resultExample-v15.out 2>&1


# AUTHOR

Mohsen BANAN

Last Edited: [2019-08-12 Mon 18:42]
