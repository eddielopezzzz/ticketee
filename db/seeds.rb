admin_user = User.create(:email => "eddielopezzzz@hotmail.com", :password => "Kristian1")

admin_user.admin = true
admin_user.confirm!

Project.create(:name => "blah")

State.create(:name => "New",
             :background => "#85FF00",
             :color => "white", 
             :default => true)
             
State.create(:name => "Open",
             :background => "#00CFFD",
             :color => "white",
             :default => false)
             
State.create(:name => "Closed",
             :background => "black",
             :color => "white",
             :default => false)
