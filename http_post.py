import urllib.request
import json

 
def x(host):
    try:
        url = host
        req = urllib.request.Request(url, 
                                     data=json.dumps({'key': 'some_values'}).encode('utf-8'), 
                                     headers={'Content-Type': 'application/json'})
        response = urllib.request.urlopen(req)
        return response.read().decode('utf-8')

    except Exception as e:
        return f'Error sending POST request: {str(e)}'
