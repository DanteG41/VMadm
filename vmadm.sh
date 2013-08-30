#!/bin/bash
conf="./vmadm.cfg"
func="./vmadm.df"
date=$(date +%Y-%m-%d_%H-%M-%S)
source $func
first_run $conf
source $conf
if [ $# = 0 ]; then
    print_help
fi
while getopts ":it:n:r:c:ls:ho" opt ;
do
    case $opt in
	s) ossh=$OPTARG;
	    ;;        
	i) interactive;
            ;;
	n) nname=$OPTARG;
	    ;;
	t ) ftmp=$OPTARG
	   create_templ 
            ;;
        r) rvm=$OPTARG;
	   remove_vm
            ;;
	c) cvm=$OPTARG;
	   cloning_vm
	    ;;
	l) list_vm
	    ;;
	h) print_help
	    ;;	
	o) reconf $conf
	    ;;
	*) echo "Неправильный параметр";
            echo "Для вызова справки запустите `basename $0` -h";
            exit 1
            ;;
        esac
done
