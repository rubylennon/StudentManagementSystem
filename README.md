# README

## SECURE BRANCH

### StudentManagementSystem

This README contains the steps necessary to get the **Secure Version** of the StudentManagementSystem application up and running.

---

#### Application Versions
This application was developed using the following:
* Ruby version: 3.1.2
* Rails version: 7.0.4
* Bundler version: 2.3.24
* SQLite3 version: 3.39.4

---

#### System dependencies
The following must be installed on your PC to execute the following steps:
* Git
* Ruby (Ruby 2.7. 0 or newer)
* Rails (Rails 7 or higher)
* Bundler (Bundler 2.4 or higher)
* SQLite3

---

#### Steps to clone GitHub repository:
1. Create an empty folder on your laptop
2. Open the folder using a command-line interpreter e.g. Windows Command Prompt cmd
3. Use the following git command to clone the remote repository:
```
git clone https://github.com/rubylennon/StudentManagementSystem.git
```
4. Navigate in to the downloaded StudentManagementSystem folder using the following command:
```
cd StudentManagementSystem
```
5. Checkout the **Secure Branch** using the following command:
```
git checkout "secure"
```
6. Check that the Secure Branch has been checked out using the following command:
```
git status
```

--- 

#### Database Creation and Encyrption Setup
Once you have checked out the Secure Branch using the steps above, execute the following steps to create the
Secure database using the Secure Branch database schema:
1. Using cmd, in the StudentManagementSystem local directory, execute the following rails command to recreate the
   Gemfile.lock file:
```ruby
bundle install
```
2. Execute the following rails command to create the Secure database SQLite3 file using the application database schema file:
```ruby
rails db:schema:load
```
3. This will create a development **SQLite3** database file called **development_secure.sqlite3** in the application
   database folder (~/db)
4. Initialise Active Record Encyrption by executing the following command:
```ruby
rails db:encryption:init
```
5. Once you have executed the above command the following keys will be returned in the console: primary_key, deterministic_key and key_derivation_salt. Copy the response from the console - the following is just an example of a response:
* Example response:
````
active_record_encryption:
  primary_key: JG5IZXpprTgC4JTXxuQlpRd1n0nuL4KG
  deterministic_key: LevsB731ec0KqBWnr7Yl6iXK6ahAfTaK
  key_derivation_salt: pCNhGhQKGkWPHbFt1aojFGaH8KlD9iZz
````
6. Once you have copied the generated keys from the console, execute the following commands to edit the encrypted credentials file.
7. In cmd, set your preferred text editor, the following will set Notepad as the default editor:
```
SET EDITOR="C:\WINDOWS\system32\notepad.exe --wait"
```
8. Then run the following Rails command to open the encrypted `credentials.yml.enc` file using notepad:
```ruby
bundle exec rails credentials:edit
```
9. Once the `credentials.yml.enc` file opens in Notepad, add the keys you copied in step 5. Once added save the file. Example of how the keys you have generated should be added:

![image](https://user-images.githubusercontent.com/56481222/229324029-da030fe7-1d0a-47bd-b8bf-c6cc2d66de77.png)

10. Once you have added the keys to the `credentials.yml.enc` file, Active Model Encryption will be set up in the application which will allow for user records data to be encrypted and decyrpted as required.

---

#### How to run the Rails Server
Once you have completed the above steps, execute the following steps to run the Rails Server:
1. Using cmd, in the StudentManagementSystem local directory, execute the following rails command to recreate the
   Gemfile.lock file again:
```ruby
bundle install
```
2.  Execute the following Rails command to run the local Rails Server (if there are any issues with this step, try
    rerunning the `bundle install` command again and then try to run the server again):
```ruby
rails s
```
3. Navigate to the following URL to access the running application using an internet browser:
   http://127.0.0.1:3000

---

#### How to update a user to an Admin or Standard user:
1. Go to the following URL and register a new user:
   http://127.0.0.1:3000/users/sign_up
2. Using cmd, in the StudentManagementSystem local directory, execute the following Rails command to open the
   Rails console:
```ruby
rails c
```
3. Execute the following Rails command to list all users in the database - keep note of the ID of the user you
   want to update:
```ruby
User.all
```
4. Updating a Standard User to an Admin User - Execute the following rails command to update the user to an admin (replace the 1 below with the user ID you
   want to update):
```ruby
User.find(1).update(admin:true)
```
5. Updating Admin User to Standard User - Execute the following rails command to update the user to a standard user (replace the 1 below with the user ID you
   want to update):
```ruby
User.find(1).update(admin:false)
```

