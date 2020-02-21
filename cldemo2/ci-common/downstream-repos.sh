#!/bin/bash

set -x

check_state(){
if [ "$?" != "0" ]; then
    echo "ERROR from last operation!"
    exit 1
fi
}

# usage: update submodule "project-id" "project-name"
update_submodule(){
    NEW_BRANCH_NAME=dev-cldemo-update-$CI_COMMIT_SHORT_SHA

    echo "Currently in directory: $(pwd)"

    #TODO: use API to dynamically find repos that are tagged or named for official support
    #Then perform same steps on each repo. For now just hard coding.
    CI_PROJECT_ID=$1
    DOWNSTREAM_PROJECT_NAME=$2
    echo "Creating Branch & Updating Submodule on: $DOWNSTREAM_PROJECT_NAME"

    #### Section to update the cldemo2 submodule and push to new branch
    git clone -b dev --recurse-submodules git@gitlab.com:cumulus-consulting/goldenturtle/$DOWNSTREAM_PROJECT_NAME
    cd $DOWNSTREAM_PROJECT_NAME

    # checkout new branch locally
    git checkout -b $NEW_BRANCH_NAME

    # pass in the user and email from this CI run
    git config user.email $GITLAB_USER_EMAIL
    git config user.name $GITLAB_USER_NAME

    # update submodule to recent, stage for commit and commit
    git submodule update --remote
    git add cldemo2
    git commit -m "cldemo2 update: $CI_COMMIT_MESSAGE" 

    # push changes and new branch to gitlab and start CI run
    git push origin $NEW_BRANCH_NAME

    #create a Merge Request on the project for the new branch
    BODY="{
        \"id\": ${CI_PROJECT_ID},
        \"source_branch\": \"${NEW_BRANCH_NAME}\",
        \"target_branch\": \"dev\",
        \"remove_source_branch\": false,
        \"title\": \"WIP: ${NEW_BRANCH_NAME}\"
    }";

    curl -X POST "https://gitlab.com/api/v4/projects/${CI_PROJECT_ID}/merge_requests" \
        --header "PRIVATE-TOKEN: ${PRIVATE_TOKEN}" \
        --header "Content-Type: application/json" \
        --data "${BODY}";

    echo "Opened a new merge request: WIP: ${NEW_BRANCH_NAME} for this update";
    cd ..
    echo "Done with $DOWNSTREAM_PROJECT_NAME"
}

echo "calling subroutine for dc_configs_vxlan_evpnl2only"
update_submodule "15489287" "dc_configs_vxlan_evpnl2only"

echo "calling subroutine for dc_configs_vxlan_evpncent"
update_submodule "15489348" "dc_configs_vxlan_evpncent"

echo "calling subroutine for dc_configs_vxlan_evpnsym"
update_submodule "15490096" "dc_configs_vxlan_evpnsym"

exit 0
