# useful commands
## clean up docker 
```
docker system prune -f
```
docker system prune -f

## build container with no cache
```
docker-compose build --no-cache
docker-compose up -d
```
## open terminal to docker
```
docker-compose exec iris iris session iris -U IRISAPP
```
## export IRIS Analytics artifacts
```
d ##class(dev.code).export("*.DFI")
```

```
d ##class(shvarov.objectscript.errors).DIVIDE()
```

## test zpm registry
repo -n registry -r -url https://test.pm.community.intersystems.com/registry/ -user test -pass test

## generate errors
```
do ##class(shvarov.objectscript.errors.analytics.setup).GenerateErrors()
```
