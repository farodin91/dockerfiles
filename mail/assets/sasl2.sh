#!/bin/bash
service saslauthd start
tail -f /var/log/auth.log