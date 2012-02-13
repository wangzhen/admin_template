module AdminTemplate

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def init_action
        before_filter :init_model_string
      include AdminTemplate::InstanceMethods

    end
  end


  module InstanceMethods



    def index

      @title = t('labels.manager', :model => @model.model_name.human)
      @search = @model.search(params[:search])

      unless params[:keyword].blank?
        keyword = split_keyword(params[:keyword])
        keyword.each do |word|
          @search.conditions.group do |group|
            group.or_name_like = word
          end
        end
      end

      instance_variable_set("@#{@model_string.pluralize}" ,@search.page(params[:page] || 1).per(10))

    end

    def new
      @title = t('labels.manager', :model => @model.model_name.human)
      instance_variable_set("@#{@model_string}" ,@model.new)
    end

    def create

      instance_variable_set("@#{@model_string}" ,@model.new(params["#{@model_string}"]))
      if instance_variable_get("@#{@model_string}").save
        flash[:notice] = t('labels.created_success')
        if @model_string.pluralize == @model_string
          redirect_to eval("admin_#{@model_string.pluralize}_index_path")
        else
          redirect_to eval("admin_#{@model_string.pluralize}_path")
        end
      else
        render :action => :new
      end
    end

    def edit
      @title = t('labels.manager', :model => @model.model_name.human)
      instance_variable_set("@#{@model_string}" ,@model.find(params[:id]))
    end

    def show
      instance_variable_set("@#{@model_string}" ,@model.find(params[:id]))
      render :edit
    end

    def update

      instance_variable_set("@#{@model_string}" ,@model.find(params[:id]))
      if instance_variable_get("@#{@model_string}").update_attributes(params["#{@model_string}"])
        flash[:notice] = t('labels.update_success')
        if @model_string.pluralize == @model_string
          redirect_to eval("admin_#{@model_string.pluralize}_index_path")
        else
          redirect_to eval("admin_#{@model_string.pluralize}_path")
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      instance_variable_set("@#{@model_string}" ,@model.find(params[:id]))

      instance_variable_get("@#{@model_string}").destroy
      respond_to do |format|
        format.html {
          if @model_string.pluralize == @model_string
            redirect_to eval("admin_#{@model_string.pluralize}_index_path")
          else
            redirect_to eval("admin_#{@model_string.pluralize}_path")
          end

        }
        format.xml { head :ok }
      end
    end



  def init_model_string
    begin
      @model = self.class.to_s.split('::').last.sub(/Controller$/, '').singularize.classify.constantize
      @model_string = self.class.to_s.split('::').last.sub(/Controller$/, '').singularize.downcase
    rescue
      p  'ERROR_BASE'
    end
  end

  end

end
ActionController::Base.send(:include, AdminTemplate)