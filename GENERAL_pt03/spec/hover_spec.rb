describe 'Mouse Hover', :hover do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'
    end

    it 'quando passo o mouse sobre o blade', :blade do
        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o pantera negra', :panter do
        card=find('img[alt="Pantera Negra"]')   #se temos espaços ou caracteres especiais no nome da imagem, deve colocar entre ASPAS DUPLAS.
       #card=find('img[alt^=Pantera]') # uso de expressão regular. ^= começa com ....
       #card-find('img[alt$=Negra]')   # uso de expresão regular. $ = termina com ...
       #card-find('img[alt*=Negra]')   #uso de expressão regular. * = contém ....
        
        
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o homem-aranha' do
        card=find('img[alt="Homem Aranha"]')
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end
end
# to run the tests: rspec --tag @hover