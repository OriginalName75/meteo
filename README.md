# A Social Weather Network 

## Install from nothing

### Pre-installation: 
```
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs
```
### Ruby with rbenv:
It can take some time :
```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.4.0
rbenv global 2.4.0
ruby -v
```
  and 
```
gem install bundler
```
### Ruby on Rails 5.0.2
```
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
```
then 
```
gem install rails -v 5.0.2
```
Finally :
```
rbenv rehash
```
### imagemagick
```
sudo apt-get install ghostscript
sudo apt-get install imagemagick
```
### PostgreSQL
```
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.5 libpq-dev
```
Set up your user :
```
sudo -u postgres createuser proj -s

sudo -u postgres psql
postgres=# \password proj
```
If it does not work, see a guide for your specific OS.

## Import the git
In a new foler :
```
  git clone https://github.com/OriginalName75/meteo.git
```
then 

```
cd meteo
```
rename config/database.yml.example to config/database.yml
edit it with the posgresql login/pass

rename config/secrets.yml.example to config/secrets.yml


## Gem

```
bundle
```

## database updates 

```
rake db:create
```
and
```
rake db:migrate
```

# Run the server
```
rails s
```
on your growser: http://localhost:3000/

# Raspberry Code

https://github.com/OriginalName75/meteoRaspberryPI.git


