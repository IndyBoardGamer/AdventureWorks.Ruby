class CreateViews < ActiveRecord::Migration

  # rake db:migrate:redo VERSION=20110215024229

  def self.up
    create_view :employees
    create_view :employees_addresses
  end

  def self.down
    drop_view :employees
    drop_view :employees_addresses
  end


  protected
  
  def self.create_view(name)
    view_file = File.join Rails.root, "db", "views", "#{name}.sql"
    view_sql = File.read(view_file)
    execute(view_sql)
  end
  
  def self.drop_view(name)
    execute "IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[HumanResources].[#{name}]'))
             DROP VIEW [HumanResources].[#{name}]"
  end
  
end
