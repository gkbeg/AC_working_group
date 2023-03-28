#!/bin/sh

scp $3"/reset.bat" $2:"/$1" 
ssh $2 setx MYDIR $1

# ssh -T $2 <<'ENDSSH'
#     cd %MYDIR%
#     reset.bat
# ENDSSH