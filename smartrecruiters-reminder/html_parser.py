#!/usr/bin/python3

# Import the libraries
from bs4 import BeautifulSoup
import requests

url="https://careers.smartrecruiters.com/CERN/quest-software-engineering-%26-it"

# Make a GET request to fetch the raw HTML content
html_content = requests.get(url).text

# Parse the html content
soup = BeautifulSoup(html_content, "html.parser")

# li - opening-job job
li_list = soup.find_all("li", class_="opening-job job")

# List to store positions
string_list=list()

# Loop through the li elements
for li in li_list:
    innerSoup = BeautifulSoup(str(li), "html.parser")
    string_list.append(str(innerSoup.find("h4").string))

# Sort list of string
string_list.sort()

# Print string list elements
for string in string_list:
    print("- " + string)
