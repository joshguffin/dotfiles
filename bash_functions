# vim: set ft=sh:

ack()
{
   if [ $# -eq 0 ]; then
      echo "ack is a grep wrapper, gimmie some args!"
      return
   fi

   grep --color=auto -E "^|$1" $2
}
