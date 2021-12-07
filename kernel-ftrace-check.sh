#!/bin/sh

user_ftrace=$(zcat /proc/config.gz | egrep -E "CONFIG_FTRACE=y|CONFIG_KPROBES=y|CONFIG_PCI_QUIRKS=y|CONFIG_KALLSYMS=y|CONFIG_KALLSYMS_ALL=y|CONFIG_FUNCTION_TRACER=y")

diff ftrace.txt <(echo $user_ftrace)

if [ $? -ne 0 ] 
then
    echo "Ftrace is not available in your kernel."
    exit
else
    echo "You have ftrace enabled in your kernel."
fi