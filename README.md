# containerimage_openstack-image-manager

Container image containing the [OSISM
openstack-image-manager](https://osism.tech/docs/guides/operations-guide/openstack/tools/image-manager/).

## LICENSE

The OSISM openstack-image-manager is licensed under Apache-2.0, so this
container image follows that license. There may be other parts in the image with
different licenses, depending on the upstream projects.

## Usage

The image uses the openstack-image-manager as `ENTRYPOINT` and `--help` as
`CMD`. So if you just run the image, you get the help output.

To make the openstack-image-manager do something, you need to do three things:

- Mount a volume containing your image definitions to e.g. `/etc/openstack-image-manager`
- Mount a `clouds.yaml` file to `/home/nonroot/.config/openstack/clouds.yaml`
- Tell openstack-image-manager where to find the image definitions by using e.g.
  `--images /etc/openstack-image-manager`

An example run could look like this:

```bash
podman container run \
    --rm \
    --volume ./clouds.yaml:/home/nonroot/.config/openstack/clouds.yaml \
    --volume ./my-image-definitions:/etc/openstack-image-manager \
    quay.io/johanneskastlprivat/containerimage_openstack-image-manager:latest \
    --images /etc/openstack-image-manager/ \
    --dry-run
```
