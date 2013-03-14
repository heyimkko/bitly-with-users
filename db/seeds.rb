User.create :email => "kevin@dbc.com",
            :password => "p@$$w0rd"

User.create :email => "matthew@dbc.com",
            :password => "this is my pass"

User.create :email => "a@a.com",
            :password => "123456"            


Url.create :click_count => 0,
           :long_url => "http://www.google.com",
           :user_id => 1

Url.create :click_count => 0,
            :long_url => "http://www.espn.com",
            :user_id => 1
