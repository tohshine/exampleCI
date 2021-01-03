set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  rsync -a --exclude={'/node_modules','/src','/public'} client/ root@104.236.48.132
  rsync -a server/ root@104.236.48.132
else
  echo "Not deploying, since the branch isn't master."
fi