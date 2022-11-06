function s --description "[dry-run] Make computer secure (remove secrets, downloads etc)"
  # make infra repository secure
  cd ~/workspace/infra && make secure && cd -

  # check downloads
  echo "----- check downloads -----"
  ls -lah ~/Downloads
  echo "--------------------"

  # check desktop
  echo "----- check desktop -----"
  ls -lah ~/Desktop
  echo "--------------------"
end
