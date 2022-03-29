import requests
import ast

response = requests.get("https://webhook.site/f458a3bd-86f5-4a46-b48b-a523d6faeecf")

student = response.json()
print(type(student))

# status1 = responseJson["statuses"]
# status2 = status1[0]

# user = status2["user"]

# userName = user["screen_name"]

# followers = user["followers_count"]

# print(userName)
# print(followers)