#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(pwd)/ssl/helphi.key -out $(pwd)/ssl/helphi.crt