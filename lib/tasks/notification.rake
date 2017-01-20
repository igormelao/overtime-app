namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.sunday? 
      employees = Employee.all
      # 4. Send a message that has instructions and a link to log time
      employees.all.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: "Hi")
      end
    end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      byebug
      admin_users.each do |admin|
        byebug
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end
