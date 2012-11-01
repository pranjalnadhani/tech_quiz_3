class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :authentication_keys => [:login]

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => '/images/missing_:style.jpg'
  # Setup accessible (or protected) attributes for your model
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin, :avatar, :username, :login, :first_name, :last_name, :sex, :date_of_birth, :full_name
  validates :username, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :sex, :presence => true
  validates :date_of_birth, :presence => true
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  # This is the correct method you override with the code above
  # def self.find_for_database_authentication(warden_conditions)
  # end
  
  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  # attr_accessible :title, :body
  has_many :quizzes
  has_one :result
end