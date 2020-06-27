##### Martin Moreno - Jose Miguel Iturralde

[Download API Postman Collection](https://www.getpostman.com/collections/13a0517fc64e00e3397d)

## Course Project Part 4

The fake data will create model records of: users, profile pages, mail box, events, organizations, comments, comments replies, events invitations and organization invitations.

Run the following commands to launch the application:
<pre><code>yarn install --check-files
bundle install
rake db:migrate
rake db:populate_fake_data
rake admin:create_admin_user # This will let you set the password of the 
admin user of the application, email: admin@eventsapp.com</code></pre>

To login with a regular user:
1. Login with the newly created admin account (email: admin@eventsapp.com)
2. Go to Admin > Users
3. Go to Edit any user
4. Change the password field and click Update User
5. Now you can login with the mail and password of this account


* Report events: a event will be automatically deleted if it has been reported twice