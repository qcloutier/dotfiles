#!/usr/bin/env nix-shell
#! nix-shell -i python3
#! nix-shell -p python3 python3Packages.lz4

import json, lz4.block

data = {
    'version': 13,
    'engines': [
        {
            'id': 'google',
            '_metaData': {
                'hideOneOffButton': True
            }
        },
        {
            'id': 'ddg',
            '_metaData': {
                'hideOneOffButton': True
            }
        },
        {
            'id': 'bing',
            '_metaData': {
                'hideOneOffButton': True
            }
        },
        {
            'id': 'ebay-ca',
            '_metaData': {
                'hideOneOffButton': True
            }
        },
        {
            'id': 'wikipedia',
            '_metaData': {
                'hideOneOffButton': True
            }
        }
    ],
    'metaData': {
        'defaultEngineId': 'ddg',
        'defaultEngineIdHash': '@hash@'
    }
}

with open('search.json.mozlz4', 'wb') as file:
    file.write(
        b'mozLz40\0' + lz4.block.compress(
            json.dumps(data, separators=(',', ':')).encode()
        )
    )
