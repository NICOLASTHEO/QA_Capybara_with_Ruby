describe "iframes", :rodiframe do

    describe 'good iframe', :nice do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end
        it 'adicinar ao carrinho' do
            within_frame('burgerId') do
                produto=find('.menu-item-info-box-content',text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'

            end
        end
    end
    describe 'bad iframe', :bad do    #em regra o Capybara só aceita ID e NAME, o bad_iframe só tem uma classe, vai dar errado.
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end
        it 'carrinho deve estar vazio' do   #devemos criar um ID temporário.
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end