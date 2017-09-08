class User < ApplicationRecord

  before_save { self.email = email.downcase if email.present? }
  before_save :name_format

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }


   has_secure_password

 def name_format
   	if name
   		name_arr =[]
   		name.split.each do |n|
   			name_arr.push(n.capitalize)
   		end
   	  self.name = name_arr.join(" ")	
   	 end
 end	
end

