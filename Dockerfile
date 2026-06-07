FROM cgr.dev/chainguard/python:latest-dev as builder

USER 65532

RUN /usr/bin/pip --no-cache-dir install openstack-image-manager==0.20260227.0

FROM cgr.dev/chainguard/python:latest

USER 65532

COPY --from=builder /home/nonroot/ /home/nonroot/

WORKDIR /etc/openstack-image-manager
VOLUME ["/etc/openstack-image-manager"]
ENTRYPOINT ["/home/nonroot/.local/bin/openstack-image-manager"]
CMD ["--help"]
