
# Guideline 

I'm using Ruby On Rails to do the task. 
Please follow some of these steps to setup Ruby On Rails at your device. 

- Ruby version: 3.2.0
- Rails version: 6.1.4
- Database: MySQL
- Ubuntu: https://gorails.com/setup/ubuntu/22.04
- MacOs: https://gorails.com/setup/macos/13-ventura

Please follow these step above until "#Installing Rails"
After setup rails at your device, please follow below steps to running my application

- Open terminal
- Enter to root folder "julo_mini_wallet"
- Execute these syntax `bundle install`
- Update these file `config/database.yml`
		- change the `username` and `password` according to your device
- On the terminal and project folder, run these syntax
		- To create Database `bin/rails db:create`
		- To run DB Migration `bin/rails db:migrate`
- After doing all these steps, stay in the terminal and project folder, run rails server with these `bin/rails server`
- You can run with these postman collection, and see the example attached at the each postman request [Julo Mini Wallet ADemiawansyah Collection](https://www.postman.com/ademiawansyah/workspace/ademiawansyah-public-workspace/collection/2957477-25e0a913-3cbb-41d5-9bc7-ecc6b99d89f9)

I've write comment on several section to improve the flow with more complicated and the right flow. 