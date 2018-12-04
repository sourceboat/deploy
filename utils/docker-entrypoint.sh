#!/bin/bash

# Run ssh-agent in current environment.
eval $(ssh-agent -s)

# Add the SSH key stored in SSH_PRIVATE_KEY variable to the agent store.
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
