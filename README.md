# popcube_docs

Documentation for popcube project

## Build to html

```
docker run -it -v ${PWD}/popcube:/root/docs cl3m3nt/sphinx make html
```

## Tool for build the docs

Auto-build watcher
```
docker run -it -p 8000:8000 -v ${PWD}/popcube:/root/docs cl3m3nt/sphinx-autobuild
```
