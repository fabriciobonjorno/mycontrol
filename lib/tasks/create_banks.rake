# frozen_string_literal: true

namespace :create_banks do
  desc 'Create banks'
  task create: :environment do
    logger = ActiveSupport::Logger.new("log/#{Time.current.strftime('%d%m%Y')}_import_banks.log")
    logger.info('m=ImportBanks status=initial imported_quantity=0')

    response = Rails.env.production? ? HTTParty.get('https://mycontrol.fly.dev/banks.json') : HTTParty.get('http://localhost:3000/banks.json')
    banks = JSON.parse(response&.body || '{}')

    logger.info('m=BanksPersistence status=initial')

    ActiveRecord::Base.transaction do
      reportable = IntegrationClientReporter
      imported_banks_ids = []

      banks.each do |bank|
        next if Bank.where(number: bank['COMPE']).exists?

        bank_create = Bank.find_or_create_by!(
          number: bank['COMPE'],
          name: bank['ShortName']
        )
        reportable.create!(reportable_type: 'Bank', reportable_id: bank_create.id,
                           message: "ImportedBanks nº #{bank_create.id}", success: true)
        imported_banks_ids << bank_create.id
      end
      logger.info("m=ImportedBanks status=finished imported_quantity=#{imported_banks_ids.size}")
    end
  end
end
