import requests

response = requests.get("https://webhook.site/d7e903ba-79ab-485e-984a-ecbf7de15e98")

student = response.json() #Student is a json

# I want roll Number of Student

print(student["rollNumber"])