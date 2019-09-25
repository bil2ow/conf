#!/usr/bin/env bash

clash_dir=$HOME/.config/clash
clash_path=$clash_dir/config.yaml
backup_dir=$clash_dir/config.d

test ! -d $backup_dir && mkdir $backup_dir
mv $clash_path  $backup_dir/config_$(date +"%d_%m_%Y_%M_%S").yaml
wget $CLASH_SUB -vO $clash_path

exit 0
