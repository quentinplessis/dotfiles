function c --description "Cleanup current workspace"
  set target_branch "master"

  if git rev-parse --verify main
    set target_branch "main"
  end

  if git rev-parse --verify develop
    set target_branch "develop"
  end

  git checkout $target_branch
  git pull

  gsweep

  echo "--------------------"
  git branch -vv
  echo "--------------------"
end
