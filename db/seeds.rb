puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'Example', :last_name => 'Admin', :email => 'admin@example.com', :username => 'exampleadmin',
                    :role => "Admin", :password => 'foobar', :password_confirmation => 'foobar'
puts 'New user created: ' << user.username
