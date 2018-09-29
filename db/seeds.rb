
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create roles
patient_role =      Role.create(subrole: PatientRole.create(),route_path:'patient')
doctor_role =      Role.create(subrole: DoctorRole.create(),route_path:'doctor')

# Create Pharmacies
PhoneNumberType.create :description => 'Mobile'
PhoneNumberType.create :description => 'Home'
PhoneNumberType.create :description => 'Work'
PhoneNumberType.create :description => 'Fax'
PhoneNumberType.create :description => 'Pager'


AddressType.create :description => 'Home'
AddressType.create :description => 'Work'


Salutation.create :salutation => 'Mr.'
Salutation.create :salutation => 'Dr.'
Salutation.create :salutation => 'Mrs.'
Salutation.create :salutation => 'Ms.'
Salutation.create :salutation => 'Prof.'
Salutation.create :salutation => 'Rev.'


# Reasons for prescribing_reason
#reason_for_prescribings = [
#  'acne',
#  'ADHD',
#  'AIDS/HIV',
#  'anxiety',
#  'allergies',
#  'arthritis',
#  'asthma',
#  'bipolar disorder',
#  'bronchitis',
#  'cancer',
#  'cholesterol',
#  'colds and flu',
#  'constipation',
#  'COPD',
#  'depression',
#  'diabetes (Type 1)',
#  'diabetes (Type 2)',
#  'diarrhea',
#  'eczema',
#  'erectile disfunction',
#  'fibromyalgia',
#  'flu',
#  'gastrointestinal health',
#  'GERD (heartburn)',
#  'glaucoma',
#  'hair loss',
#  'hayfever',
#  'heart disease',
#  'hepatitis A',
#  'hepatitis B',
#  'herpes',
#  'hypertension',
#  'hypothyroidism',
#  'incontinence',
#  'IBD (bowel)',
#  'insomnia',
#  'malaria',
#  'menopause',
#  'mental health',
#  'migraine',
#  'osteoarthritis',
#  'osteoperosis',
#  'pain',
#  'psoriasis',
#  'rheumatoid arthritis',
#  'schizophrenia',
#  'seizures',
#  'sexual health',
#  'skin conditions',
#  'stroke',
#  'swine flu',
#  'thyroid conditions',
#  'UTI',
#  'viruses',
#  'vitamins',
#  'weight loss'
#]
#reason_for_prescribings.each do | reason|
#  u = ReasonForPrescribing.create :prescribing_reason => reason
#end


# Create an Admin User

# create a Doctor user
#doctor_role =      Role.create(subrole: DoctorRole.create())
u = User.create :name => "Elmo Fernando", :email => "elmo@ontash.net", :password => "elmopassword", :confirmed_at => Date.today(),:person => Person.create(:phone_number => PhoneNumber.create(:phone_number_type => PhoneNumberType.find_by_description("Mobile"),
                                                                                                                                                                                                                                   :phone_number => '9605116467'))
u.person.roles.append(doctor_role)
p = u.person
p.save
elmo_doctor = u



