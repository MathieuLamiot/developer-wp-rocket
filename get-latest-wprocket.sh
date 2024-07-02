# Checkout WP Rocket repository
cd ./source/wp-content

LATEST_TAG=$(curl -s https://api.github.com/repos/wp-media/wp-rocket/releases/latest | grep 'tag_name' | cut -d\" -f4)
git clone https://github.com/wp-media/wp-rocket.git
cd wp-rocket
git checkout tags/$LATEST_TAG