# Pantheon's image as parent
FROM quay.io/pantheon-public/build-tools-ci:1.x

# Install development tools. Modeled after https://github.com/LastCallMedia/PHP-Docker/blob/master/php71/Dockerfile.dev
# We install nvm, but also add node to $PATH directly
# so we can use it through /bin/sh.
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v6.11.0
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | PROFILE=/etc/bash.bashrc bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && npm install -g yarn \
  && npm install -g gulp \
  && npm cache clean --force

