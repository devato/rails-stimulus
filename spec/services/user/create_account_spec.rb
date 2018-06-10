require 'rails_helper'

describe User::CreateAccount, type: :service do
  let(:new_user) { build(:user) }
  let(:signup_form) { Users::SignupForm.from_params() }

  # @signup_form = Users::SignupForm.from_params(params)
  # Users::CreateAccount.call(@signup_form) do
  #   on(:ok)      { redirect_back_or_to organization_home }
  #   on(:invalid) { render :new }
  # end
  # subject(:create) { described_class.ne }

  # describe ':after_create' do
  #   it 'should call :set_default_avatar' do
  #     expect(new_user).to receive(:set_default_avatar)
  #     new_user.save
  #   end
  #   it 'should set add an attachment' do
  #     expect { new_user.save }
  #       .to change { ActiveStorage::Attachment.count }.by(1)
  #   end
  #   it 'should set the attachment as missing.png' do
  #     new_user.save
  #     expect(new_user.reload.avatar.filename.base).to eq('missing')
  #   end
  # end

end
