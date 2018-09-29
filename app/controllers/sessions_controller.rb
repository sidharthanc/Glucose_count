class SessionsController < Devise::SessionsController
      include EHANUBIZLOGIC
      def create
            self.resource = warden.authenticate!(auth_options)
            @person=Person.find_by_id(current_user.id.to_i)

          if !session[:return_to].blank?

                  redirect_to session[:return_to]
                  session[:return_to] = nil
                  session[:role]=''
                  session[:route_path]=''
            else
             if (!@person.blank?) 
                  @role=EHANUBIZLOGIC.userRoles(current_user)
                  if @role.first['subrole_type'] == "DoctorRole"
                         respond_with resource, :location => after_doctor_sign_in_path_for(resource)
                  end

                  if @role.first['subrole_type'] == "PatientRole"
                        respond_with resource, :location => after_patient_sign_in_path_for(resource)
                  end
              else
                    puts "elseeeee"
                    sign_out current_user
                    flash[:alert] = "This #{current_user.email}  account has been suspended...."
                    return redirect_to root_path

                end      

            end
      end
end
