class Event < ActiveRecord::Base
 validates :title, :city, :address, :zipcode, :logo_url, :category, :start_time, :start_date, :end_date, :end_time, :presence => true
 validates :zipcode,  :length => {:is => 6}
 validates_format_of :logo_url,
                      :with => %r{.(gif|jpg|png)$}i,
                      :message => "must be a URL for GIF, JPG or PNG image.(gif/jpg/png)",
                      :multiline => true
                      
 validates_date :start_date, :on_or_after => lambda { Date.current }
 validates_date :end_date, :on_or_after => :start_date, :message => "Must be on or after start date."
 
 has_many :tickets
end
