import os
import sys
import argparse
from github import Github

# Args setup
parser = argparse.ArgumentParser()
parser.add_argument("-n", "--name", help="Repo Name")
parser.add_argument("-p", "--private", action="store_true", help="Make repo private")
args = parser.parse_args()

username = os.environ['GIT_USERNAME']
password = os.environ['GIT_PASSWORD']


def create_repository(username, password):
    print("Creating github repo....")
    private = args.private
    user = Github(username, password).get_user()

    try:
        repo = user.create_repo(args.name, private=private)
    except:
        print(f"Something went wrong. Couldn't create Repo {args.name}")
        sys.exit(1)

    print(f"Successfully Created repo {repo.full_name}")


create_repository(username, password)
