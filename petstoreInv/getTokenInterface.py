#
# -*- coding: utf-8 -*-
"""\
*    *[Summary]* ::  Module that works with ./getTokenWithCryptKeyring.py
"""

import sys

import collections



from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import binascii
import base64

import json
import keyring
import getpass

import os
import errno


import os
import sys
import subprocess
import traceback
import time
import string
import random
import requests
import uuid
import datetime
import pprint
import json


def tokenServerUrl():
    token_url = 'https://petstore.swagger.io/oauth/authorize'
    return token_url


def obtainAdditionalCertificates():
    localCert='./Exampel_Root_CA.PEM'
    isReadable = os.path.isfile(localCert)
    if isReadable:
        return localCert
    else:
        return False

def obtainToken(
    accessKey,
    secretKey,
):

    apiUrl = tokenServerUrl()

    verify=False  # Or localCert -- in due course
    
    #headers = {'Content-type': 'application/json'}
    headers = {'Origin': 'ro-verify', 'Content-type': 'application/x-www-form-urlencoded'}


    obtainTokenBody = {}
    obtainTokenBody['username'] =  accessKey
    obtainTokenBody['password'] = secretKey

    obtainTokenBody['grant_type'] = 'password'
    
    #response = requests.post(apiUrl, data=obtainTokenBody, headers=headers, verify=False)
    response = requests.post(apiUrl, data=obtainTokenBody, headers=headers, verify=obtainAdditionalCertificates())    

    if response.status_code == requests.codes.okay:
        return response.json()
    else:
        print("""API error. Status code = {code}, response = {response}"""
              .format(
                code=str(response.status_code), response=str(response.text)))
        return None

