docker build -t my-proj:${USER:-unknown} -f Dockerfile \
        --build-arg USER_ID=$(id -u) \
        --build-arg GROUP_ID=$(id -g) \
        --build-arg USER_NAME=$USER .

docker run -d --rm -it \
        -v $PWD:/workspaces/project \
        -v $PWD/opt:/opt \
        -w /workspaces/project \
        --hostname vm-${HOSTNAME} \
        --network=host \
        --name my-proj-dx \
        my-proj:${USER} bash

docker exec -ti  my-proj-dx /bin/bash
