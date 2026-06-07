FROM cgr.dev/chainguard/python:latest-dev as builder

USER 65532

RUN /usr/bin/pip --no-cache-dir install openstack-image-manager==0.20260227.0

FROM cgr.dev/chainguard/python:latest

USER 65532

COPY --from=builder /home/nonroot/ /home/nonroot/

LABEL "org.opencontainers.image.documentation"="https://github.com/johanneskastl/containerimage_openstack-image-manager/blob/main/README.md"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"
LABEL "org.opencontainers.image.source"="https://github.com/johanneskastl/containerimage_openstack-image-manager"
LABEL "org.opencontainers.image.url"="https://quay.io/repository/johanneskastlprivat/containerimage_openstack-image-manager"
LABEL "org.opencontainers.image.authors"="Johannes Kastl"
LABEL "org.opencontainers.image.vendor"="Johannes Kastl"

WORKDIR /etc/openstack-image-manager
VOLUME ["/etc/openstack-image-manager"]
ENTRYPOINT ["/home/nonroot/.local/bin/openstack-image-manager"]
CMD ["--help"]
