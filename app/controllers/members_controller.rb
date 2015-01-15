# coding: utf-8

class MembersController < ApplicationController
  # 会員情報
  def show
    @member = Member.find(params[:id])
  end

  # 新規作成
  def new
    @member = Member.new
  end

  # 登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:user_id] = @member.id
      redirect_to @member, notice: "ようこそ, #{@member.name}さん。"
    else
      flash.notice = "会員登録に失敗しました。"
      render "new"
    end
  end
end
