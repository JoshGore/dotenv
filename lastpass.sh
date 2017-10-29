sudo apt-get update
sudo apt-get install openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip cmake build-essential pkg-config asciidoc xsltproc
git clone https://github.com/lastpass/lastpass-cli.git lastpass
cd lastpass
make
sudo make install
sudo make install-doc
