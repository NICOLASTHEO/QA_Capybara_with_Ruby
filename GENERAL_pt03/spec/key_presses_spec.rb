describe 'keyboard', :key do
  
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/key_presses'
    end
    it 'sending keys', :space do
        find('#campo-id').send_keys :space
        expect(page).to have_content 'You entered: SPACE'
    end
    it 'sending keys', :tab do
        find('#campo-id').send_keys :tab
        expect(page).to have_content 'You entered: TAB'
    end
    it 'symbols', :sym do
        teclas = %i[tab space escape enter shift control alt]   # use % i for symblos and W for letters

        teclas.each do |t|

        find('#campo-id').send_keys t
        expect(page).to have_content 'You entered: '+t.to_s.upcase
        sleep 1
        end
    end
    it 'send letters', :letters do
        letters = %w[h e l l o w o r l d]  # use W for letters and i for symblos 
        letters.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content 'You entered: '+l.to_s.upcase
        end     
    end
end