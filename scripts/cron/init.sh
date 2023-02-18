#!/usr/bin/env bash

echo "0 0 * * * /dist/scripts/cron/cron_logrotate.sh" >> mycrontab
echo "0 1 * * * /dist/scripts/cron/cron_slowlog.sh" >> mycrontab
crontab mycrontab
rm mycrontab
