
RSpec.describe "Card" do
    let(:card){ Card.new(1) }
    describe "testing a number" do
        it 'has a number' do 
            expect(card.number).to eq(1)  
        end  
    end  
end
