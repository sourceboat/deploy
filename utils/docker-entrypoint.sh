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

# Add the known hosts from $SSH_KNOWN_HOSTS variable to the current environemnt`s known hosts.
# This is to prevent StrictHostKeyChecking=no
if [ -z "$SSH_KNOWN_HOSTS"]; then
    echo 'No $SSH_KNOWN_HOSTS was set.'
else 
    echo 'Adding $SSH_KNOWN_HOSTS to ssh-agent...'
    echo "$SSH_KNOWN_HOSTS" >> ~/.ssh/known_hosts
    chmod 644 ~/.ssh/known_hosts
fi

exec "$@"
