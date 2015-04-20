#!/bin/bash
service dovecot start
tail -f /var/log/dovecot/main.log