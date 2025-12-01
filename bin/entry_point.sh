#!/bin/bash

CONFIG_FILE=_config.yml 

echo "Entry point script running"

# Change to the working directory
cd /srv/jekyll || exit 1

# Ensure gems are installed (in case Gemfile changed)
echo "Installing gems..."
if ! bundle install; then
    echo "ERROR: bundle install failed!"
    exit 1
fi

echo "Gems installed successfully. Starting Jekyll..."

# Start Jekyll with bundle exec to ensure correct gems are used
/bin/bash -c "exec bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

while true; do

  inotifywait -q -e modify,move,create,delete $CONFIG_FILE

  if [ $? -eq 0 ]; then
 
    echo "Change detected to $CONFIG_FILE, restarting Jekyll"

    jekyll_pid=$(pgrep -f jekyll)
    if [ ! -z "$jekyll_pid" ]; then
      kill -KILL $jekyll_pid
    fi

    /bin/bash -c "exec bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

  fi

done
