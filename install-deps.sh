# up to you (me) if you want to run this as a file or copy paste at your leisure
sudo -v

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
#sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# https://rvm.io
# rvm for the rubiess
#Paul does: curl -L https://get.rvm.io | bash -s stable --ruby
#I do this one as it adds dependencies as well
#curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable

# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


# https://github.com/robbyrussell/oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# jenv.io
curl -L -s get.jenv.io | bash




# https://github.com/isaacs/nave
# needs npm, obviously.
# TODO: I think i'd rather curl down the nave.sh, symlink it into /bin and use that for initial node install.
#npm install -g nave


# homebrew!
# you need the code CLI tools YOU FOOL.
#ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)



# https://github.com/rupa/z
# z, oh how i love you
#cd
#git clone https://github.com/rupa/z.git
#chmod +x ~/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

# z binary is already referenced from .bash_profile


# https://github.com/dronir/SpotifyControl
# Spotify Controll Script
#cd ~/code
#git clone git://github.com/dronir/SpotifyControl.git

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
#cd ~/code
#git clone git://github.com/jeroenbegyn/VLCControl.git


# my magic photobooth symlink -> dropbox. I love it.
# first move Photo Booth folder out of Pictures
# then start Photo Booth. It'll ask where to put the library.
# put it in Dropbox/public

# now you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat)
#sudo easy_install Pygments


# chrome canary as default
# on a mac you can set chrome canary as your default inside of Safari preferences :)

# My extra stuff (do I need sudo here?)
# Check gems are up to date without installing documentation
sudo gem update --system --no-document
# Install jekyll
#sudo gem install jekyll

# Set symlink for Sublime Text 2
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
