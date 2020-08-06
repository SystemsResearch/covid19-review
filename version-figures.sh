#!/bin/bash
# Update the JSON statistics files to use the versioned figure URLs
# Run this script after all newly-generated figures have been committed

# Get the most recent commit SHA-1 hash, which is assumed to be the commit
# that updated the figures
export FIGURE_COMMIT_SHA=$(git rev-parse HEAD)
echo "Using figure versions from commit $FIGURE_COMMIT_SHA"

CSSE_STATS_JSON=csse/csse-stats.json
EBM_STATS_JSON=ebmdatalab/ebmdatalab-stats.json

echo "Updating $CSSE_STATS_JSON"
# See https://unix.stackexchange.com/questions/294378/replacing-only-specific-variables-with-envsubst
envsubst '${FIGURE_COMMIT_SHA}' < $CSSE_STATS_JSON > tmp.json && mv tmp.json $CSSE_STATS_JSON

echo "Updating $EBM_STATS_JSON"
envsubst '${FIGURE_COMMIT_SHA}' < $EBM_STATS_JSON > tmp.json && mv tmp.json $EBM_STATS_JSON