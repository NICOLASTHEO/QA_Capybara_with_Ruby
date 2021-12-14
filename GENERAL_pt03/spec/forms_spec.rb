describe 'Forms', :formsresize, :smoke do 

    before(:each) do
        page.current_window.resize_to(1280,800)
    end
   
    it 'login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
       

        fill_in 'userId', with: 'stark'   #serach elements by ID is faster.
        fill_in 'password', with: 'jarvis!'

        click_button "Login"

        expect(find('#flash').visible?).to be true
       #expect(find('#flash').to eql 'Olá, Tony Stark. Você acessou a área logada!' --> In console the sentences are different. In this case it'll give an ERROR.
        expect(find("#flash").text).to include 'Olá, Tony Stark. Você acessou a área logada!' #1 case, if there is the sentence, include compare with #fash
        expect(find("#flash")).to have_content 'Olá, Tony Stark. Você acessou a área logada!' #2 case, if there is a string content inside #fash ...-> I think it's better.
    end

end