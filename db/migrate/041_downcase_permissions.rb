class DowncasePermissions < ActiveRecord::Migration[4.2]
  def self.up
    permissions = Permission.all
      permissions.each{
        | permission |
        permission.name = permission.name.downcase
        permission.save
      }
      Role.rebuild_cache
  end

  def self.down
    permissions = Permission.all
      permissions.each{
        | permission |
        permission.name = permission.name.downcase
        permission.save
      }    
  end
end
