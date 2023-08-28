#!/bin/sh
# set -x

function test() {
    case $1 in
    "1")
        echo "test 1"
        return 1
    ;;
    "2")
        echo "test 2"
        return 2 
    ;;
    *)
        echo "test 3"
        return 3
    ;;
    esac
}

test 5
res=$?
case $res in
"1")
	echo "1"
;;
"2")
	echo "2"
;;
"3")
	echo "3"
;;
*)
	echo "aa"
;;
esac