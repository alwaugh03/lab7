# README

This README documents the steps necessary to get the
application up and running.

* set up and run the app with bundle install, bin/rails db:setup, bin/rails server.

* libvips, action_text is required as a system dependency for image variants, installation is done with sudo apt update,
sudo apt install libvips and bin/rails action_text:install, bin/rails db:migrate

* sanitization check results: no alerts deployed, text shown as is
