FROM gitpod/workspace-full
FROM cyr1l/alpine-luvit:latest 

USER gitpod

RUN lit install Lautenschlager-id/fromage
