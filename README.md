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

#### Database Creation
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
5. Once you execute the above command the following keys will be returned in the console (the keys need to be added to a):
active_record_encryption:
  primary_key: <key>
  deterministic_key: <key>
  key_derivation_salt: <salt>
6. Copy the keys from the console, and execute the following command to open the 

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

