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

# display certificate file content
openssl x509 -text -noout -in

# packages containing executable
dpkg --search $(which )

# reverse DNS lookup
dig -x 8.8.8.8 +short

# list signal names
kill --list

# interactive with tty and autoremoval
docker run --rm -it

# conainer ls
docker ps

# include stopped containers
docker ps --all

# remove stopped containers
docker container prune

# docker container stats
docker stats

# docker image ls
docker images

# inspect image
docker image inspect

# inspect container
docker container inspect

# show docker disk usage report
docker system df

# remove all stopped containers
docker container prune

# remove dangling images
docker image prune

# remove unused data (build cache + images + containers)
docker system prune

# completely remove data (build cache + images + containers)
docker system prune -a

# resolve docker compose configuration
docker compose config | bat -l yaml

# show events in chronologic order
kubectl get events --sort-by=.metadata.creationTimestamp

# get pods in wide format
kubectl get pod -o wide

# show diff between actual and desired state of the cluster
kubectl diff --filename

# apply desired state
kubectl apply --filename

# show status of master node components
kubectl get componentstatuses

# count number of files in the subtree
fd --no-ignore | wc -l

# order files in the subtree by access time
fd --no-ignore --exec sh -c 'stat --format="%x : %n" "$1"' _ {} | sort

# create gzip file
tar -czf .tar.gz

# extract, gzip file
tar -xvzf .tar.gz

# install packages from npm cache (also --offline)
npm i --prefer-offline --no-audit

# disable docker compose cache
export COMPOSE_CACHE_DISABLE=1

# build without buildx (enabled if docker-buildx package is installed)
docker build --progress=plain .

# launch node with env file
node --env-file=.env

# evaluate control sequences
less --raw-control-chars

# human readable summary
du -hs

# show hierarchy
ps -H

# file systems with type
df -hT

# recursive archive
rsync -arvh

# aggressive autoremove that removes unused suggestions
apt autoremove --option Apt::AutoRemove::SuggestsImportant=false

# fuzzy filter apt packages
apt-cache search "" | fzf

# Reply VPN: get cookie from web login
openfortivpn cloudgate.reply.it --cookie-on-stdin

# Enel VPN: list gateways
gp-saml-gui -S --verbose --portal --clientos=Linux vpn-ext.enel.com

# Enel VPN: connect to gateway
gp-saml-gui -S --verbose --gateway --clientos=Linux $gateway -- --csd-wrapper=hip-report.sh

# download only in local repository
apt install -d

# clean local repository
apt clean

# paginate throgh stream
less -o /tmp/pipe.log -f <()

# why are these files ignored
git check-ignore -v *

# remove heading and select first column
awk 'NR > 1 { print $1 }'

# create virtual env
python -m venv venv
. venv/bin/activate

# pip autoremove
pip list --not-required | xargs pip uninstall -y

# apt why
apt-rdepends -rp $pkg | grep -F '[Installed]'

# remove all build cache
docker builder prune --all

# clean cache
nix-store --gc

#
llt 

# hello
llt

