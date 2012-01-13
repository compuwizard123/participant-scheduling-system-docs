#!/bin/bash
sudo apt-get install -y python python-dev postgresql libpq-dev
python_modules=( psycopg2 django django-ajax-validation django-extensions django-registration django-uni-form )
for i in "${python_modules[@]}"
do
	sudo easy_install $i
done

DEST=/opt/participant-scheduling-system/

if [ -d "$DEST" ]; then
    sudo rm -Rf $DEST
fi
sudo mkdir $DEST
sudo chown -R $(id -un) $DEST
git clone git://github.com/compuwizard123/participant-scheduling-system.git $DEST