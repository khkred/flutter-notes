import re
import requests
import ast

response = requests.get('https://webhook.site/f458a3bd-86f5-4a46-b48b-a523d6faeecf?')


information = response.text

responseJson = ast.literal_eval(information)

print(type(responseJson))