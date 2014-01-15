class User < ActiveRecord::Base
  
  has_many :questions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name
  # attr_accessible :title, :body
  validates :user_name, presence: true, length: { in: 2..10 } #format: { with: /^[a-zA-Z0-9_-]$/, message: 'Must be formatted correctly.' }

  def gravatar_url
  	stripped_email = email.strip
  	downcased_email = stripped_email.downcase
  	hash = Digest::MD5.hexdigest(downcased_email)

  	"http://gravatar.com/avatar/#{hash}"
  end

  def your_questions(params)
    questions.paginate(page: params[:page], order: 'created_at DESC', per_page: 21)
  end

end
