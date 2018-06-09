require 'rails_helper'

describe UserDecorator, type: :decorator do

  let!(:user) { create(:user) }

  describe '.avatar' do
    subject(:avatar) { described_class.new(user).avatar }

    context 'When user has default avatar attached' do
      it 'should return missing.png' do
        expect(avatar.filename.base).to eq('missing')
      end
    end
    context 'When user has avatar attached' do
      before do
        user.avatar.attach(io: File.open(file_fixture('avatar.jpg')),
                           filename: 'something.jpg',
                           content_type: 'image/jpg')
      end
      it 'should return the filename' do
        expect(avatar.filename.base).to eq('something')
      end
    end
  end

end
