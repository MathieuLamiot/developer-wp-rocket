# Developer.WordPress.org Theme

## Development

### Prerequisites

All commands below need to be executed as non-root user.

* Docker
* PHP >= 7.4.0 with extensions: xml, mysql, mbstring, curl, zip, intl
* Node/npm >= 18
* Yarn
* Composer
* SVN

[How to install the prerequisites](#a-nameinstall-prerequisitesa-install-prerequisites)

### Setup

0. Update composer dependencies

    ```bash
    composer update
    ```

    If you never set up a Github token for composer, you might get a rate-limit error. In this case, just go to the link provided in the error report to generate a GitHub token (no specific permissions needed) and copy-paste the obtained token into the terminal prompt.

1. Set up repo dependencies.

    ```bash
    yarn setup:tools
    ```

2. Build the assets. If there's anything that needs setting up.

    ```bash
    yarn build
    ```


3. Start the local environment.

    ```bash
    yarn wp-env start
    ```

    This step should take a couple of minutes to download WordPress, then install and configure it. If it does not perform all those actions, you can retry with:

    ```bash
    yarn wp-env destroy
    yarn wp-env start
    ```

    If this step worked properly, you should be able to access a new WordPress website at [localhost:8888](http://localhost:8888). The website should be ready to use (ie. WordPress already installed).

4. Run the setup script (do it only once).

    ```bash
    yarn setup
    ```

Note: if this is the first activation of the wp-env, there is a conflict between plugins: "Posts 2 posts" and WP Parser, preventing the later to activate.
Manually log into the admin panel, deactivate "Posts 2 Posts" manually, activate WP Parser and then re-activate "Posts 2 Posts".
Issue tracked here: https://github.com/WordPress/wporg-developer/issues/523

1. Visit site at [localhost:8888](http://localhost:8888).

2. Log in with username `admin` and password `password`.

### WP Rocket

- Update WP Rocket and Parse WP Rocket

    ```bash
    yarn parse
    ```

- Update WP Rocket

    ```bash
    yarn update:wprocket
    ```

- Delete all developers docs (posts/terms) created.

    ```bash
    yarn parse:reset
    ```

### Environment management

These must be run in the project's root folder, _not_ in theme/plugin subfolders.

* Stop the environment.

    ```bash
    yarn wp-env stop
    ```

* Restart the environment.

    ```bash
    yarn wp-env start
    ```

* Open a shell inside the docker container.

    ```bash
    yarn wp-env run wordpress bash
    ```

* Run wp-cli commands. Keep the wp-cli command in quotes so that the flags are passed correctly.

    ```bash
    yarn wp-env run cli "post list --post_status=publish"
    ```

* Update composer dependencies and sync any `repo-tools` changes.

    ```bash
    yarn update:tools
    ```

* Watch for SCSS changes and rebuild the CSS as needed.

    ```bash
    yarn start:theme
    ```

* Parse the code reference again. This is run as part of the project setup.

    ```bash
    yarn parse
    ```

### Asset management

* Build assets once: `yarn build:theme`
* Watch assets and build on changes: `yarn start:theme`

### <a name="install-prerequisites"></a> Install prerequisites

#### Yarn

```bash
curl -o- -L https://yarnpkg.com/install.sh | bash
yarn --version
```

#### Subversion

```bash
apt install subversion
```

#### NVM

Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

#### Node
Install Node 18

```bash
nvm install 18
node -v
```

#### PHP
Check PHP version and switch PHP version to PHP7.4 if it is already installed:

```bash
php -v
sudo update-alternatives --config php
```

Install PHP 7.4 and required/basic extensions:

```bash
apt install php7.4 php7.4-cli php7.4-xml php7.4-mysql php7.4-mbstring php7.4-curl php7.4-zip php7.4-intl php7.4-gd php7.4-bcmath php7.4-imagick
```

Switch PHP version to PHP7.4:
```bash
sudo update-alternatives --set php /usr/bin/php7.4
```
### FAQ

#### FAQ Issue with docker Could not connect to Docker
```bash
docker ps
```

Getting permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker

Solution:
```bash
unset DOCKER_HOST
sudo usermod -aG docker $USER
```
Then close and reopen terminal:
```bash
docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

