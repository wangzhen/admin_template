class Admin::BaseController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #  include ExceptionNotifiable
  layout "admin/base"
 
  before_filter :admin_authorize ,:set_locale

  init_action
  #
  #    protected
  #
  #  ssl_required :admin_authorize if SSL_ENABLE

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    session[:locale] = "zh" if session[:locale].blank?
    I18n.locale = session[:locale] || I18n.default_locale
  end




  def admin_authorize
    if session[:admin]
      return true
    else
      redirect_to new_admin_session_path
      return false
    end
  end

 

  def split_keyword(keyword)
    unless keyword.blank?
      #      keyword.gsub!(/[　\s\t]+$/o, "")
      #      keyword.gsub!(/^[　\s\t]+/o, "")
      #      keyword.gsub!(/[　\s\t]+/o, " ")
      #      keyword.split(/(\s)/)
    end
  end




  def admin_location
    #    session[:admin_return_to] = request.request_uri
  end

  # Redirect to the URI stored by the most recent store_location call or
  # to the passed default.  Set an appropriately modified
  #   after_filter :store_location, :only => [:index, :new, :show, :edit]
  # for any controller you want to be bounce-backable.
  def admin_redirect_back_or_default(default)
    redirect_to(session[:admin_return_to] || default)
    session[:admin_return_to] = nil
  end


  #   如果是跳转页面，前面要加pa
  #  def redirect_to(options = {}, response_status = {})
  #
  #    if ['demo.kembo-soft.com' , "yamaha.shepherddigital.jp", "www.yamaha.com.cn" ].include?(request.host)
  #      redirect_to "/pa#{url_for(options)}"
  #    else
  #      redirect_to(options, response_status)
  #    end
  #  end

end

