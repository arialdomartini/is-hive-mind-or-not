import sys
import requests, json

if __name__ == '__main__':
    user_name = sys.argv[1]
    url = 'https://api.github.com/users/%s' % user_name
    r = requests.get(url)

    print(r.json()['email'])
