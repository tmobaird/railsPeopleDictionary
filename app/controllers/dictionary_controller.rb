class DictionaryController < ApplicationController
  def index
      @people = Dictionary.all
      @new_person = Dictionary.new
      respond_to do |format|
          format.html
      end
  end
    
  def add
    first_name = params[:dictionary][:first_name]
    last_name = params[:dictionary][:last_name]
    age = params[:dictionary][:age]
    address = params[:dictionary][:address]
    city = params[:dictionary][:city]
    state = params[:dictionary][:state]
    zip_code = params[:dictionary][:zip_code]
    company = params[:dictionary][:company]
    email = params[:dictionary][:email]
    job_title = params[:dictionary][:job_title]
    phone = params[:dictionary][:phone]
    person = Dictionary.new(:first_name => first_name, :last_name => last_name, :age => age, :address => address, :city => city, :state => state, :zip_code => zip_code, :company => company, :email => email, :job_title => job_title, :phone => phone)
    if !email.include?("@")
      flash[:error] = "Error: Email must include '@'"
    elsif phone == "" && email == ""
      flash[:error] == "Error: An email or phone number must be entered"
    elsif params[:dictionary][:first_name] != "" || params[:dictionary][:last_name] != ""
        person.save
        flash[:success] = "Person added successfully"
    else
        flash[:error] = "Error: person not added"
    end
    redirect_to :action => 'index'
  end
    
  def show
    
  end
  
  def create
    
  end
  
  
end
