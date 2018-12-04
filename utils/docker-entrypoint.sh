#!/bin/bash
set -e

# Run ssh-agent in current environment.
eval $(ssh-agent -s)

# Add the SSH key stored in SSH_PRIVATE_KEY variable to the agent store.
if [ -z "$SSH_PRIVATE_KEY" ]; then
    echo 'No $SSH_PRIVATE_KEY was set.'
else
    echo 'Adding $SSH_PRIVATE_KEY to ssh-agent...'
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
fi  

exec "$@"
