class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :zip, :phone_number, :twitter
  has_many :biographical_datas, dependent: :destroy
   has_many :user_supporting_documents
  has_many :supporting_documents, through: :user_supporting_documents
end
