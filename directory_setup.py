import os
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-n", "--name", help="Project name")
parser.add_argument("-w", "--work", action="store_true", help="Uses the Work directory")
args = parser.parse_args()

home_directory = os.environ['HOME']

def change_directory(args):
    base_directory = os.environ['PROJECTS_DIRECTORY']

    if args.work is True:
        base_directory = os.environ['WORK_DIRECTORY']

    os.chdir(base_directory)

    return base_directory

def create_directory():
    # cd to directory accordingly
    directory = change_directory(args)
    print(directory)
    print(args)

    # create the project directory
    print('Checking if directory exist...')

    try:
        os.mkdir(f'./{args.name}')
    except FileExistsError:
        print('Directory already exist')
        sys.exit(1)

    print('Creating directory...')

    os.chdir(f'{directory}/{args.name}')
    print(f'Successfully Created directory {args.name}')

    # create readme file
    print("Making README.md file...")
    with open('README.md', 'w') as file:
        file.write(f'# Project {args.name}')

    print("Successfull created")

create_directory()
