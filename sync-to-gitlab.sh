#!/bin/bash

#Pull latest from GitHub
git pull origin main

# Push those changes to GitLab
git push gitlab main
