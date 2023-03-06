#!/bin/sh
set -e

npm install -g @githubnext/github-copilot-cli
github-copilot-cli alias -- /bin/bash >> $_REMOTE_USER_HOME/.bashrc