# create patients for this Doctor
patients =  [
    ["Ajay", "Geojose","ajay@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sathya.jpeg","1"],
    ["Sidharthan" , "Sidhu" , "sidharthan@ontash.net","9605116467","M","01/29/1993","9288955631","vishnupuram house","hanuman temple road","Karivellur","Kerala","IND","Niduvapuram Road","Road Villa","","","sidhu.jpg","91"],
    ["Simeon" , "Smith" , "anand@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Stanford" , "Taylor" , "sarang@otash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Stanley" , "Davies" ,"vishnu@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Stephan" , "Allen" ,"pradosh@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Steve" , "Richards" ,"babeesh@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Sara" , "Parker" ,"aswani@ontash.net","2012333593","F","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Sidharthan" , "chuvatta" ,"sidharthan564@gmail.com","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Alfie","Williams" , "nibin@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Aaron","Smith" , "Aaron@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Andrew","Roberts" , "sangeeth@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Alex","Gilchrist" , "ali@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Alexandra","A" , "anjal@ontash.net","2012333593","M","11/26/1950","2012950152","7002 Boulevard E","Apt 29B","Guttenberg","New Jersey","USA","7000 Boulevard E","Suite M3","","","sample_profile_image.jpg","1"],
    ["Vishnu" , "Das" , "vishnudas707@gmail.com","9400460861","M","11/26/1992","9288955631","Veena nivas","Palace Road","Payyanur","Kerala","IND"," Parliament Street","Mavoor Road","","","sample_profile_image.jpg","91"],
    ["Neeraj" , "Madhav" , "sudip@ontash.net","9288955631","M","11/01/1989","9947118216","A39/91 Konia","Flt 28C","Mysure","Karnataka","IND","Dak Bhavan","PNB Building","","","man1.jpg","91"],
    ["Bibin" , "George" ,"bibin@ontash.net","9747349415","M","11/26/1988","9605116467","11/15 Premjyothi","Flt 30B","Marthahalli","Karnataka","IND","PNB Building","4th Floor 5 Wallace Street","","","images.jpeg","91"],
    ["Aswini" , "Mangalasery" ,"aswini@ontash.net","9745933009","F","11/04/1975","9605116467","#3A Abhijit Annexe","Street no21","Kohinoor","Karnataka","IND","A39/91 kernia","Room No C:295","","","Passport-Size_Anuradha.jpg","91"],
    ["Jacqueline" , "Fernandez" ,"Jacqueline@gmail.com","9947788435","F","11/28/1990","9605116467","Triveni Apartments","Flt 40C","Kalapani","Karnataka","IND","11/15 Premjyothi","Palayam","","","jack.jpg","91"],
    ["Silpa" , "MS" ,"silpa@ontash.net","9633781170","F","11/05/1985","8111902413","11/14 ParliamentStreet","Bank Road","Bangalore","Karnataka","IND","7008 Boulevard E","Flt 40B","","","beena.jpeg","91"],
    ["Aishwarya" , "Mohan" ,"silpams@gmail.com","9526697276","F","11/26/1991","9288955631","Jyothi bhavan","Flt 20B","Indiranagar","Karnataka","IND","#5A Abhijit Annexe","Street no 20","","","deepa madathil.jpg","91"],
    ["Vimala","Raman" , "vimala@gmail.com","9746207437","F","11/26/1970","8111902413","555 BaileyAve","Mavunkal Road","Mahabalipuram","Karnataka","IND","Vamanapuram","Flt 20B","","","images_girl.jpeg","91"],
    ["Shehani","Thilakarathne","shehani@gmail.com","0776694517","F","02/17/1985","0776694517","2B","Hirimbura Road","","Galle","SL","","","","","sample_profile_image.jpg","94"],
    ["Kalpani","Silva","kalpani@gmail.com","0776694517","F","08/16/1988","0776694517","No 21","New Deviation","Uyana","Moratuwa","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Hansika","Williams","hansika@gmail.com","0776694517","F","02/12/1972","0776694517","101","Vinayalankara Mawatha","","Colombo","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Ann","Maria","ann@gmail.com","0776694517","F","05/22/1989","0776694517","61/1","Piriwena Road","Alubomula","Panadura","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Shermin","Fernando","shermin@ontash.net","0776694517","M","11/05/1988","","402/1","Old Road","Kottawa","Pannipitiya","SL","","","","","sample_profile_image.jpg","94"],
    ["Dinesh","Maduranga","dinesh@gmail.com","0776694517","M","08/21/1992","0776694517","45B/1","Akuressa Road","Bogahagoda","Galle","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Thushara","Perera","thushara@gmail.com","0776694517","M","09/15/1980","0776694517","16 A","Gamini Mawatha","","Galle","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Rehan","Soyza","rehan@gmail.com","0777363205","M","03/17/1981","0776694517","606","Bungalow Junction","Pita Kotte","Sri Jayawardenepura Kotte","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Lakshan","Wijesooriya","lakshan@gmail.com","7766994517","M","12/13/1987","0776694517","376","High Level Road","Gangodawilla","Nugegoda","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],
    ["Gihan","Dias","gihan@gmail.com","0771069088","M","06/16/1983","0776694517","No.33","Wijerama Mawatha","","Colombo","SL","103/12","Dharmapala Mawatha","","Colombo","sample_profile_image.jpg","94"],







]


AvatarUploader.enable_processing = true
patients.each do |first,last,email,mobile,sex,dob,alt_phno,address_line1,address_line2,city,state,isocode,alt_addr1,alt_addr2,alt_city,alt_state,image,phone_country_code|
  p = Patient.create :first_name => first, :last_name => last, :email => email, :doctor => elmo_doctor.person,
                     :sex => sex, :dob => DateTime.strptime(dob, "%m/%d/%Y"),
                     :phone_number => PhoneNumber.create(:phone_number_type => PhoneNumberType.find_by_description("Mobile"),
                                                         :phone_number => mobile),
                     :address => Address.create(:address_type => AddressType.find_by_description("Home"),
                                                :address_line1 => address_line1,
                                                :address_line2 => address_line2,
                                                :state => state,
                                                :iso_country_code => isocode)

 
    p.save
  #create new persons
  name_full=first.to_s+' '+last.to_s
  u = User.create :name => name_full, :email => email, :password => 'test_password', :confirmed_at => Date.today()
      u.person.roles.append(patient_role)
      u.person.address = Address.create(:address_line1 => address_line1,:address_line2 => address_line2,:state=>state,:iso_country_code=>isocode)
      u.person.phone_number=PhoneNumber.create(:phone_number_type => PhoneNumberType.find_by_description("Mobile"),
                                                               :phone_number => mobile)
      u.person.dob= DateTime.strptime(dob, "%m/%d/%Y")

        u.person.save
 end


# create a Patient user
 u = User.create :name => "Sathya Kumar ", :email => "skumar@ontash.net", :password => "sathyapassword", :confirmed_at => Date.today()
  u.person.roles.append(patient_role)
      u.person.address = Address.create(:address_line1 => '103/12',:address_line2 => 'Dharmapala Mawatha',:state=>'Colombo',:iso_country_code=>'SL')
      u.person.phone_number=PhoneNumber.create(:phone_number_type => PhoneNumberType.find_by_description("Mobile"),
                                                               :phone_number => '9605116467')
      u.person.dob= DateTime.strptime("01/29/1993", "%m/%d/%Y")
      u.person.save!



