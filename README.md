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

I decided to use STI for Acessories and StuffedAnimals in a Product table because they store almost all the same data and because it makes things easier when storing orders because I can just reference a list of products 

I ran into an interesting issue around using :all as an enum value when building the Accessory Object. Because rails enums generate a bunch of helper methods, with the same name as the enum key, using :all as an enum key creates a .all() method which overrides other active record methods, so active record blocks this. I changed it from :all to :all_size
