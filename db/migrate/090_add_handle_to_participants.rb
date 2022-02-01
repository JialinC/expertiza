class AddHandleToParticipants < ActiveRecord::Migration[4.2]
  def self.up
    begin
      add_column :participants, :handle, :string, :null => true
      AssignmentParticipant.find_each{
        |participant|
        if participant.handle.nil?
          user = User.find(participant.user_id)
          if user.handle.nil?
            participant.handle = user.name
          else
            participant.handle = user.handle
          end
          participant.save
        end
      }
    rescue
       put $!
    end
  end

  def self.down
    begin
      remove_column :users, :handle
    rescue
    end
  end
end
