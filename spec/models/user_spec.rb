require 'rails_helper'

describe User, type: :model do

  let(:new_user) { build(:user) }

  describe ':after_create' do
    it 'should call :set_default_avatar' do
      expect(new_user).to receive(:set_default_avatar)
      new_user.save
    end
    it 'should set add an attachment' do
      expect { new_user.save }
        .to change { ActiveStorage::Attachment.count }.by(1)
    end
    it 'should set the attachment as missing.png' do
      new_user.save
      expect(new_user.reload.avatar.filename.base).to eq('missing')
    end
  end


end
