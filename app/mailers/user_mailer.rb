# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'アカウントの有効化'
  end

  def password_reset
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'パスワード再登録'
  end
end
