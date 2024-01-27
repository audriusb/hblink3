BRIDGES = {
    'HBLink-EchoTest-TG9999': [
            {'SYSTEM': 'ECHOTEST',            'TS': 1, 'TGID': 9999,     'ACTIVE': True,  'TIMEOUT': 0,  'TO_TYPE':'NONE', 'ON': [9999],       'OFF': [],      'RESET': []},
            {'SYSTEM': 'MASTER-1',            'TS': 1, 'TGID': 9999,     'ACTIVE': True,  'TIMEOUT': 0,  'TO_TYPE':'NONE', 'ON': [],       'OFF': [],      'RESET': []},
        ]
}

if __name__ == '__main__':
    from pprint import pprint
    pprint(BRIDGES)
