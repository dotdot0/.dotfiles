DISTRO=$(uname --nodename)

if [[ $DISTRO=="fedora" ]]; then
  echo $(dnf --installed list | wc -l)
else 
  echo "Not on fedora"
fi
