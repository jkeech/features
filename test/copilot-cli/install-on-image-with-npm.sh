#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'copilot-cli' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "copilot-cli": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test
#               --features copilot-cli    \ 
#               --skip-autogenerated   \
#               .

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

check "github-copilot-cli is installed" github-copilot-cli --version

check "?? alias is generated" bash -ic "?? --help"
check "git? alias is generated" bash -ic "git? --help"
check "gh? alias is generated" bash -ic "gh? --help"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults