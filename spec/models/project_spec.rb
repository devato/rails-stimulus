require 'rails_helper'

describe Project, type: :model do
  let!(:project) { create(:project, name: 'taken') }
  let!(:duplicate_name_project) { create(:project, name: 'taken') }

  it 'should sequentially slug duplicates' do
    expect(duplicate_name_project.friendly_id).to eq('taken-2')
  end
end
