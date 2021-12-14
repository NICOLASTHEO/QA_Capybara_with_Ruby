describe 'register and login page', :escopo, :smoke do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'access successful' do
        find('#usernameId').set 'stark'
        find('#passwordId').set 'jarvis!'
        click_button 'Entrar'

        expect(find("#flash")).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
#        puts find('#flash').text

        page.save_screenshot('log/login_com_sucesso.png')  #rodando o ruby será gerada automtcmnte a pasta LOG e dentro dela serão salvas as imagens.
    end
    it 'registration', :regis do
        signup_form = find('#signup')

        signup_form.find('input[name=username]').set 'nicolas'   #more elengant
        find('#signup').find('input[name=password]').set 'asdfg!' #it works but is ugly
        click_link 'Criar Conta'
 #       puts find('#result').text
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'

      #  page.save_screenshot('log/registro_de_usuario.png')
    end
    it 'registration within', :register do #other way to do the same thing above.
        within('#signup') do  #escope = information after escope will depends on Id inside de escope
            find('input[name=username]').set 'nicolas'
            find('input[name=password]').set 'asdfg!'
            click_link 'Criar Conta'
        end
#        puts find('#result').text
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    #    page.save_screenshot('log/registro_within.png')

    end
# PARA SCREENSHOT O IDEAL É CRIAR UM AFTER E CONFIG O SCREENSHOT
=begin
    after(:each) do |e|   # este 'e' representa os valores de cada it
        puts e.description
        nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')  #gsub criará uma substring (substituindo uma anterior por uma nova string); Esses simbolos: (/[^A-Za-z0-9 ]/, '') irão subtituir caractere especial por nda/null; e depois TR irá substituir os espaçoes em branco por underline
        puts nome
        page.save_screenshot('log/' + nome + '.png') if e.exception

    end
=end
end




#  rodar arquivo todo:    rspec spec/access_escopo_spec.rb
#  rodar por tag:         rspec --tag @escopo