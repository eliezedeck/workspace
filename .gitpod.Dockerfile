# Test with:
# > docker build -f .gitpod.Dockerfile -t gitpod-dockerfile-test .

FROM gitpod/workspace-go:latest

USER root

# Install Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | apt-key add - \
  && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | tee /etc/apt/sources.list.d/tailscale.list \
  && apt-get update \
  && apt-get install -y tailscale \
  && update-alternatives --set ip6tables /usr/sbin/ip6tables-nft

# Useful tools
RUN apt-get install -y \
  iputils-ping dnsutils rsync mc \
  musl \
  wireguard

# Install gdrive tool
RUN cd /tmp && wget 'https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_amd64.tar.gz' && \
  tar xf gdrive_2.1.1_linux_amd64.tar.gz && mv gdrive /usr/local/bin
