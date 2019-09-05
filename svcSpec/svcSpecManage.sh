#!/bin/bash

IcmBriefDescription="
* Obtains Swagger/OpenAPI Specifications"

####+BEGIN: bx:bash:origin-statement :control "release"
ORIGIN="
* Part Of ByStar -- Best Used With Emacs, Blee and COMEEGA."
####+END:

####+BEGIN: bx:bash:top-of-file :control "release"
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

####+BEGIN: bx:bash:author :control "release" :author "mohsenBanan"
__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact"
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedElisp.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedElisp.sh]] | 
"
FILE="
*  /This File/ :: /de/tmo/gits/masters/others/flow-doc-swagger/flow-documentation/swagger/elispFilterHtml.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedElisp.sh -l $0 "$@" 
    exit $?
fi
####+END:

####+BEGIN: bx:dblock:global:file-insert :surround "default" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
_CommentBegin_
* /->/ ([[file:/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org][dblock-inFile]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
* /<-/ [[file:/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org][dblock-inFile]])
_CommentEnd_
####+END:

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# Import Libraries

. ${opLibBase}/pidLib.sh
# # /opt/public/osmt/lib/portLib.sh
. ${opLibBase}/portLib.sh


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Params    ::  Global Parameters    [[elisp:(org-cycle)][| ]]
_CommentEnd_


typeset -t svcSpecUrl=""

svcName="petstore"
svcVersion="v2"

#svcSpeDefaultUrl="http://petstore.swagger.io/v2/swagger.json"
svcSpecDefaultUrl="https://petstore.swagger.io/v2/swagger.json"
svcSwaggerUiUrl="https://petstore.swagger.io"

svcFullName="${svcName}-${svcVersion}"

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Swagger Files -- Service Specification -- Service API Management" )
$( examplesSeperatorSection "Editable Command Line -- Service Spec Obtain -- (Any)" )
echo ${G_myName} ${extraInfo} -p svcSpecUrl="http://localhost:8080/swagger.json" -i svcSpecObtain svcSpecName.json
$( examplesSeperatorSection "Obtain And Update Service Specification -- ${svcName}-${svcVersion}" )
${G_myName} ${extraInfo} -p svcSpecUrl="${svcSpecDefaultUrl}" -i svcSpecObtain ${svcFullName}
${G_myName} ${extraInfo} -i svcSpecUpdate ${svcFullName}
${G_myName} ${extraInfo} -p svcSpecUrl="${svcSpecDefaultUrl}" -i svcSpecObtainUpdate ${svcFullName}
$( examplesSeperatorSection "Validate Service Specification -- ${svcName}-${svcVersion}" )
swagger-cli validate ${svcName}-${svcVersion}-obtained.json
$( examplesSeperatorSection "Visit Swagger UI -- ${svcName}-${svcVersion}" )
bx-firefox ${svcSwaggerUiUrl}
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  noArgsHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function noArgsHook {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_svcSpecObtain    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_svcSpecObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local svcName="$1"

    local outputFile="${svcName}-obtained.json"

    lpDo wget --no-check-certificate --output-document=${outputFile} ${svcSpecUrl}        

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_svcSpecUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_svcSpecUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local svcName="$1"
    local outputFile="${svcName}-obtained.json"
    local outputFileYaml="${svcName}-obtained.yaml"    
    local outputFileFormatted="${svcName}-formatted.json"
    local outputFileDerefed="${svcName}-deref.json"    

    if [ ! -f "${outputFile}" ] ; then
	EH_problem "Missing obtained file = ${outputFile}"
	EH_problem "First Run: ${G_myName} -i someSvcSpecObtain"
	lpReturn
    fi

    lpDo eval json2yaml "${outputFile}" \> "${outputFileYaml}"

    # Use swager-cli instead of jq perhaps.
    lpDo eval cat  "${outputFile}" \| jq . \> "${outputFileFormatted}"

    lpDo swagger-cli bundle -dereference --outfile "${outputFileDerefed}" "${outputFile}"

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_svcSpecObtainUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_svcSpecObtainUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    lpDo vis_svcSpecObtain $@

    lpDo vis_svcSpecUpdate $@    
    

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] For When Script Supports Multiple Svcs  :: /* Some Other Service Specification */ |
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_someSvcSpecObtain    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_someSvcSpecObtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local svcName="$1"

    local outputFile="${svcName}-obtained.json"

    lpDo wget --header "X-OPEN-TOKEN: hack" --output-document=${outputFile} ${svcSpecUrl}    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_someSvcSpecObtainUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_someSvcSpecObtainUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    lpDo vis_someSvcSpecObtain $@

    lpDo vis_svcSpecUpdate $@    
    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_someSvcSpecFullUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_someSvcSpecFullUpdate {

Obtain {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo ${G_myName} ${extraInfo} -p svcSpecUrl="http://localhost:80/swagger.json" -i someSvcSpecObtainUpdate ${svcName_petstore}
 
    lpReturn
}



_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
