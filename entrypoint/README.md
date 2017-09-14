The docker-entrypoint.sh file needs to be modified. Otherwise it is not possible
to set the `cluster_partition_handling` option via a environment variable.

To simplify this process when the original docker-entrypoint.sh is modified this
is applied using a patch file.

Commands used to create the patch:
```
docker run --rm rabbitmq:3.6.12-alpine cat /usr/local/bin/docker-entrypoint.sh > original.sh
cp original.sh modified.sh
# Do the modifications
diff -Naur original.sh modified.sh > docker-entrypoint.patch
```
