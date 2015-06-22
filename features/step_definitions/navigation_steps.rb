require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "env.rb"))

class AbstractPage
    attr_reader :url
    include Capybara::DSL
    def initialize()
        @selectors = { :css_alerts => 'div.alert > strong' }
    end
    
    def visit_page
        visit(@url)
    end
    
    def alerts
        element_strings(all(@selectors[:css_alerts]))
    end
    
    def element_strings(elems)
        elems.map do |elem|
            elem.text()
        end
    end
end

class DictionaryPage < AbstractPage
    def initialize()
        super()
        @url = "dictionary/index"
        @first_name = Faker::Name.first_name
        @last_name = Faker::Name.last_name
        @age = Faker::Number.number(2)
        @address = Faker::Address.street_address
        @city = Faker::Address.city
        @state = Faker::Address.state_abbr
        @zip_code = Faker::Address.zip
        @company = Faker::Company.name
        @email = Faker::Internet.email
        @job_title = Faker::Name.title
        @phone = Faker::PhoneNumber.phone_number
        @selectors = @selectors.merge({
            :dictionary_well_css => "div.well > p",
            :first_name_css => '//input[@id="dictionary_first_name"]',
            :last_name_css => '//input[@id="dictionary_last_name"]',
            :age_css => '//input[@id="dictionary_age"]',
            :address_css => '//input[@id="dictionary_address"]',
            :city_css => '//input[@id="dictionary_city"]',
            :state_css => '//input[@id="dictionary_state"]',
            :zip_code_css => '//input[@id="dictionary_zip_code"]',
            :company_css => '//input[@id="dictionary_company"]',
            :job_title_css => '//input[@id="dictionary_job_title"]',
            :email_css => '//input[@id="dictionary_email"]',
            :phone_css => '//input[@id="dictionary_phone"]',
            :submit_css => "form.new_dictionary > input[value='Add Person']"
        })
    end
    
    def getDictionary
        all(@selectors[:dictionary_well_css]).map do |person|
            person.text()
        end
    end
    
    def enter_first_name(name)
        puts "#{name.underline} entered at input #{@selectors[:first_name_css].underline}".colorize(:light_blue)
        find(@selectors[:first_name_css]).set(name)
    end
    def enter_fake_first_name()
        puts "#{@first_name.underline} entered at input #{@selectors[:first_name_css].underline}".colorize(:light_blue)
        find(:xpath, (@selectors[:first_name_css])).set(@first_name)
    end
    
   # def enter_last_name(name)
    #    find(@selectors[:last_name_css]).set(name)
   # end
    def enter_last_name()
        puts "#{@last_name.underline} entered at input #{@selectors[:last_name_css].underline}".colorize(:light_blue)
        find(@selectors[:last_name_css]).set(@last_name)
    end
    
    #def enter_age(age)
    #    find(@selectors[:age_css]).set(age)
    #end
    def enter_age()
        puts "#{@age.underline} entered at input #{@selectors[:age_css].underline}".colorize(:light_blue)
        find(@selectors[:age_css]).set(@age)
    end
    
    #def enter_address(address)
    #    find(@selectors[:address_css]).set(address)
   # end
    def enter_address()
        puts "#{@address.underline} entered at input #{@selectors[:address_css].underline}".colorize(:light_blue)
        find(@selectors[:address_css]).set(@address)
    end
    
   # def enter_city(city)
    #    find(@selectors[:city_css]).set(city)
   # end
    def enter_city()
        puts "#{@city.underline} entered at input #{@selectors[:city_css].underline}".colorize(:light_blue)
        find(@selectors[:city_css]).set(@city)
    end
    
   # def enter_state(state)
     #   find(@selectors[:state_css]).set(state)
   # end
    def enter_state()
        puts "#{@state.underline} entered at input #{@selectors[:state_css].underline}".colorize(:light_blue)
        find(@selectors[:state_css]).set(@state)
    end
    
    #def enter_zip_code(zip_code)
     #   find(@selectors[:zip_code_css]).set(zip_code)
    #end
    def enter_zip_code()
        puts "#{@zip_code.underline} entered at input #{@selectors[:zip_code_css].underline}".colorize(:light_blue)
        find(@selectors[:zip_code_css]).set(@zip_code)
    end
    
    #def enter_company(company)
    #    find(@selectors[:company_css]).set(company)
    #end
    def enter_company()
        puts "#{@company.underline} entered at input #{@selectors[:company_css].underline}".colorize(:light_blue)
        find(@selectors[:company_css]).set(@company)
    end
    
   def enter_email(email)
       puts "#{email.underline} entered at input #{@selectors[:email_css].underline}".colorize(:light_blue)
       find(@selectors[:email_css]).set(email)
   end
    def enter_fake_email()
        puts "#{@email.underline} entered at input #{@selectors[:email_css].underline}".colorize(:light_blue)
        find(@selectors[:email_css]).set(@email)
    end
    
    #def enter_job_title(job_title)
    #    find(@selectors[:job_title_css]).set(job_title)
    #end
    def enter_job_title()
        puts "#{@job_title.underline} entered at input #{@selectors[:job_title_css].underline}".colorize(:light_blue)
        find(@selectors[:job_title_css]).set(@job_title)
    end
    
    #def enter_phone(phone)
   #     find(@selectors[:phone_css]).set(phone)
   # end
    def enter_phone()
        puts "#{@phone.underline} entered at input #{@selectors[:phone_css].underline}".colorize(:light_blue)
        find(@selectors[:phone_css]).set(@phone)
    end
    
    def submit_information()
        puts "***SUBMITTING INFORMATION***".colorize(:color => :red, :background => :yellow)
        find(@selectors[:submit_css]).click()
    end
    
    def add_fake_person()
        enter_fake_first_name()
        enter_last_name()
        enter_age()
        enter_address()
        enter_city()
        enter_state()
        enter_zip_code()
        enter_company()
        enter_fake_email()
        enter_job_title()
        enter_phone()
        submit_information()
    end
    
    def add_person(name)
        enter_first_name(name)
        enter_last_name()
        enter_age()
        enter_address()
        enter_city()
        enter_state()
        enter_zip_code()
        enter_company()
        enter_email()
        enter_job_title()
        enter_phone()
        submit_information()
    end
    
    def findPerson()
        allPeople = getDictionary()
        allPeople.each do |person|
            if person.include?(@first_name) && person.include?(@last_name) && person.include?(@age) && person.include?(@address)
                return true
            end
        end
        reutrn false
    end
            
end

Given /^I am on the index page$/i do
    hash = {"index" => DictionaryPage.new}
    @page = hash["index".downcase]
    @page.visit_page()
end

When /^I submit the personal information$/i do
    @page.add_fake_person()
end

When /^I submit invalid personal information$/i do
    @page.enter_first_name("")
    @page.enter_last_name()
    @page.enter_age()
    @page.enter_address()
    @page.enter_city()
    @page.enter_state()
    @page.enter_zip_code()
    @page.enter_company()
    @page.enter_email("thomasATmail.umw.edu")
    @page.enter_job_title()
    @page.enter_phone()
    @page.submit_information()
end

Then /^I should see a success message$/i do
    expect(@page.alerts).to include("Person added successfully")
end

Then /^I should see my information on the page$/i do
    expect(@page.findPerson()).to eq(true)
end

Then /^I should see an error message$/i do
    expect(@page.alerts).to include("Error: Email must include '@'")
end