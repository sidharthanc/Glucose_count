class PatientController < ApplicationController
  def patient_home
   @daily_count=EHANUBIZLOGIC.getDailyCount(current_user)
  end
  def daily_report
  @daily_report=EHANUBIZLOGIC.getDailyReport(current_user)
  end

  def monthto_date
  	dateval=params[:date_val].to_s
    puts "dateval"+dateval.to_s
  	date_val=dateval.to_s+'-'
    date_val=date_val.split('-')
    daily_reading_array=[]
    day_of_month=date_val[0].to_s+date_val[1].to_s+'1'
    start_date = Date.parse(day_of_month)
    end_date = Date.parse(dateval)
    @monthto_date=EHANUBIZLOGIC.getMonthlyTodate(current_user,start_date,end_date)
  end

  def monthly_report
  now = DateTime.now()
  day=Date.today.day.to_i
  month=Date.today.month.to_i
  start_date=DateTime.new(now.year,month,day)-(30.days)
  end_date=DateTime.new(now.year,month,day)
  puts "start_date"+start_date.to_s
  puts "end_date"+end_date.to_s
  @monthto_date=EHANUBIZLOGIC.getMonthlyTodate(current_user,start_date,end_date)
  end
end
