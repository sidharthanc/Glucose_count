
module EHANUBIZLOGIC

  # define custom exception
  require 'date'
  class CustomException < Exception
  end


  # Code to initialize Module
  # create struct to hold medical notes and prescriptions
  #Struct.new("EhanuBizLogicPatientFile",:created_at, :file_type, :file)
  Struct.new("BizLogicDailyReports",:file,:maxium_count,:minimum_count)
  #
  #

  # utility_methods
  # return roles of the gven user
  def self.userRoles(user)
    user.person.roles
  end

  # return true if user has one of supplied roles
  def self.userHasRole(user, valid_roles)
    p = user.person
    if p.nil?
      return nil
    end
    return self.personHasRole(p,valid_roles)
  end

  # return true if person has one of supplied roles
  def self.personHasRole(p, valid_roles)
    if p.nil?
      return nil
    end
    matching_roles = p.roles.select {|r| valid_roles.include?(r.subrole_type)}
    return matching_roles.length > 0
  end

  def self.getPerson(current_user)
    chk_current_user!(current_user)
    current_user.person
  end

  def self.chk_current_user!(current_user)
    if current_user.nil? 
      raise CustomException.new("user not defined")
    end
    User.find_by!(id: current_user.id)
    return true
  end

  # register user
  def self.registerUser(email,password,name,lname,mobile,sex,addr1,addr2,dob)
    Rails.logger.error { "called registerUser with #{email},#{password},#{name} #{email}" }
    # validate email
    if User.find_by_email(email)
      raise CustomException.new("email is already registered")         
    end
    # validate password
    if (password.nil? || password.length <= 8)
      raise CustomException.new("password is empty or too short")         
    end
    # get patient role
    patient_subrole = PatientRole.first!()
    patient_role = Role.find_by!(subrole: patient_subrole)


    # create user
    name_val= name.to_s+' '+lname.to_s
    u = User.create! :name => name_val, :email => email, :password => password, :confirmed_at => Date.today()

    u.person.roles.append(patient_role)
    u.person.first_name=name
    u.person.last_name=lname
    u.person.phone_number_id = create_PhoneNumber(mobile,0)
    u.person.address_id=createAddress(addr1,addr2)
    u.person.sex=sex
    u.person.dob= DateTime.strptime(dob, "%Y-%m-%d")
    u.person.save!
    u.confirmation_token = SecureRandom.urlsafe_base64.to_s
    u.save!
    return true
  end

  def self.create_PhoneNumber(phone_number,ext)
    phone = PhoneNumber.create :phone_number_type_id => 1, :phone_number => phone_number, :extension => ext
    phone.save!
    phone_id = phone.id
    phone_id
  end

  def self.sendPasswordresetEmail(email)
     user=User.find_by_email(email)
     send_status=""
     if !user.blank?
      @send=UserMailer.welcome_email(user).deliver_later
      send_status="password reset link send to #{user.email.to_s} Please check your inbox " 
       else    
          send_status="email #{email.to_s} not registered with us"
      end
      send_status
   end
  def self.createAddress(address_line1,address_line2)

  addr=Address.create(:address_type => AddressType.find_by_description("Home"),
                                                :address_line1 => address_line1,
                                                :address_line2 => address_line2,
                                                :state => '',
                                                :iso_country_code => 'SL')
   addr.save!
   addr_id = addr.id
   addr_id

 end

 def self.create_blood_count_(current_user,reading)
   return_value=1
   begin
    now = DateTime.now() 
    day=Date.today.day.to_i
    month=Date.today.month.to_i
    reading = DailyReading.create :person_id => current_user.id.to_i, :reading => reading.to_s, :date_done => DateTime.new(now.year,month,day)
    reading.save!
    rescue => e 
      puts "rescue"+e.to_s
     return_value=0
   end
   return_value
 end

 def self.getDailyCount(current_user)
  now = DateTime.now()
  day=Date.today.day.to_i
  month=Date.today.month.to_i
  daily_readings_count=0
  daily_readings = DailyReading.where("person_id = ? AND date_done=?",current_user,DateTime.new(now.year,month,day))
  daily_readings.each do |daily_reading|
    daily_readings_count=daily_readings_count+1
  end
  daily_readings_count
  end 

  def self.getDailyReport(current_user)
   now = DateTime.now()
   day=Date.today.day.to_i
   total_reading=0
   daily_reading_array=[]
   month=Date.today.month.to_i
   daily_readings = DailyReading.where("person_id = ? AND date_done=?",current_user,DateTime.new(now.year,month,day))
   maxium_count=daily_readings.order("reading DESC").first
   minimum_count=daily_readings.order("reading").first
   daily_readings.each do |daily_reading|
    daily_reading_array.append Struct::BizLogicDailyReports.new(daily_reading,maxium_count.reading.to_i,minimum_count.reading.to_i)
    end
    daily_reading_array
  end

  def self.getMonthlyTodate(current_user,start_date,end_date)
   daily_reading_array=[]
   month_day_reports = DailyReading.where("date_done >= ? AND date_done<= ? AND person_id= ?",DateTime.new(start_date.year,start_date.month,start_date.day),DateTime.new(end_date.year,end_date.month,end_date.day),current_user.id.to_i)
   maxium_count=month_day_reports.order("reading DESC").first
   minimum_count=month_day_reports.order("reading").first
   month_day_reports.each do |month_day_report|
    daily_reading_array.append Struct::BizLogicDailyReports.new(month_day_report,maxium_count.reading.to_i,minimum_count.reading.to_i)
    end
    daily_reading_array
  end
  #EHANUBIZLOGIC.getDailyCount(current_user) 
  #EHANUBIZLOGIC.getMonthlyTodate(current_user,'2018-09-29')
end
