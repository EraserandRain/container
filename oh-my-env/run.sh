#!/usr/bin/env bash

function print_usage(){
    cat << EOF
    
    Usage: $0 [OPTIONS]    

    OPTIONS:
        -s : start oh-my-env container
        -q : stop oh-my-env container 
        -r : rebuild oh-my-env container
        -i : go inside container workspace
        -h : show this help and exit    

EOF
exit 1
}

function start(){
    docker-compose up -d --build -V 
}

function stop(){
    docker-compose down -v
}

function rebuild(){
    stop && start
}

while getopts "h s q r i" OPT
do 
    case $OPT in
       h)
            print_usage
            ;;
       s)
            start 2>&1 | tee log/start.log
            docker-compose ps
            ;;
       q)
            stop
            ;;
       r)
            rebuild
            ;;
       i)
            docker exec -it oh-my-env zsh
	    ;;
    esac
done
