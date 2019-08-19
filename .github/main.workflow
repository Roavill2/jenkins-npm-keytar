workflow "Build and Publish" {
  on = "push"
}

action "Build" {
  uses = "actions/checkout@v1"
  args = "docker build . --file Dockerfile --tag my-image-name:$(date +%s)"
}
