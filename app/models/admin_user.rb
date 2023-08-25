class AdminUser < ApplicationRecord
	#self.table_name="admin_users" 
	# to refer the table if tha name of the table is different to the class name
	has_secure_password
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections ,:through=> :section_edits
 
    FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']
	


	validates :first_name ,:presence=>true,
	                        :length=>{:maximum=>25}
	validates :last_name, :presence=>true, :length=>{:maximum=>50}
	validates  :username , :presence=>true, :length=>{:within=>8..25}, :uniqueness=>true
	validates :email, :presence=>true, :length=>{:maximum=>100}, 
	                     :format=>{:with=>  /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i},
	                     :confirmation=>true  




	#validate :username_is_allowed
	#validate :no_new_users_on_monday
	scope :sorted, lambda{(order('last_name ASC,first_name ASC'))}

	def name
		"#{first_name} #{last_name}"
	end

	#private
	
	#def  username_is_allowed
	#if FORBIDDEN_USERNAMES.include?(username)
	#	errors.add(:username, "username is restricted")
	#end            
# => end
end




 

