workflow "Lint and Test" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -t jackjiaibm/.jenkins-npm-keytar ."
}


action "Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Publish" {
  uses = "actions/docker/tag@master"
  args = "base jackjiaibm/.jenkins-npm-keytar"
}

