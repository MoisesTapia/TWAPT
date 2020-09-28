#!/bin/bash

echo "docker start version :${ARACHNI_VERSION}"
source "/usr/local/arachni/bin/readlink_f.sh"

env_root="/usr/local/arachni/system"

writtable="
    arachni-ui-web/config/component_cache
    arachni-ui-web/db
    arachni-ui-web/tmp
    logs
    home
"

for directory in $writtable; do
    directory="$env_root/$directory"

    if [[ ! -w "$directory" ]]; then
        echo "[ERROR] Directory and subdirectories must be writtable: $directory"
        exit 1
    fi
done



operating_system=$(uname -s | awk '{print tolower($0)}')

echo "$LD_LIBRARY_PATH-$DYLD_LIBRARY_PATH-$DYLD_FALLBACK_LIBRARY_PATH" | egrep $env_root > /dev/null
if [[ $? -ne 0 ]] ; then
    export PATH; PATH="$env_root/../bin:$env_root/usr/bin:$env_root/gems/bin:$PATH"

    export C_INCLUDE_PATH="$env_root/usr/include"
    export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH"


    export LIBRARY_PATH="$env_root/usr/lib:/usr/lib:/usr/local/lib"
    export LD_LIBRARY_PATH="$LIBRARY_PATH"

    if [[ "$operating_system" == "darwin" && "$(sw_vers -productVersion)" == "10.11"* ]]; then
        export DYLD_FALLBACK_LIBRARY_PATH="$LIBRARY_PATH"
    else
        export DYLD_LIBRARY_PATH="$LIBRARY_PATH"
    fi

fi

export RUBY_VERSION; RUBY_VERSION='ruby-2.2.3'
export GEM_HOME; GEM_HOME="$env_root/gems"
export GEM_PATH; GEM_PATH="$env_root/gems"
export MY_RUBY_HOME; MY_RUBY_HOME="$env_root/usr/lib/ruby"
export RUBYLIB; RUBYLIB=$MY_RUBY_HOME:$MY_RUBY_HOME/site_ruby/2.2.0:$MY_RUBY_HOME/2.2.0:$MY_RUBY_HOME/2.2.0/x86_64-linux:$MY_RUBY_HOME/site_ruby/2.2.0/x86_64-linux
export IRBRC; IRBRC="$env_root/usr/lib/ruby/.irbrc"

export RAILS_ENV=production

export ARACHNI_FRAMEWORK_LOGDIR="$env_root/logs/framework"
export ARACHNI_WEBUI_LOGDIR="$env_root/logs/webui"

export HOME="$env_root/home/arachni"

exec ruby $GEM_PATH/bin/rackup $env_root/arachni-ui-web/config.ru --host 0.0.0.0