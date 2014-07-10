import sys
import requests, json

if __name__ == '__main__':

    user_name = sys.argv[1]

#    url = 'https://api.github.com/users/%s/repos?per_page=10000' % user_name
#    r = requests.get(url)
#    content = r.json()

    json_file = "repos.json"
    
    for item in json.load(open(json_file)):
        print("%s" % item['name'])
