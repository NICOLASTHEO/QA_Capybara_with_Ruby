describe 'register and login page', :dinamicsId do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end
=begin

REGULAR EXPRESSION WITH   CSS SELECTOR
    $  => termina com
    ^  => começa com
    *  => contém
=end
    it 'register' do
        find('input[id$=UsernameInput]').set 'theo'
        find('input[id^=PasswordInput]').set '123456!'
        find('a[id*=GetStartedButton]').click

        expect(find("#result")).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        puts find('#result').text
    end
end