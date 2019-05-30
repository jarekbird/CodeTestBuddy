# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

I began at 5/30/2019 10:30 AM

I decided to use STI for Accessories and StuffedAnimals. I stored both in the Product table. This turned out to be great because they store almost all the same data and because it made things easier when storing orders. I just referenced a list of products.

I ran into an interesting issue around using :all as an enum value when building the Accessory object. Because rails enums generate a bunch of helper methods, with the same name as the enum key, using :all as an enum key creates a .all() method which overrides other active record methods, so active record blocks this. I changed it from :all to :all_size

It has been a while since I made a brand new rails project. I encountered a weird error when trying to run rails console /Users/jarekbird/.rvm/gems/ruby-2.5.1/gems/bootsnap-1.4.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require': cannot load such file -- /Users/jarekbird/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/x86_64-darwin17/readline.bundle (LoadError). Something is weird in my local environment around rvm and readline.

I found a solution here: https://github.com/rails/rails/issues/26658 which was to add "gem 'rb-readline'" to the development section of my gemfile. this workes for now, but I probably need to troubleshoot this another time. Other people are saying that rvm goofed and you have to reinstall it which I don't want to spend the time to do today.

I had begun PART IV by the time 4 hours had passed, but I hadn't completed it. I kept going as I wanted to see if I could finish.

Part IV is the the knapsack problem. 

I made a few assumptions. I assumed that one stuffed animal was required for a succesful build. In other words, you wouldn't purchase accessories unless you had already decided on at least one stuffed animal. I also restricted accessories to only accesories that were compatible with any stuffed animals that were being purchased.

It was running super slow so I started by adding memoization to the recursion so that it won't check the same tree twice.

I completed the entire project at 5/30/2019 4 PM. Adding the memoization took a while.

It's still running slow. I think the next thing i would want to do if I were to continue this further is put memoization at the database call level or perhaps somewhere else. Also it might be possible to find some early stopping criteria. Not sure.

This was an interesting problem! Thanks for the opportunity!