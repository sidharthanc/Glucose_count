class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:doctor,:new_prescription]
  def home
    if !current_user.nil?

      @person=Person.find_by_id(current_user.id.to_i)
  
      if (!@person.blank?) 
        @role=EHANUBIZLOGIC.userRoles(current_user)
        if @role.first['subrole_type'] == "DoctorRole"
        return redirect_to doctor_path
       end
      if @role.first['subrole_type'] == "PatientRole"

        return redirect_to patient_path
      end
      else
        return redirect_to new_user_session_path
     end
   else
    return redirect_to new_user_session_path
  end
 end

 def confirm_email

    @id=params[:id].to_s

    @user = User.find_by_email(@id)

    if !@user.blank?

      if !@user.confirmation_token.blank?
       @email_verification=EHANUBIZLOGIC.email_activate(@user)
  
        #flash[:success] = "Welcome to the Ehanu! Your email has been confirmed."
        #redirect_to '/users/sign_in'

        else

       flash[:success] = "Your email id already verified please login"
      redirect_to '/users/sign_in'

       end 


    else
   
    flash[:alert] = "You are not a valid user please register"
      redirect_to '/users/sign_in'

    end 
 
  end

  def doctor
      
  end

  def email_inbox

    #@user=User.find_by_email(params[:email].to_s)

    @send_status=EHANUBIZLOGIC.sendPasswordresetEmail(params[:email].to_s)

    if @send_status.to_s=="email #{params[:email].to_s} not registered with us"

      flash[:alert] = "You are not a valid user Please register with us"   

     else
      
      flash[:success] = "Please check your Inbox for Password Reset Instructions"
     end

     redirect_to '/users/sign_in'

   end 

   def edit_password

    puts "email"+params[:email].to_s

     @user=User.find_by_email(params[:email].to_s)
     if @user.blank?
      flash[:alert] = "You are not a valid user Please register with us"
      redirect_to '/users/sign_in'
     end

   end

   def passwordreset

     password=params[:password_confirmation].to_s
     @user=User.find_by_email(params[:email].to_s)
     @user.encrypted_password= ::BCrypt::Password.create("#{password}", :cost => 10).to_s
     @user.save!

   end

   def create_count
     @count=params[:count].to_i
     @create_count=EHANUBIZLOGIC.create_blood_count_(current_user,@count.to_i)
     if @create_count.to_i==1
       flash[:success] = "successfully save the count"
     else
      flash[:alert] = "Sorry cannot save the count" 
     end
     redirect_to '/patient'
   end

end


