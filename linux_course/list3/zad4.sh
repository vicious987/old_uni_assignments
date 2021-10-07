#--color=[never | auto | always] kolorowanie imion (nigdy, tylko gdy standardowy strumień wyjściowy
#jest konsolą, zawsze), por. podobną opcję programu ls(1);
#-w, --world wypisanie dodatkowo wiersza Hello, world!
color=false
cl_flag=never
cap=false
greeting=false
helpme=false
whatdo="This program outputs strings 'hello arg' per given arg,"
example="Examplary use: hwb -c arg1 arg2 arg3 ... argN"
possible_flags="Supports following flags:
-c --capitalize
-- color <never/auto/always> (prints name in red font)
-g <arg> --greeting <arg>
-h (help)
-v (version)
-w (world) (adds world to args)"
version_str="hwb version 1.0, GNU General Public License" 
world=0
welcome_word="Hello"
clr=""

TEMP=`getopt -o cg:hvw --long capitalize:,color:,greeting:,help,version,world -- "$@"`
eval set -- "$TEMP"

while true ; do
	case "$1" in
		-c|--capitalize) cap=true; shift ;;
		--color)
			clr="\e[91m" ;
			case "$2" in
				never)
					color=true; shift 2 ;;
				auto)
					color=true; shift 2 ;;
				always)
					color=true; shift 2 ;;
			esac ;;
		--greeting) greeting=true ; welcome_word=$2; shift ;;
		-h|--help) helpme=true ; shift ;;
		-v|--version) version=true ; shift ;;
		-w|--world) world=true ; shift;;
		--) shift; break;;
		*) echo $1; echo 'error while parsing arguments' ; exit 1 ;;
	esac
done

#echo "capitilize: $cap color: $color greeting: $greeting help: $helpme"

while (( "$#" )) ; do
	arg=$1
	if [ "$cap" = "true" ] ; then 	# ^ konwertuje lower na uppercase
		arg="${arg^}"  			# pusty pattern, zpatternuje nam sie do czegokolwiek 
	fi							# czyli do pierwszej litery
	echo -e "$welcome_word, $clr$arg\e[0m"
	shift
done

if [ "$world" = "true" ] ; then
fi

if [ "$help" = "true" ] ; then 
	echo "$whatdo"
	echo "$example"
	echo "$possible_flags"
fi
if [ "$version" = "true" ] ; then
	echo "$version_str"
fi
