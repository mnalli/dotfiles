# display certificate file content
openssl x509 -text -noout -in

# packages containing executable
dpkg --search $(which )

# reverse DNS lookup
dig -x 8.8.8.8 +short

# list signal names
kill --list

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

# remove heading and select first column
awk 'NR > 1 { print $1 }'

# create virtual env
python -m venv venv
. venv/bin/activate

# pip autoremove
pip list --not-required | xargs pip uninstall -y

# apt why
apt-rdepends -rp $pkg | grep -F '[Installed]'

# clean cache
nix-store --gc

