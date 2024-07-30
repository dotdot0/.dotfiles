DISTRO=$(uname --nodename)

while true; do
  if [[ $DISTRO=="fedora" ]]; then
    COUNT=$(dnf check-update | wc -l)
    if [[ $COUNT -gt 1 ]]; then
      echo COUNT
    else
      echo 0
    fi
  else 
    echo "Not on fedora:)"
 fi
 sleep 7200
done

