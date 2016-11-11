#!/usr/bin/env bash


# This will remove the file at $config_path, recreate it and append
# projects configuration object for each paths of $project_paths


project_paths="$HOME/github/*/*/"
config_path="$HOME/.atom/projects.cson"


write_project_entry() {
if [ ! $1 ] ; then
    return 1
fi

# TODO: brew install coreutils -> project_path="$(realpath $1)"
project_path=${1%/}
project_name="$(basename $project_path)"

cat >>$config_path <<EOL
"$project_name":
    title: "$project_name"
    paths: [
        "$project_path"
    ]

EOL
}


echo "removing atom projects config file"
rm -f $config_path

echo "adding atom projects definition..."

for p in ${project_paths}; do
    write_project_entry $p
    echo "ok - $(basename $p)"
done

echo "done"
