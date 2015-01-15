echo -e "========= Updating egel's dot-files repository ========="
cd ~/dot-files/ && \
  git submodule update --init --recursive && \
  git pull --recurse-submodules
