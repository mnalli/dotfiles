# interactive rebase
git rebase -i --autosquash --autostash

# rebase current branch at the specified commit onto tip of the specified branch
git rebase $hash --onto $branch

# overwrite commit's author of multiple commits
git rebase -r --autostash --exec 'git commit --amend --no-edit --author="Michele Nalli <michelenalli96@gmail.com>"'

# set upstream for current branch
git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)

# push until specific commit on current branch
git push origin $hash:$(git rev-parse --abbrev-ref HEAD)

# git log coloured graph
git log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all

# empty commit (useful to trigger CI/CD pipelines)
git commit --allow-empty -m

# overwrite commit's author
git commit --amend --no-edit --reset-author

# interactive add
git add -i

# why are these files ignored
git check-ignore -v *

