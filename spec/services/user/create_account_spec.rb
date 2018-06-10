require 'rails_helper'

describe User::CreateAccount, type: :service do
  let(:new_user) { build(:user) }
  let(:signup_form) {
    User::SignupForm.from_params({
      signup: {
        name: 'Test Johnson',
        email: 'test@johnson.com',
        password: 'password',
        password_confirmation: 'password',
        organization_name: 'Test Org',
        terms: 1
      }
    })
  }

  subject(:create_user) { described_class.call(signup_form) }

  describe '.call' do
    it 'should add an attachment' do
      expect { create_user }
        .to change { ActiveStorage::Attachment.count }.by(1)
    end
    it 'should set the avatar attachment as missing.png' do
      create_user
      expect(User.last.avatar.filename.base).to eq('missing')
    end

    it 'should create default settings' do
      expect { create_user }
        .to change { User::Setting.count }.by(1)
    end
  end

end
