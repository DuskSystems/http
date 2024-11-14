# HTTP

A `#[no_std]` compatible fork of the [hyperium/http](https://github.com/hyperium/http) library providing common HTTP types.

- Requires Rust 1.81 for `core::error` support.
- Replaced `std` dependencies with `core` / `alloc` equivalents.
- Used `hashbrown::HashMap` instead of `std::collections::HashMap`. (⚠️ Not HashDoS resilient as a result! ⚠️)
- All other functionality remains unchanged from upstream.

[![CI](https://github.com/hyperium/http/workflows/CI/badge.svg)](https://github.com/hyperium/http/actions?query=workflow%3ACI)
[![Crates.io](https://img.shields.io/crates/v/http.svg)](https://crates.io/crates/http)
[![Documentation](https://docs.rs/http/badge.svg)][dox]

More information about this crate can be found in the [crate
documentation][dox].

[dox]: https://docs.rs/http

## Usage

To use `http`, first add this to your `Cargo.toml`:

```toml
[dependencies]
http = { git = "https://github.com/DuskSystems/http" }
```

Next, add this to your crate:

```rust
use http::{Request, Response};

fn main() {
    // ...
}
```

## Examples

Create an HTTP request:

```rust
use http::Request;

fn main() {
    let request = Request::builder()
      .uri("https://www.rust-lang.org/")
      .header("User-Agent", "awesome/1.0")
      .body(())
      .unwrap();
}
```

Create an HTTP response:

```rust
use http::{Response, StatusCode};

fn main() {
    let response = Response::builder()
      .status(StatusCode::MOVED_PERMANENTLY)
      .header("Location", "https://www.rust-lang.org/install.html")
      .body(())
      .unwrap();
}
```

# Supported Rust Versions

This project follows the [Tokio MSRV][msrv] and is currently set to `1.81`.

[msrv]: https://github.com/tokio-rs/tokio/#supported-rust-versions

# License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or https://apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or https://opensource.org/licenses/MIT)

# Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
