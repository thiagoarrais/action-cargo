workflow "Build" {
  on = "push"
  resolves = "Cargo Build"
}

action "Shell Lint" {
  uses = "actions/bin/shellcheck@master"
  args = "entrypoint.sh"
}

action "Integration Test" {
  uses = "./"
  args = "version"
}

action "Docker Lint" {
  uses = "docker://replicated/dockerfilelint"
  args = ["Dockerfile"]
}

action "Cargo Build" {
  needs = ["Shell Lint", "Integration Test", "Docker Lint"]
  uses = "actions/docker/cli@master"
  args = "build -t cargo ."
}
