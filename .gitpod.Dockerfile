# Test with:
# > docker build -f .gitpod.Dockerfile -t gitpod-dockerfile-test .

FROM gitpod/workspace-go:latest

ENV TZ=Indian/Antananarivo

USER root

# Install Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | apt-key add - \
  && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | tee /etc/apt/sources.list.d/tailscale.list \
  && apt-get update \
  && apt-get install -y tailscale \
  && update-alternatives --set ip6tables /usr/sbin/ip6tables-nft

# Useful tools
RUN apt-get install -y \
  iputils-ping dnsutils rsync mc netcat \
  musl \
  wireguard

# Install gdrive tool
RUN cd /tmp && wget 'https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_amd64.tar.gz' && \
  tar xf gdrive_2.1.1_linux_amd64.tar.gz && mv gdrive /usr/local/bin

# Java, for things like Firebase emulators, etc...
RUN apt-get install -y openjdk-11-jre-headless

# gsutil and gcloud for accessing Google Cloud stuffs
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && apt-get update -y && apt-get install google-cloud-cli -y
