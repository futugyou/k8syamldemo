### [download](https://github.com/moby/buildkit/releases)
```
buildkitd &
buildkitd --oci-worker=false --containerd-worker=true & 

buildctl build \
    --frontend=dockerfile.v0 \
    --local context=. \
    --local dockerfile=./WebApiHost \
    --output type=image,name=futugyousuzu/ddddemo_project:buildkit,push=true   # 'push=true' it will push image to registry
    --output type=oci,dest=./ddddemo_project.tar   
    --output type=docker,name=futugyousuzu/ddddemo_project:buildkit | docker load

ctr -n buildkit i ls
ctr -n buildkit i push -u username:password futugyousuzu/ddddemo_project:buildkit
```

### About ''push=true'
```
~/.docker/config.json
{
	"auths": {
		"docker.io": {
			"auth": "base64(username:password)"
		}
	}
}
No need to install docker, only the config.json
```

### rust images build
```
https://github.com/denzp/cargo-wharf
Haven't updated for a long time
```