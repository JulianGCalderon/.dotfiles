daily()
{
   PWD="$HOME/vaults/brain.md"
   DATE=$(date "+%y-%m-%d.md")
   mkdir -p $PWD
   (cd $PWD && hx $DATE)
}
