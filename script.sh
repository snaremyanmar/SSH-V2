#!/bin/bash

plain='\033[0m'

#စာလုံးအရောင်များ(Server Message)
red='\e[31m'    #အနီရောင်
yellow='\e[33m' #အဝါရောင်
gray='\e[90m'   #မီးခိုးရောင်
green='\e[92m'  #အစိမ်းရောင်
blue='\e[94m'   #အပြာရောင်
magenta='\e[95m'#ပန်းခရမ်းရောင်
cyan='\e[96m'   #စိမ်းပြာရောင်
none='\e[0m'    #အရောင်မရှိ

#Username နှင့် Password ပြောင်းရန်
username="trs66"
password="trs66"

#SSH USER LIMIT သတ်မှတ်ရန်
sshlimiter="300"

#ရက်ကန့်သက်ရန်(Qwiklab အတွက်မို့ 2-DAY ပုံသေထားရပါသည်)
dias="2"

#💠 Server Message ပြင်ရန်💠
#Server-message အရွယ်အစား သတ်မှတ်ချက်
# h6 သည် = စာလုံးအသေး ဖြစ်သည်
# h4 သည် = စာလုံးအလတ် ဖြစ်သည်
# h3 သည် = စာလုံးအကြီး  ဖြစ်သည်
servermessage="<h3><font color='red'>
▬▬▬▬▬▬▬▬✿TRS✿▬▬▬▬▬▬▬▬
</font></h3>
<h4><font color='cyan'>
 GCP SERVER BY THURA SOE
</font></h4>
<h3><font color='red'>
▬▬▬▬▬▬▬▬✿TRS✿▬▬▬▬▬▬▬▬
</font></h3>"
#End
#ဒီအောက်က စာတွေပြင်ရန်မလိုပါ🌺
[[ $EUID -ne 0 ]] && echo -e "${red}Error: ${plain} You must use root user to run this script!\n" && exit 1

sed -i 's/#\?AllowTcpForwarding .*/AllowTcpForwarding yes/' /etc/ssh/sshd_config && sed -i 's/#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && sed -i 's/#\?Banner .*/Banner \/etc\/ssh\/gcp_404/' /etc/ssh/sshd_config && /etc/init.d/ssh restart;
echo "$servermessage" | tee /etc/ssh/gcp_404 >/dev/null
final=$(date "+%Y-%m-%d" -d "+$dias days")
gui=$(date "+%d/%m/%Y" -d "+$dias days")
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -e $final -M -s /bin/false -p $pass $username >/dev/null
echo "$password" >/etc/$username
echo "$username:$password" | chpasswd
echo "$username $sshlimiter" >>/root/usuarios.db
IP=$(wget -qO- ipv4.icanhazip.com)
echo ""
echo -e "\033[1;32m===================================="
echo -e "\033[1;32m   🌺ㅤONLY/:FORYOU&ALLㅤ🌺  " 
echo -e "\033[1;32m===================================="
echo ""
echo -e "\033[1;37m◈─────⪧ SSH ACCOUNT ⪦─────◈"
echo ""
echo -e "\033[1;32m◈ Host / IP   :⪧  \033[1;31m$IP"
echo -e "\033[1;32m◈ Port        :⪧  \033[1;31m22"
echo -e "\033[1;32m◈ Username    :⪧  \033[1;31m$username"
echo -e "\033[1;32m◈ Password    :⪧  \033[1;31m$password"
echo -e "\033[1;32m◈ Login Limit :⪧  \033[1;31m$sshlimiter"
echo -e "\033[1;32m◈ Expire Date :⪧  \033[1;31m$gui"
echo ""
echo -e "\033[1;37m◈────⪧ ✿ ✿ 4▪0▪4 ✿ ✿ ⪦────◈"
echo ""
echo "------------------------------------"
printf "Developed the script by \n"
echo "------------------------------------"
echo ""

echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"
echo -e "${cyan} ___   ___          ________          ___   ___                               ${plain}"
echo -e "${cyan}|\  \ |\  \        |\   __  \        |\  \ |\  \                              ${plain}"
echo -e "${cyan}\ \  \|_\  \       \ \  \|\  \       \ \  \|_\  \                             ${plain}"
echo -e "${cyan} \ \______  \       \ \  \/\  \       \ \______  \                            ${plain}"
echo -e "${cyan}  \|_____|\  \       \ \  \/\  \       \|_____|\  \                           ${plain}"
echo -e "${cyan}         \ \__\       \ \_______\             \ \__\                          ${plain}"
echo -e "${cyan}          \|__|        \|_______|              \|__|                          ${plain}"
echo -e "${green}Contact the developer https://t.me/nkka404 for more information              ${plain}"
echo -e "${yellow}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ${plain}"

echo -e "${cyan}i am 404 😎 ${plain}"
