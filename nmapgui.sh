#!/bin/bash
function nmapGuI(){
    Menusel=$(whiptail --title "Eli's Nmap GUI Cheat Script" --fb --menu "Please select an Nmap function below: " 25 80 15 \
    "1" "Nmap Help"\
    "2" "Scan a Single IP with Nmap" \
    "3" "Scan a Class C Sunet Range" \
    "4" "Scan the range of IPs between a custom range in a Network ID" \
    "5" "Scan a IP addresses stored in a text file" \
    "6" "Scan the 3 specified IPs only" \
    "7" "First resolve the IP of the domain and then scan its IP address" \
    "8" "Scan only port 80 for specified host" \
    "9" "Scan a custom range of Ports for a Specified Host" \
    "10" "Scan All ports for a specified Host" \
    "11" "Scan UDP 53 and TCP 22 for specified Host" \
    "12" "Scan http and ssh ports for Specified Host" \
    "13" "TCP SYN Scan (best option)" \
    "14" "vFull TCP connect scan" \
    "15" "Scan UDP Ports" \
    "16" "Do a Ping scan only" \
    "17" "Don't ping the hosts, assume they are up" \
    "18" "Version detection scan of open ports (Services)" \
    "19" "Identify Operating System Version" \
    "20" "Slowest Scan (to avoid IDS)" \
    "21" "Sneaky Scan (to avoid IDS)"\
    "22" "Polite Scan (10 times slower than Default Scan Timer (T3))" \
    "23" "Default Scan Timer (normal)" \
    "24" "Aggressive Scan (Fast and Fairly Accurate)" \
    "25" "Very Aggressive Scan (Might Miss Open Ports)" \
    "26" "Normal Text format Output Type" \
    "27" "Grepable file (useful to search inside file)" \
    "28" "XML File Output format" \
    "29" "Output in all 3 formats supported (Text, Grepable, XML)" \
    "30" "Discover Hosts by TCP SYN Packets to specified ports (22-25,80)" \
    "31" "Disable Port Scan (Treat all Hosts as Online)" \
    "32" "Send ICMP Echo Packets to discover hosts" \
    "33" "Perform a Ping Scan" \
    "34" "Run the specified script towards the targets." \
    "35" "Run the script with the specified arguments" \
    "36" "Update script database" \
    "37" "Scan IPv6 hosts" \
    "38" "Run the scan through proxies" \
    "39" "Only Show open ports" \
    "40" "Get info and help for the specified script" \
    "41" "Show currently Installed Version" \
    "42" "Spoof Source Address" \
    "43" "Maximum Number of Parallel Probes/Connections" \
    "44" "Maximum Packets Per Second" \
    "45" "Eli's Nmap Tutorial" 3>&1 1>&2 2>&3)

    case $Menusel in

    1)
        whiptail --title "Nmap Help" --msgbox "Nmap Help" 8 45
        whiptail --textbox /dev/stdin 40 80 <<<"$(nmap -h)"
        
        ;;

    2)
        echo "Scan a Single IP with Nmap"
        whiptail --title "Scan a Single IP with Nmap" --msgbox "Scan a Single IP with Nmap" 8 45
        ip=$(whiptail --inputbox "Enter IP Address: " 8 45 3>&1 1>&2 2>&3)
        nmap $ip
        

        ;;

    3)
        echo "Scan a Class C subnet range"
        whiptail --title "Scan a Class C subnet range" --msgbox "Enter IP Address Only" 8 45
        subc=$(whiptail --inputbox "Enter IP Address Only: " 8 45 3>&1 1>&2 2>&3)
        nmap $subc/24
        
        ;;

    4)
        echo "Scan the range of IPs between a custom range in a Network ID"
        whiptail --title "Scan the range of IPs between a custom range in a Network ID" --msgbox "Scan the range of IPs between a custom range in a Network ID" 8 45
        ip=$(whiptail --inputbox "Enter Begining IP Address: " 8 45 3>&1 1>&2 2>&3)
        lhost=$(whiptail --inputbox "Enter Last Host number: " 8 45 3>&1 1>&2 2>&3)
        nmap $ip-$lhost
        
        ;;

    5)
        echo "Scan the IP addresses listed in text file "
        whiptail --title "Scan the IP addresses listed in text a file " --msgbox "Scan the IP addresses listed in a text file .txt”" 8 45
        pth=$(whiptail --inputbox "Enter full path for text file or a filename.txt to save in current directory: " 8 45 3>&1 1>&2 2>&3)
        nmap -iL $pth
        
        ;;
    6)
        echo "Scan the 3 specified IPs only"
        whiptail --title "Scan the 3 specified IPs only" --msgbox "Scan the 3 specified IPs only" 8 45
        ip1=$(whiptail --inputbox "Enter 1st IP Address: " 8 45 3>&1 1>&2 2>&3)
        ip2=$(whiptail --inputbox "Enter 2nd IP Address: " 8 45 3>&1 1>&2 2>&3)
        ip3=$(whiptail --inputbox "Enter 3rd IP Address" 8 45 3>&1 1>&2 2>&3)
        nmap $ip1 $ip2 $ip3
        
        ;;
    7)
        echo "First resolve the IP of the domain and then scan its IP address"
        whiptail --title "This option will First resolve the IP of the domain and then scan its IP address" --msgbox "Enter the domain address'" 8 45
        dom=$(whiptail --inputbox "Enter Domain address" 8 45 3>&1 1>&2 2>&3)
        nmap $dom
        
        ;;
    8)
        echo "Scan only port 80 for specified host"
        whiptail --title "Scan only port 80 for specified host" --msgbox "Scan only port 80 for specified host" 8 45
        ip=$(whiptail --inputbox "Enter Domain address" 8 45 3>&1 1>&2 2>&3)
        nmap -p80 $ip
        
        ;;

    9)
        echo "Scan a custom range of Ports for a Specified Host"
        whiptail --title "Scan a custom range of Ports for a Specified Host" --msgbox "Scan a custom range of Ports for a Specified Host" 8 45
        ip=$(whiptail --inputbox "Enter IP Address" 8 45 3>&1 1>&2 2>&3)
        fp=$(whiptail --inputbox "Enter First Port" 8 45 3>&1 1>&2 2>&3)
        lp=$(whiptail --inputbox "Enter Last Port" 8 45 3>&1 1>&2 2>&3)
        nmap -p$fp-$lp $ip
        
        ;;

    10)
        echo "Scan All ports for a specified Host"
        whiptail --title "Scan All ports for a specified Host" --msgbox "Scan All ports for a specified Host" 8 45
        ip=$(whiptail --inputbox "Enter IP Address: " 8 45 3>&1 1>&2 2>&3)
        nmap -p- $ip
        ;;
    
    11)
        echo "Scan UDP 53 and TCP 22"
        whiptail --title "Scan UDP 53 and TCP 22" --msgbox "Scan UDP 53 and TCP 22" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -sS -sU -p U:53,T:22 $ip
        
        ;;

    12)
        echo "Scan http and ssh ports for Specified Host"
        whiptail --title "Scan http and ssh ports for Specified Host" --msgbox "Scan http and ssh ports for Specified Host" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -p http,ssh $ip
        
        ;;
    13)
        echo "TCP SYN Scan (best option)"
        whiptail --title "TCP SYN Scan (best option)" --msgbox "TCP SYN Scan (best option)" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -sS $ip
        
        ;;
    14)
        echo "Full TCP connect scan" 
        whiptail --title "Full TCP connect scan" --msgbox "Full TCP connect scan" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -sT $ip
        
        ;;
    15)
        echo "Scan UDP Ports"
        whiptail --title "Scan UDP Ports" --msgbox "Scan UDP Ports" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -sU $ip
        
        ;;

    16)
        echo "Do a Ping scan only"
        whiptail --title "Do a Ping scan only" --msgbox "Do a Ping scan only" 8 45
        ip=$(whiptail --inputbox "Enter IP Adress: " 8 45 3>&1 1>&2 2>&3)
        nmap -sP $ip
        
        ;;

    17)
        echo "Don't ping the hosts, assume they are up"
        whiptail --title "Don't ping the hosts, assume they are up" --msgbox "Don't ping the hosts, assume they are up" 8 45
        ip=$(whiptail --inputbox "Enter IP Address: " 8 45 3>&1 1>&2 2>&3)
        nmap -Pn $ip
        
        ;;
    
    18)
        echo "Version detection scan of open ports (Services)"
        whiptail --title "Version detection scan of open ports (Services)" --msgbox "Version detection scan of open ports (Services)" 8 45
        ip=$(whiptail --inputbox "EnterIP Address for service scan: " 8 45 3>&1 1>&2 2>&3)
        nmap -sV $ip
        
        ;;

    19)
        echo "Identify Operating System Version"
        whiptail --title "Identify Operating System Version" --msgbox "Identify Operating System Version" 8 45
        ip=$(whiptail --inputbox "EnterIP Address for OS scan: " 8 45 3>&1 1>&2 2>&3)
        nmap -O $ip
        
        ;;
    20)
        echo "Slowest Scan (to avoid IDS)"
        whiptail --title "Slowest Scan (to avoid IDS)" --msgbox "Slowest Scan (to avoid IDS)" 8 45
        ip=$(whiptail --inputbox "EnterIP Address for Slowest Scan (to avoid IDS): " 8 45 3>&1 1>&2 2>&3)
        nmap -T0 $ip
        
        ;;
    21)
        echo "Sneaky Scan (to avoid IDS)"
        whiptail --title "Sneaky Scan (to avoid IDS)" --msgbox "Slowest Scan (to avoid IDS)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Sneaky Scan (to avoid IDS): " 8 45 3>&1 1>&2 2>&3)
        nmap -T1 $ip
        
        ;;
    22)
        echo "Polite Scan (10 times slower than Default Scan Timer (T3))"
        whiptail --title "Polite Scan - 10x Slower" --msgbox "Polite Scan (10x slower)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Polite Scan (10x slower): " 8 45 3>&1 1>&2 2>&3)
        nmap -T2 $ip
        
        ;;
    23)
        echo "Default Scan Timer (normal)"
        whiptail --title "Default Scan Timer (normal)" --msgbox "Default Scan Timer (normal)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Default Scan Timer (normal): " 8 45 3>&1 1>&2 2>&3)
        nmap -T3 $ip
        
        ;;
    24)
        echo "Aggressive Scan (Fast and Fairly Accurate)"
        whiptail --title "Aggressive Scan (Fast and Fairly Accurate)" --msgbox "Aggressive Scan (Fast and Fairly Accurate)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Aggressive (fast and fairly Accurate): " 8 45 3>&1 1>&2 2>&3)
        nmap -T4 $ip
        
        ;;
    25)
        echo "Very Aggressive Scan (Might Miss Open Ports)"
        whiptail --title "Aggressive (Might Miss Open Ports)" --msgbox "Very Aggressive Scan (Might Miss Open Ports)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Aggressive (fast and fairly Accurate): " 8 45 3>&1 1>&2 2>&3)
        nmap -T5 $ip
        
        ;;
    26)
        echo "Normal Text format Output Type"
        whiptail --title "Normal Text format Output Type" --msgbox "Normal Text format Output Type" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Normal Text format Output Type: " 8 45 3>&1 1>&2 2>&3)
        fn=$(whiptail --inputbox "Enter Filename only for Normal Text format Output Type: " 8 45 3>&1 1>&2 2>&3)
        nmap -oN [$fn] [$ip]
        
        ;;
    27)
        echo "Grepable file (useful to search inside file)"
        whiptail --title "Grepable file (useful to search inside file)" --msgbox "Grepable file (useful to search inside file)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Grepable file (useful to search inside file): " 8 45 3>&1 1>&2 2>&3)
        fn=$(whiptail --inputbox "Enter Filename Only for Grepable file (useful to search inside file): " 8 45 3>&1 1>&2 2>&3)
        nmap -oG [$fn] [$ip]
        
        ;;
    28)
        echo "XML File Output format"
        whiptail --title "Grepable file (useful to search inside file)" --msgbox "XML File Output format" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for XML File: " 8 45 3>&1 1>&2 2>&3)
        fn=$(whiptail --inputbox "Enter Filename Only for XML File Output format: " 8 45 3>&1 1>&2 2>&3)
        nmap -oX [$fn] [$ip]
        
        ;;
    29)
        echo "Output in all 3 formats supported (Text, Grepable, XML)"
        whiptail --title "Output in all 3 formats supported (Text, Grepable, XML)" --msgbox "Output in all 3 formats supported (Text, Grepable, XML)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for Output in all 3 formats supported (Text, Grepable, XML): " 8 45 3>&1 1>&2 2>&3)
        fn=$(whiptail --inputbox "Enter Filename Only for Output in all 3 formats supported (Text, Grepable, XML): " 8 45 3>&1 1>&2 2>&3)
        nmap -oA [$fn] [$ip]
        
        ;;
    30)
        echo "Discover Hosts by TCP SYN Packets to specified ports (22-25,80)"
        whiptail --title "Discover Hosts by TCP SYN Packets to specified ports (22-25,80)" --msgbox "SDiscover Hosts by TCP SYN Packets to specified ports (22-25,80)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address to Discover Hosts by TCP SYN" 8 45 3>&1 1>&2 2>&3)
        nmap -PS22-25,80 $ip/24
        
        ;;
    31)
        echo "Disable Port Scan (Treat all Hosts as Online)"
        whiptail --title "Disable Port Scan (Treat all Hosts as Online)" --msgbox "Disable Port Scan (Treat all Hosts as Online)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address: " 8 45 3>&1 1>&2 2>&3)
        nmap -Pn $ip/24
        
        ;;
    
    32)
        echo "Send ICMP Echo Packets to discover hosts"
        whiptail --title "Send ICMP Echo Packets to discover hosts" --msgbox "Enter package name to be d (Package Name Only!)" 8 45
        ip=$(whiptail --inputbox "Enter IP Address for ICMP Echo Packets: " 8 45 3>&1 1>&2 2>&3)
        nmap -PE $ip/24
        
        ;;

    33)
        echo "Perform a Ping Scan"
        whiptail --title "Perform a Ping Scan" --msgbox "Perform a Ping Scan" 8 45
        ip=$(whiptail --inputbox "Enter IP Address to perform a Ping Scan: " 8 45 3>&1 1>&2 2>&3)
        nmap -sn $ip/24
        
        ;;
    34)
        echo "Run the specified script towards the targets."
        whiptail --title "Run the specified script towards the targets." --msgbox "Run the specified script towards the targets." 8 45
        ip=$(whiptail --inputbox "Enter IP Address : " 8 45 3>&1 1>&2 2>&3)
        scrt=$(whiptail --inputbox "Enter Script Name: " 8 45 3>&1 1>&2 2>&3)
        nmap --script="$scrt" $ip
        
        ;;
    35)
        echo "Run the script with the specified arguments"
        whiptail --title "Run the script with the specified arguments." --msgbox "Run the script with the specified arguments." 8 45
        ip=$(whiptail --inputbox "Enter IP Address : " 8 45 3>&1 1>&2 2>&3)
        scrt=$(whiptail --inputbox "Enter Script Name: " 8 45 3>&1 1>&2 2>&3)
        arg=$(whiptail --inputbox "Enter Argument: " 8 45 3>&1 1>&2 2>&3)
        nmap --script="$scrt" --script-args="argument=$arg" $ip/24
        
        ;;
    36)
        echo "Update script database"
        whiptail --title "RUpdate script database." --msgbox "Update script database." 8 45
        nmap --script-updatedb
        
        ;;
    37)
        echo "Scan IPv6 hosts."
        whiptail --title "Scan IPv6 hosts" --msgbox "Scan IPv6 hosts." 8 45
        ip=$(whiptail --inputbox "Enter IPv6 Address : " 8 45 3>&1 1>&2 2>&3)
        nmap -6 [$ip]
        
        ;;
    38)
        echo "Run the scan through proxies"
        whiptail --title "Run the scan through proxies" --msgbox "Run the scan through proxies" 8 45
        $url1=$(whiptail --inputbox "Enter 1st URL : " 8 45 3>&1 1>&2 2>&3)
        $url2=$(whiptail --inputbox "Enter 2nd URL : " 8 45 3>&1 1>&2 2>&3)
        nmap --proxies $url1,$url2
        
        ;;
     39)
        echo "Only Show open ports"
        whiptail --title "Only Show open ports" --msgbox "Only Show open ports" 8 45
        ip=$(whiptail --inputbox "Enter IP Address : " 8 45 3>&1 1>&2 2>&3)
        nmap --open $ip
        
        ;;
    40)
        echo "Get info and help for the specified script"
        whiptail --title "Get info and help for the specified script" --msgbox "Get info and help for the specified script" 8 45
        scrt=$(whiptail --inputbox "Enter Specific Script name : " 8 45 3>&1 1>&2 2>&3)
        nmap --script-help="$scrt"
        
        ;;
    41)
        echo "Show currently Installed Version"
        whiptail --title "Show currently Installed Version" --msgbox "Show currently Installed Version" 8 45
        nmap -V
        
        ;;
    42)
        echo "Spoof Source Address"
        whiptail --title "Spoof Source Address" --msgbox "Spoof Source Address" 8 45
        ip=$(whiptail --inputbox "Enter IP Address : " 8 45 3>&1 1>&2 2>&3)
        nmap -S [$ip]
        
        ;;
    43)
        echo "Maximum Number of Parallel Probes/Connections"
        whiptail --title "Maximum Number of Parallel Probes/Connections" --msgbox "Maximum Number of Parallel Probes/Connections" 8 45
        num=$(whiptail --inputbox "Enter Maximum Number of Parallel Probes/Connections : " 8 45 3>&1 1>&2 2>&3)
        nmap --max-parallelism [$num]
        
        ;;
    44)
        echo "Maximum Packets Per Second"
        whiptail --title "Maximum Packets Per Second" --msgbox "Maximum Packets Per Second" 8 45
        num=$(whiptail --inputbox "Enter Maximum Packets Per Second : " 8 45 3>&1 1>&2 2>&3)
        nmap --max-rate [$num]
        
        ;;
    45)
        echo "Eli's Nmap Tutorial"
        whiptail --title "Eli's Nmap Tutorial" --msgbox "Eli's Nmap Tutorial" 8 45
        cat enmaptut.txt
        
        ;;
    esac

}
nmapGuI