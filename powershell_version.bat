mkdir "network_info"
powershell -Command "Get-Host" >"network_info/powershell_version.txt"
ipconfig /all > "network_info/ipconfig_all.txt"
netstat -a > "network_info/netstat_a.txt"
netstat -f > "network_info/netstat_f.txt"
net view /all > "network_info/netview_all.txt"
