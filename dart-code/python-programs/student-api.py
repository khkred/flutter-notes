from logging import root
import requests
import json
import ast

response = requests.get("https://webhook.site/f458a3bd-86f5-4a46-b48b-a523d6faeecf")

# print(response.text) # we get the data in String format
responseText = response.text

# Convert response text to String
rootString = json.dumps(responseText)

# Convert String to formatted String
rootObject = json.loads(rootString)

finalObject = ast.literal_eval(rootObject)

studentList = finalObject['students']



secondStudent = studentList[1]

print(secondStudent['name'])


