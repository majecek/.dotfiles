#!/bin/bash
# Bash wrappers for docker run commands

export DOCKER_REPO_PREFIX=jess

#
# Helper Functions
#
dcleanup(){
	local containers
	containers=( $(docker ps -aq 2>/dev/null) )
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	volumes=( $(docker ps --filter status=exited -q 2>/dev/null) )
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	images=( $(docker images --filter dangling=true -q 2>/dev/null) )
	docker rmi "${images[@]}" 2>/dev/null
}
del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}
relies_on(){
	for container in "$@"; do
		local state
		state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}

nmap(){
	docker run --rm --net=host gvangool/nmap "$@"
}

firefox(){
	del_stopped firefox

	docker run -d \
		--memory 2gb \
		--net host \
		--cpuset-cpus 0 \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}/.firefox/cache:/root/.cache/mozilla" \
		-v "${HOME}/.firefox/mozilla:/root/.mozilla" \
		-v "${HOME}/Downloads:/root/Downloads" \
		-v "${HOME}/Pictures:/root/Pictures" \
		-v "${HOME}/Torrents:/root/Torrents" \
		-e "DISPLAY=unix${DISPLAY}" \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		--device /dev/snd \
		--device /dev/dri \
		--name firefox \
		${DOCKER_REPO_PREFIX}/firefox "$@"

	# exit current shell
	exit 0
}
