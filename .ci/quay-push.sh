#!/bin/bash
#!/usr/bin/env bash

# quay-push.sh: Push (Upload) image to quay.
# Image must be tagged already.

# Pulp is an organization (not an individual user account) on Quay:
# https://quay.io/organization/pulp
# For test publishes, one can override this to any org or user.
QUAY_PROJECT_NAME=${QUAY_USER_OR_ORG_NAME:-pulp}
# The image name, AKA the Quay repo
QUAY_REPO_NAME=${QUAY_USER_OR_ORG_NAME:-pulp-fixtures}
# The image tag
IMAGE_TAG=${QUAY_USER_OR_ORG_NAME:-latest}

# Reference: https://adriankoshka.github.io/blog/posts/travis-and-quay/
echo "$QUAY_BOT_PASSWORD" | docker login -u "$QUAY_BOT_USERNAME" --password-stdin quay.io
docker tag pulp/pulp-fixtures "quay.io/$QUAY_PROJECT_NAME/$QUAY_REPO_NAME:$IMAGE_TAG"
docker push "quay.io/$QUAY_PROJECT_NAME/$QUAY_REPO_NAME:$IMAGE_TAG"
