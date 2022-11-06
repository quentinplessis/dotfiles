function ss --description "Make computer secure (remove secrets, downloads etc)"
  # make infra repository secure
  cd ~/workspace/infra && make secure && cd -

  # check downloads
  echo "----- check downloads -----"
  cd ~/Downloads
  ls -lah .
  rm -rf (ls -a)
  cd -
  echo "--------------------"

  # check desktop
  echo "----- check desktop -----"
  cd ~/Desktop
  ls -lah .
  rm -rf (ls -a)
  cd -
  echo "--------------------"
end
