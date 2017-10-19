require 'rails_helper'

RSpec.describe Position, type: :model do
  def valid_params(opts = {})
    {
      user_id:  user.id       ,
      offer_id: boff.id
    }.merge(opts)
  end

  let(:klas)    { described_class                              }
  subject       { klas.new(valid_params)                       }

  let(:user)    { FG.create(:user).user                        }
  let(:boff)    { FG.create(:buy_bid, user_id: user.id).offer  }
  let(:pos1)    { klas.new(valid_params)                       }

  describe "Associations", USE_VCR do
    it { should respond_to(:buy_offer)            }
    it { should respond_to(:sell_offers)          }
    it { should respond_to(:parent)               }
    it { should respond_to(:children)             }
    it { should respond_to(:user)                 }
    it { should respond_to(:escrow)               }
  end

  describe "Object Creation", USE_VCR do
    it { should be_valid }

    it 'saves the object to the database' do
      subject.save
      expect(subject).to be_valid
    end
  end

  describe "Associations", USE_VCR do
    before(:each) do hydrate(pos1) end

    it "finds the user" do
      expect(pos1.user).to eq(user)
    end

    it "finds the offer" do
      expect(pos1.buy_offer).to eq(boff)
    end
  end
end

# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  user_id    :integer
#  escrow_id  :integer
#  parent_id  :integer
#  volume     :integer
#  price      :float
#  side       :string
#  exref      :string
#  uuref      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
