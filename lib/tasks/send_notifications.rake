namespace :send_notifications do
  desc 'Send notification of due invoices'
  task due_invoices: :environment do
    users = User.all
    users.each do |user|
      find_invoices = user.installments.where(due_date: Date.today).where(status: 'unpaid')
      SendNotificationsMailer.send_invoices(user, find_invoices).deliver_now
    end
  end
end
