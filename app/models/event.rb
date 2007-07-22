# An event is an observable stimulus, response, or action 
class Event < ActiveRecord::Base
  has_many  :state_changes,
              :order => 'occurred_at ASC',
              :dependent => :destroy
  
  validates_presence_of   :name
  validates_uniqueness_of :name,
                            :scope => :owner_type
  
  # The symbolic name of the event
  def name
    name = read_attribute(:name)
    name ? name.to_sym : name
  end
  
  # A humanized version of the name
  def human_name
    read_attribute(:human_name) || name.to_s.titleize
  end
end