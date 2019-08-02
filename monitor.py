import os
import requests
import json



path = 'E:\\backup-db-daily\\'

files = []

# r=root, d=directories, f = files

for r, d, f in os.walk(path):
	for file in f:
		if '.bak' in file:
			path_file = os.path.join(r, file).replace('_','-') # type: str
			print(path_file)
			files.append(path_file)


webhook_url = ""
requests.post(url=webhook_url, json={
	'text':'\n\n'.join(files)
})

