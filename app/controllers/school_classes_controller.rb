class SchoolClassesController < ApplicationController
 
    def new 
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(permit_params(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(permit_params(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    private

    def permit_params(*args)
        params.require(:school_class).permit(*args)
    end
    
end