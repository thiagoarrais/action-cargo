# GitHub Action for cargo

This Action enables arbitrary actions with Rust's `cargo` command-line client, including building crates and publishing to [crates.io](https://crates.io/).

## Usage

An example workflow to build, and publish a crate:

```hcl
workflow "Publish" {
  on = "push"
  resolves = ["Cargo Publish"]
}

# Filter for a new tag
action "Tag" {
  uses = "actions/bin/filter@master"
  args = "tag"
}

action "Cargo Publish" {
  needs = "Tag"
  uses = "thiagoarrais/action-cargo@master"
  args = "publish"
  secrets = ["CRATES_AUTH_TOKEN"]
}
```

### Secrets

* `CRATES_AUTH_TOKEN` - **Optional**. The token to use for authentication with the crates.io registry. Required for `cargo publish`.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
