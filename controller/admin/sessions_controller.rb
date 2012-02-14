class Admin::SessionsController < Admin::BaseController

  skip_before_filter :admin_authorize , :only =>[:new,:create , :setlocale]

  def home
    @title = t('labels.admin_home')
 

  end

  def account_close
    @title = t('labels.account_closed')
  end

  def index
    redirect_to :action => :new
  end


  def new
    @title = t('labels.user_login')
    # logout_killing_session!
    render :layout => "admin/login"
  end

  def create
 
    administartor = Administrator.authorize(params[:name], params[:password])
    @name = params[:name]
    if administartor
      session[:admin] = administartor.id
      flash[:notice] = t('labels.login_success')
      redirect_to  admin_news_index_path


    else
      note_failed_signin
      @email       = params[:email]
      @remember_me = params[:remember_me]
      render :action => 'new',:layout=>"admin/login"
    end
  end

  def logout
    session[:admin] = nil
    flash[:notice] = t('labels.logout_success')
    redirect_to  :action => "new" 
  end

  def setlocale
    #    redirect_to (request.env['HTTP_REFERER'] or root_path)
    render :update do |page|
      page.reload
    end
  end

  protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = t('labels.name_or_password_error')
    logger.warn "Failed login for '#{params[:email]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
