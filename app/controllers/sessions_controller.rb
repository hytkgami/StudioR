# coding: utf-8

class SessionsController < ApplicationController
  # セッション作成
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      session[:user_id] = member.id
      redirect_to :root
    else
      flash.notice = "メールアドレスとパスワードが一致しません"
    redirect_to params[:from]
    end
  end

  # セッション破棄
  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
