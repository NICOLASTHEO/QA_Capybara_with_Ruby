describe 'Select 2', :select2 do

    describe('single', :single) do 

        before (:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end
        it 'select actor by name' do
            find('.select2-container').click
            find('.select2-results__option', text: 'Adam Sandler').click
            
        end
        it 'search and click on the names actor' do
            find('.select2-container').click
            find('.select2-search__field').set 'Chris Rock'
            find('.select2-results__option').click
        end
    end

    describe('multiple', :mult) do
        
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
        end
        def select(actor)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set actor
            find('.select2-results__option').click          
        end
=begin    
        it 'select actor' do
            select('Adam Sandler')
            select('Owen Wilson')
=end        
        it 'select actor' do
            actors = ['Jim Carrey','Adam Sandler','Owen Wilson']

            actors.each do |a|  
                select(a)
            end
        end
    end
end