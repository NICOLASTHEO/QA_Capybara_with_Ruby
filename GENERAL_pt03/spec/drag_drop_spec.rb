describe 'Drag and Drop', :drop do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end
    
    it 'homem pertence time Stark' do
        stark = find('.team-stark .column')   
        cap = find('.team-cap .column') 

        spider = find('img[alt*=Aranha')
        spider.drag_to stark

        expect(stark).to have_css 'img[alt*=Aranha'
        expect(cap).not_to have_css 'img[alt*=Aranha'
        
    end
end
