journal()
{
   PWD="$HOME/vaults/journal.md"
   mkdir -p "$PWD"

   if [[ $1 = "" ]] then
      DATE=$(date "+%y-%m-%d")
      TARGET="daily/$DATE.md"
   else
      TARGET="$1.md"
   fi

   (cd $PWD && hx $TARGET)
}
