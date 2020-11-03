#!/usr/bin/env bash
banner()
{
  echo "  "
  echo "╭━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╭━┳╮╱╱╱╭╮"
  echo "┃━━╋━┳┳┳┳┳━┳━╮╭━┳━┳╯┣━╮┃━╋╋━┳┳╯┣━┳┳╮"
  echo "┣━━┃╋┃┃┃╭┫━┫┻┫┃━┫╋┃╋┃┻┫┃╭┫┃┃┃┃╋┃┻┫╭╯"
  echo "╰━━┻━┻━┻╯╰━┻━╯╰━┻━┻━┻━╯╰╯╰┻┻━┻━┻━┻╯"
  echo "author >th3cr00k3dm4n"
}

run_script()
{
     banner
      read -p "Enter url: " url
      echo ""
      echo ""
      echo "working...."
      wget -r $url
        if [ $? == 0 ]
        then echo "done ! source code is stored in" $url
        else echo "failed"
         fi
}
run_install()
{
    banner
    read -p "Do you want to install missing libraries? [Y/n] :" ans
    if [ $ans == "y" ]
    then pkg install wget -y
                  if [ $? == 0 ]
                  then run_script
                  else  echo " failed try again"
                  fi
     else echo "failed"
    fi
}

dpkg -s "wget" >/dev/null 2>&1 || run_install
if [ $? == 0 ]
then run_script
fi