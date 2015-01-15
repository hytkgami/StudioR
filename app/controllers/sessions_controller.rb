# coding: utf-8

class SessionsController < ApplicationController
  # セッション作成
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      session[:user_id] = member.id
    else
      flash.notice = "メールアドレスとパスワードが一致しません"
    end
    redirect_to params[:from] || :root
  end

  # セッション破棄
  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
