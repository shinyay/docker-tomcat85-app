#!/usr/bin/env fish

function cf_push
  argparse -n cf_push 'h/help' 'n/name=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "cf-push.fish -n/--name <APP_NAME>"
    return
  end

  set -lq _flag_name
  or set -l _flag_name myapp

  cf push $_flag_name --docker-image shinyay/tomcat85-app --random-route
end

cf_push $argv
