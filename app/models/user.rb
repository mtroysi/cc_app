# encoding: utf-8
require 'date'

class User < ActiveRecord::Base
	attr_accessible :nom, :email, :datnaiss, :nbfilms

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nom,  :presence => true,
	                :length   => { :maximum => 50 }
	validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
    validates :datnaiss, :presence   => true,
    			:if => :is_past?
    validates :nbfilms, :presence	=> true,
   						:numericality => { :greater_than_or_equal_to => 0,
   											:only_integer => true}

	def is_past?
    	if datnaiss && datnaiss < Date.today 
    		return true
    	else 
    		self.errors[:datnaiss] << "n'est pas valide."
    		return false
    	end
	end
end
