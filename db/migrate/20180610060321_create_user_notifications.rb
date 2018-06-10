class CreateUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notifications, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true
      t.boolean :project_alerts
      t.boolean :weekly_reports
      t.string :deploy_notifications
      t.boolean :my_activity

      t.timestamps
    end
  end
end
