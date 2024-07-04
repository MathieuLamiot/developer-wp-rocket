# Developer.WordPress.org Theme

## Development

### Prerequisites

* Docker
* Node/npm
* Yarn
* Composer
* SVN

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

3. Get the latest WP Rocket sources

    ```bash
    yarn update:wprocket
    ```

4. Start the local environment.

    ```bash
    yarn wp-env start
    ```

    This step should take a couple of minutes to download WordPress, then install and configure it. If it does not perform all those actions, you can retry with:

    ```bash
    yarn wp-env destroy
    yarn wp-env start
    ```

    If this step worked properly, you should be able to access a new WordPress website at [localhost:8888](http://localhost:8888). The website should be ready to use (ie. WordPress already installed).

5. Run the setup script.

    ```bash
    yarn setup
    ```

Note: if this is the first activation of the wp-env, there is a conflict between plugins: "Posts 2 posts" and WP Parser, preventing the later to activate.
Manually log into the admin panel, deactivate "Posts 2 Posts" manually, activate WP Parser and then re-activate "Posts 2 Posts".
Issue tracked here: https://github.com/WordPress/wporg-developer/issues/523

1. Visit site at [localhost:8888](http://localhost:8888).

1. Log in with username `admin` and password `password`.

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
