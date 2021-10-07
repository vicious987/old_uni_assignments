

while getopts -o c:g:hvw --long capitalize:,color:,greeting:,help,version,world FLAG; do
  case $FLAG in
    a)  #set option "a"
      OPT_A=$OPTARG
  esac
done
