# 
FROM daocloud.io/yaoel/ng-admin:latest
MAINTAINER yaoel@outlook.com

# Install any packages that must be installed.
RUN cd ~/ng-admin
RUN make build