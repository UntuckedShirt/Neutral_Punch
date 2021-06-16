class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
#reference section 7 182-185 for category creation
#(NoMethodError in Categories#new) create below to avoid errors
#watch for obj mispelling: cateogies is th file, category is the obj
#see new.html.erb for details
    def new
        @category = Category.new
    
    end


    def create
        @category = Category.new(category_params)
        if @category.save
          flash[:notice] = "Category was successfully created"
          redirect_to @category
        else
          render 'new'
        end
      end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)

    end

      def show
        @category = Category.find(params[:id])
        @jabs = @category.jabs.paginate(page: params[:page], per_page: 5)

    end

      def edit
        @category = Category.find(params[:id])

    end


    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Category updated"
            redirect_to @category
        else
            render 'edit'
        end
    end


    private

    def category_params
        params.require(:category).permit(:name, :user)

    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:notice] = "Only admin can handle this"
            redirect_to categories_path
        end
    end

end