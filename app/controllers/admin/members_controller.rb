# coding: utf-8

class Admin::MembersController < Admin::Base
  # 会員一覧
  def index
    # モデルオブジェクトから値をもらう
    @members = Member.with_deleted.order("id")
  end

  # 詳細
  def show
    # idを指定してオブジェクトを入れる
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
      redirect_to [:admin, @member], notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  # 会員の削除
  def destroy
    @member = Member.with_deleted.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "会員を削除しました。"
  end
end
