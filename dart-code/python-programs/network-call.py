import requests

response = requests.get("https://jsonplaceholder.typicode.com/todos/1")

#Check if the response is ok

if(response.status_code ==200):

    # First store the json object

    jsonObject = response.json()

#  jsonObject =    {
#   "userId": 1,
#   "id": 1,
#   "title": "delectus aut autem",
#   "completed": false
# 
    title = jsonObject['title']
    print(title)