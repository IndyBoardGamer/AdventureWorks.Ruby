
# Welcome to Rails

Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Control pattern. This application is a direct rip off the of the ASP.NET article [_"Build a Data-Driven Enterprise Web Site in 5 Minutes"_](http://msdn.microsoft.com/da-dk/magazine/gg535665%28en-us%29.aspx)




# Local Setup

Download and install the AdventureWorks database. A link can be found in the article 
above. 

ENV['ADVENTUREWORKS_SA_PASS']

Create an "hr" login in SQL Server with a password of "hr". Make the default database 
AdventureWorks with a default schema of HumanResources. Make sure to also select 
HumanResourcees as an owned schema while in the user properties for the AdventureWorks 
database. Give the user some good permissions in order to create tables and/or views. 
This is required for migrations. I recommend "db_owner". I also gave it a server role
of "dbcreator" so it can make the test database via rails' rake tasks.

export ADVENTUREWORKS_HOST='vm2008'

Note, we have copies in tmp directory, will LT version work? Comment on this above.


# Noteworthy

We created a config/initializers/activerecord.rb file that holds two optional configurations. One for the table name prefix to match our default schema. This way we can keep our table name configurations to a minimal in our models. We also added a configuration option for the SQL Server adapter to enable newly created string columns as unicode/national types. This only affects newly created columns via migrations. So if you specify a :string type, you will get nvarchar(255) vs varchar(255).

  $ rake db:migrate


* The override_task.rb file in lib.
  https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/wiki/Rails-DB-Rake-Tasks
  http://metaskills.net/2010/05/26/the-alias_method_chain-of-rake-override-rake-task/

* Setup views
  - All [ModifiedDate] to [updated_at]

* Force lowercase with adapter?

* ActiveRecord::Base.schema_format = :sqlserver



