cd %~dp0..
copy %~dp0../composer-local-repositories.json %~dp0../composer.json
copy %~dp0../package-local-repositories.json %~dp0../package.json

composer update
npm install
npm run build
php hubleto init %~dp0../init-config-example.yaml