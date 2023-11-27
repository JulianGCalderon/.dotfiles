# source all sh files in ~/.profile.d/
for file in ~/.profile.d/*.sh; do
    source $file
done

