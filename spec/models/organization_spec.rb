require 'rails_helper'

describe Organization, type: :model do
  let!(:organization) { create(:organization, name: 'taken') }
  let!(:duplicate_name_org) { create(:organization, name: 'taken') }

  it 'should sequentially slug duplicates' do
    expect(duplicate_name_org.friendly_id).to eq('taken-2')
  end
end
