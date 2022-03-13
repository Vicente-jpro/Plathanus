require "./option2.rb"
RSpec.describe "Option2" do

let(:n) { Option2.new}

    describe "know numbers" do
        it "returns zero" do 
        n.current_number = 0 
        expect(n.get_number_name).to eq("zero")
        end

        it "return five" do 
        n.current_number = 5
        expect(n.get_number_name).to eq("five")
        end 

        it "returns thirteen" do 
        n.current_number = 13
        expect(n.get_number_name).to eq("thirteen")
        end

        it "returns fifteen" do 
            n.current_number = 15
            expect(n.get_number_name).to eq("fifteen")
        end 

        it "returns twenty" do
            n.current_number = 20 
            expect(n.get_number_name).to eq("twenty") 
        end

        it "returns hundred" do 
            n.current_number = 100
            expect(n.get_number_name).to eq("hundred")
        end

        it "returns hundred" do 
            n.current_number = 1000
            expect(n.get_number_name).to eq("thousand")
        end
    end

    describe "unknown numbers" do
        it "returns one thousand, one hundred and twenty eigth" do 
            n.current_number = 1128
            expect(n.get_number_name).to eq("one thousand, one hundred and twenty eigth")
        end

        it "returns one thousand, nine hundred and ninety five" do 
            n.current_number = 1995
            expect(n.get_number_name).to eq("one thousand, nine hundred and ninety five")
        end

        it "returns Invalid number" do 
            n.current_number = 2000
            expect(n.get_number_name).to eq("Invalid number")
        end
    end

    describe "validation interval numbers to use hash" do 
        it "return true if number between 0 and 19" do 
            n.current_number = 17
            expect(n.smallest_number?).to eq(true)
        end
        it "return true if number between 20 and 99" do 
            n.current_number = 21
            expect(n.small_number?).to eq(true)
        end
        it "return true if number between 100 and 999" do 
            n.current_number = 124
            expect(n.larg_number_hundred?).to eq(true)
        end
    end

end
