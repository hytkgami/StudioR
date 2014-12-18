class AccountsController < ApplicationController
  # ログインしていないと会員ページから弾かれる
  before_filter :login_required

  # 会員は自分の情報を見ることができる
  def show
    @member = @current_member
  end

  # 会員は退会できる
  def destroy
  end
end
