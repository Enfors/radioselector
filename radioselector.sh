#!/bin/bash

# A list of radio stations is available at http://www.listenlive.eu/estonia.html

default_channel_url="http://otse.err.ee/k/vikerraadio/"
channel_two="http://otse.err.ee/k/raadiotallinn/"
channel_three="http://otse.err.ee/k/klassikaraadio/"
channel_four="http://otse.err.ee/k/raadio4/"

error()
{
    timestamp="$(date): "
    error_msg=$1

    echo $timestamp $error_msg >&2
}

kill_firefox()
{
    killall firefox
}

start_channel()
{
    radio_channel_url=$1

    if [ -z "$channel_url" ]; then
	error "start_channel: no channel URL provided."
    fi
    
    firefox $channel_url & >/dev/null
}

change_channel()
{
    channel_url=$1

    if [ -z "$channel_url" ]; then
	error "change_channel: no channel URL provided."
    fi

    kill_firefox
    start_channel $channel_url
}

main()
{
    channel_url=$1
    if [ -z "$channel_url" ]; then
	channel_url=$default_channel_url
    fi

    if [ "$channel_url" = "1" ]; then
	channel_url=$default_channel_url
    fi

    if [ "$channel_url" = "2" ]; then
	channel_url=$channel_two
    fi

    if [ "$channel_url" = "3" ]; then
	channel_url=$channel_three
    fi

    if [ "$channel_url" = "4" ]; then
	channel_url=$channel_three
    fi

    change_channel $channel_url
}

main $1

