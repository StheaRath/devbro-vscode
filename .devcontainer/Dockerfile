# Use the official VS Code dev container base image (Ubuntu Focal)
FROM  mcr.microsoft.com/devcontainers/base:ubuntu
# Build argument to capture the target platform (e.g., linux/arm64 or linux/amd64)
ARG TARGETPLATFORM
# Set environment variable to run apt non-interactively
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages for C++ and Python development
RUN apt-get update --allow-releaseinfo-change && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    python3 \
    zsh \
    gdb \
    python3-pip \
    software-properties-common && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Add the openjdk-r PPA and install Java 8
RUN add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# (Optional) Set JAVA_HOME for convenience
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

#Change the default shell to zsh
RUN chsh -s $(which zsh) vscode
# Install useful zsh thene and plugins: autosuggestions and syntax-highlighting
# Install useful zsh plugins (autosuggestions and syntax-highlighting) with shallow clones
RUN git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-/home/vscode/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-/home/vscode/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy a custom .zshrc file into the container
COPY .zshrc /home/vscode/.zshrc
# Switch to the non-root user provided by the base image
USER vscode

