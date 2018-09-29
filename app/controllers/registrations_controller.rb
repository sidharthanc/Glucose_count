class RegistrationsController < ApplicationController
  include EHANUBIZLOGIC
  def create

   @email=params[:email].to_s

   @user=User.find_by_email(@email)

       if (@user.blank?)
 
        @register=EHANUBIZLOGIC.registerUser(params[:email].to_s,params[:password].to_s,params[:name].to_s,params[:lname].to_s,params[:mobile].to_s,params[:sex].to_s,params[:addr_1].to_s,params[:addr2].to_s,params[:dob].to_s)
         if @register
          flash[:success] = "Registered successfully!!"
          redirect_to new_user_session_path
         end
      else
  
        flash[:error] = "Already Registered Please Login!!"
         redirect_to '/users/sign_in'

      end  

  end

  def new_patient


   end 

   def create_patient
    @email=params[:email].to_s
    @user=User.find_by_email(@email)
    #@doctor_patient=EHANUBIZLOGIC.getPatientOfDoctor(current_user, @patient.id.to_i)
    @doctor_patient = Patient.where("email = ? and doctor_id = ?",@email, current_user.person.id.to_i)

      if (!@user.blank?)
         #create person with patient role
        if @doctor_patient.blank?
        
          @create_user=EHANUBIZLOGIC.createNewPatient(current_user,params[:name].to_s,params[:lname].to_s,params[:dob].to_s,@email.to_s,params[:sex].to_s,params[:mobile].to_s,params[:addr1].to_s,params[:addr2].to_s)
          flash[:success] = "Created new patient successfully!"
          redirect_to patient_list_path
         else
          flash[:error] = "#{@user.email.to_s} is already your patient!!"
          redirect_to patient_list_path
        end
      else
          flash[:error] = "#{@email.to_s} is not register with us!!"
          redirect_to new_patient_path
      end   
    end
 # def pre_params
  #  params.require(:user).permit(:name)
  #end



  def update
    super
  end
end
