# coding: utf-8

class Admin::Base < ApplicationController
  before_filter :admin_login_required

  private
  # adminでないユーザを弾く
  def admin_login_required
    raise Forbidden unless @current_member.try(:administrator?)
  end
end
