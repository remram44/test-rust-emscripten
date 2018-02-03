FROM trzeci/emscripten:sdk-incoming-64bit

RUN curl -Lo rustup.sh https://sh.rustup.rs && \
    sh rustup.sh --default-toolchain nightly --no-modify-path -y && \
    rm rustup.sh

ENV PATH=$PATH:/bin:/root/.cargo/bin

RUN rustup target add asmjs-unknown-emscripten --toolchain nightly

COPY Cargo.toml /src/Cargo.toml
COPY src /src/src

CMD ["cargo", "build", "--release", "--target=asmjs-unknown-emscripten"]
