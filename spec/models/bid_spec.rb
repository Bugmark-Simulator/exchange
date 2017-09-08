require 'rails_helper'

RSpec.describe Bid, type: :model do

  def valid_params(user)
    {
      user_id: user.id
    }
  end

  let(:klas)   { described_class                            }
  let(:user)   { FG.create(:user)                           }
  subject      { klas.new(valid_params(user))               }

  describe "Attributes" do
    it { should respond_to :exref                  }
    it { should respond_to :uuref                  }  
  end

  describe "#uuref" do
    it 'generates a string' do
      subject.save
      expect(subject.uuref).to be_a(String)
    end #

    it 'generates a 36-character string' do
      subject.save
      expect(subject.uuref.length).to eq(36)
    end
  end

  describe "Associations" do
    it { should respond_to(:user)         }
    it { should respond_to(:repo)         }
    it { should respond_to(:contract)     }
  end

  describe "Object Creation" do
    it { should be_valid }

    it 'saves the object to the database' do
      subject.save
      expect(subject).to be_valid
    end
  end

  describe "Scopes" do
    it 'has scope methods' do
      expect(klas).to respond_to :base_scope
      expect(klas).to respond_to :by_id
      expect(klas).to respond_to :by_repoid
      expect(klas).to respond_to :by_title
      expect(klas).to respond_to :by_status
      expect(klas).to respond_to :by_labels
    end
  end

  describe ".by_id" do
    before(:each) { subject.save}

    it 'returns a matching record' do
      expect(klas.by_id(subject.id).count).to eq(1)
    end
  end

  describe ".cross" do
    before(:each) { subject.save}

    it 'crosses id' do
      expect(subject).to_not be_nil
      expect(klas.count).to eq(1)
      expect(klas.cross({id: subject.id}).length).to eq(1)
    end
  end

end

# == Schema Information
#
# Table name: bugs
#
#  id          :integer          not null, primary key
#  repo_id     :integer
#  type        :string
#  title       :string
#  description :string
#  status      :string
#  labels      :text             default([]), is an Array
#  xfields     :hstore           not null
#  jfields     :jsonb            not null
#  synced_at   :datetime
#  exref       :string
#  uuref       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
