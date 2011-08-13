class Mission < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission_priority
  belongs_to :mission_status
  has_many :mission_attempts
  has_many :attempting_users, :through => :mission_attempts, :source => :user

  def short_description
    if self.description
      if self.description.size > 100
  	    self.description[0 .. 100] + '...'
  	  else 
  	    self.description
  	  end
    end
  end
  
  def human_time
    self.created_at.strftime("%b %d, %Y at %I:%M%p")
  end
end
