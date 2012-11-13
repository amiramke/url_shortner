class Url < ActiveRecord::Base
  belongs_to :user
  attr_accessible :long, :short, :visits
  validates :long, :format => { :with => /(http:\/\/|https:\/\/)\w.+/, :message => "must be a valid url"}
end
