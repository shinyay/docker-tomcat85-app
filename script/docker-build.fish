#!/usr/bin/env fish

function build_docker
  argparse -n build_docker 'h/help' 't/tag=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "docker-build.fish <COMMAND>"
    echo "docker-build.fish -t/--tag <DOCKER TAG>"
    return
  end

  set -lq _flag_tag
  or set -l _flag_tag latest

  docker build .. -t shinyay/app-tomcat8:$_flag_tag
end

build_docker $argv
