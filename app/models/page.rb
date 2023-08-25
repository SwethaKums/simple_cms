class Page < ApplicationRecord

	belongs_to :subject#, {:optional => false }
	has_and_belongs_to_many :admin_users

	scope :visible ,lambda {where(:visible=>true)}
	scope :invisible, lambda{where(:visible=>false)}
	scope :sorted, lambda{order("position ASC")}
	scope :newest_first, lambda {order("created_at DESC")  }


	validates_presence_of :name
	validates_presence_of :permalinks
	validates_length_of :name, :maximum=>225
	validates_length_of :permalinks, :within=>3..255
	validates_uniqueness_of :permalinks
	# for unique for subject use ":scope=> :subject_id"	
	
end
