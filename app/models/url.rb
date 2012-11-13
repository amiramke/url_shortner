class Url < ActiveRecord::Base
  attr_accessible :long, :short, :visits
  validates :long, :format => { :with => /(http:\/\/|https:\/\/)\w.+/, :message => "must be a valid url"}
end
