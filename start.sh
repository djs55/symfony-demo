#!/bin/sh

# Restore the execute permission if it has been lost over a file sync from Windows.
chmod +x /var/www/bin/console

exec /var/www/bin/console server:run 0.0.0.0:8080
