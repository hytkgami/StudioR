class MembersController < ApplicationController
  # 詳細..?
  def show
  end

  # 新規作成
  def new
    @member = Member.new
  end

  # 登録
  def create
    redirect_to @member, notice: "会員を登録しました。"
  end
end
