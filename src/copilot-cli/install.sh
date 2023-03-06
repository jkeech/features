#!/bin/sh
set -e

echo Installing Copilot CLI...
npm install -g @githubnext/github-copilot-cli

echo Setting up bash aliases...
github-copilot-cli alias -- /bin/bash >> $_REMOTE_USER_HOME/.bashrc

echo Setting up auth...
echo -n $GITHUB_TOKEN > $_REMOTE_USER_HOME/.copilot-cli-access-token
COPILOT_TOKEN=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/copilot_internal/v2/token | jq -r .token)
echo -n $COPILOT_TOKEN > $_REMOTE_USER_HOME/.copilot-cli-copilot-token
echo Done!
