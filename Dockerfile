# originally copied from icepuma/rust-action; thx man!
FROM rust:1.47.0

LABEL "com.github.actions.name"="Rust Action"
LABEL "com.github.actions.description"="'Silverbullet' for a quickstart Rust CI based upon Github Actions"
LABEL "com.github.actions.icon"="play-circle"
LABEL "com.github.actions.color"="gray-dark"

RUN rustup component add clippy-preview
RUN rustup component add rustfmt-preview

RUN cargo install cargo-release

RUN apt-get update \
	&& apt-get install -y libxcb-shape0-dev libxcb-xfixes0-dev xorg-dev cmake \
	&& rm -rf /var/lib/apt/lists/*

COPY build_termbox.sh /build_termbox.sh
RUN /build_termbox.sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
