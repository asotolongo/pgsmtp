
CREATE OR REPLACE FUNCTION pgsmtp.pg_http_post(
    host text,
    port int,
    path text,  -- Путь к эндпоинту на сервере
    data json
) RETURNS text AS $BODY$
import urllib.request
import json

try:
    url = f'http://{host}:{port}{path}'  -- Формируем полный URL
    req = urllib.request.Request(url, data=json.dumps(data).encode('utf-8'), headers={'Content-Type': 'application/json'})
    with urllib.request.urlopen(req) as response:
        return response.read().decode('utf-8')

except Exception as e:
    return f'Error sending POST request: {str(e)}'
$BODY$ LANGUAGE plpython3u VOLATILE;
