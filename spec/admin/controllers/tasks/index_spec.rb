require_relative '../../../../apps/admin/controllers/tasks/index'

RSpec.describe Admin::Controllers::Tasks::Index do
  let(:action) { described_class.new }
  let(:session) { { current_user: User.new(id: 1, admin: true) } }
  let(:params)  { { 'rack.session' => session } }

  it { expect(action.call(params)).to be_success }
end
