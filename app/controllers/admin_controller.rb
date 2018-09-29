class AdminController < ApplicationController
  def admin_home
  	@person= Person.find_by_id(current_user.id.to_s)
  	@user_role_id=2
  	@doctor_role_id=3
  	@pharm_role_id=4
  	@users=EHANUBIZLOGIC.getAllusersWithRole(current_user,@user_role_id.to_i,'')
  	@doctors=EHANUBIZLOGIC.getAllusersWithRole(current_user,@doctor_role_id.to_i,'')
  	@pharmacists=EHANUBIZLOGIC.getAllusersWithRole(current_user,@pharm_role_id.to_i,'')
  end
  def notification_for_admin
  @person= Person.find_by_id(current_user.id.to_s)	
  @request_fordctr_pharmacy=EHANUBIZLOGIC.getRequestsForDoctorPharmacy(current_user)	

  end

  def read_req_notification
  	@request_id=params[:request_id].to_i
  	@notification=EHANUBIZLOGIC.ReadrequestNotification(current_user,@request_id.to_i)

   respond_to do |format|
      format.html
      format.json { render :json => @notification }
    end
  end
  def aproved_changerole
   @person_role=params[:person_role].to_s
   @person_role=@person_role.split(',')
   @user_id=@person_role[0].to_s
   @role_id=@person_role[1].to_s
   @request_id=@person_role[2].to_s
   @reject_aprove=@person_role[3].to_s
   @change_role=EHANUBIZLOGIC.ChangeUserRole(current_user,@user_id.to_i,@role_id.to_i,@request_id.to_i,@reject_aprove.to_i)
    respond_to do |format|
      format.html
      format.json { render :json => @change_role }
    end
  end
  def searchuser_by_admin
   @person_role_name=params[:name_passing].to_s
   @person_role_name=@person_role_name.split(',')
   @user_name=@person_role_name[0].to_s
   @role_id=@person_role_name[1].to_s	
   @persons=EHANUBIZLOGIC.searchPersonByAdmin(current_user,@user_name.to_s,@role_id.to_i)
    respond_to do |format|
      format.html
      format.json { render :json => @persons }
    end
  end

end
