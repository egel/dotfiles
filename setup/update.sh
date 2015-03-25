echo -e "========= Updating egel's dot-files repository ========="
cd ~/dot-files/ 
git submodule foreach git checkout master
git submodule foreach git pull
