#!/bin/bash
rm -fr cvs
rm -fr projects
rm -fr db

mkdir -p csv
mkdir -p projects
mkdir -p db

python create_schema.py
