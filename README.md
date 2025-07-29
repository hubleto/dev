# Hubleto Dev

How to prepare Hubleto development environment:

  * `cd YOUR_HUBLETO_DEV_FOLDER`
  * `composer create-project hubleto/dev . -s="dev"`
  * `npm install`
  * `npm run build`

> Note: We recommend to create your development environment in `/var/www/html/hubleto-dev` folder.

# Advanced configuration

## Symlinked repositories

By default, Hubleto dev uses public github repositories to install packages. This has an advantage
that you do not need to separately install `hubleto/main`, `hubleto/framework`, `hubleto/react-ui` or other core
repositories. However, if you want to contribute to these core repositories, your dev environment will need
to symlink their local versions.

### Composer

For PHP repositories, you can do this by changing your dev's `composer.json`.

First fork & clone all core repositories to your local computer. We recommend to clone everything into `/var/www/html/hubleto` folder.
E.g., the `hubleto/framework` should be cloned into `/var/www/html/hubleto/framework`.

Then modify each repository in `dev/composer.json` from:

```
{
    "type": "github",
    "url": "https://github.com/hubleto/framework"
}
```

to

```
{
    "type": "path",
    "url": "PATH_TO_YOUR_HUBLETO_FRAMEWORK_LOCAL_FORK"
}
```

Do it for all Hubleto-related repositories (e.g., `hubleto/framework`, `hubleto/main` or `hubleto/terminal`).

Then in your `dev` folder run `composer update`.

### NPM

For UI packages based on react, modify `package.json` from:

```
"@hubleto/react-ui": "^1.0",
```

to

```
"@hubleto/react-ui": "file:../react-ui",
```

Then run `npm update` and `npm run build`.

During the development, you may use `npm run watch-js` and `npm run watch-css` to speed up the compilation process.

## Configuration file for `php hubleto init`

You might need to re-init the dev environment from time to time by running `php hubleto init`. To save your time and
minimize errors, you might create a configuration file and pass it as an argument. The init will then run without any prompt.

Create this config file named e.g. `my-dev-config.yaml` (see full example in [init-config-example.yaml](init-config-example.yaml)) and use it followingly:

`php hubleto init my-dev-config.yaml`
