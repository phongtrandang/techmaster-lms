require 'bcrypt'

class Account < ApplicationRecord
  attr_accessor :password

  before_save :encrypt_password

  enum role: [:student, :admin]

  has_many :course_students, foreign_key: :student_id
  has_many :courses, through: :course_students
  # account = Account.new()
  # account.encrypt_password
  def encrypt_password
    if self.password.present?
      self.encrypted_password = BCrypt::Password.create(self.password)
    end
  end

  #  Account.authenticate_account
  def self.authenticate(email, password)
  #   if we have account which have email & password
  #     matches with input email & password in database
  #   return account
  #   else
  #   return false

    account = Account.where(email: email).first

    return false unless account && account.encrypted_password

    if BCrypt::Password.new(account.encrypted_password) == password
        return account
    else
      return false
    end
  end

end
