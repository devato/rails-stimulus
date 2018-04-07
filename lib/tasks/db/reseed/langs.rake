namespace :db do
  namespace :reseed do
    desc 'Seed supported languages'
    task langs: :environment do
      ActiveRecord::Base.transaction do
        ActiveRecord::Base.connection.execute('TRUNCATE supported_languages RESTART IDENTITY CASCADE')
        %w[Rails Ruby JavaScript].each do |name|
          SupportedLanguage.where(name: name).first_or_create do |lang|
            lang.active = true
            lang.image = "#{name.downcase}.svg"
          end
        end
      end
    end
  end
end
