# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# source all bash files in ~/.bashrc.d/
for file in ~/.bashrc.d/*.bash; do
    source “$file”
done
