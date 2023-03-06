#!/bin/sh
set -e

echo Installing Copilot CLI...
npm install -g @githubnext/github-copilot-cli

echo Setting up bash aliases...
github-copilot-cli alias -- /bin/bash >> $_REMOTE_USER_HOME/.bashrc

echo Done!
