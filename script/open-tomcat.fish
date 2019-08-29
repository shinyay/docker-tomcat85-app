#!/usr/bin/env fish

function open_tomcat
  argparse -n open_tomcat 'h/help' 't/target=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "open-tomcat.fish -t/--target <TARGET_DOMAIN>"
    return
  end

  set -lq _flag_target
  or set -l _flag_target console.run.pivotal.io

  open https://$_flag_target
end

open_tomcat $argv
