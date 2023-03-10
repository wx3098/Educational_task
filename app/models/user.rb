class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    before_destroy:admin_jump
    before_update:admin_jump
    
    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    before_validation { email.downcase! }
    has_secure_password
    validates :password, length: { minimum: 6 },on: :new

    private

    def admin_jump
        throw(:abort) if self.admin == true && User.where(admin: true).count == 1
    end

end
