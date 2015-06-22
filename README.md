<h1>The People Dictionary</h1>
This is a simple ruby on rails application that allows users to enter people's information into the database where it will then be displayed in the table below the form.

<h2>Rails Directories and Configurations</h2>
All controller files are located under the <b>/app/controllers/ directory</b>. The main controller file for this application is <b>tweets_controller.rb</b>. All view files are located under the <b>/app/views/tweets/</b> directory but the application.html.erb overall layout is located under the <b>/app/views/layout/</b> directory. My model is located in the <b>/app/models/</b> directory as the file tweet.rb.

<h2>Cucumber Testing</h2>
This is a simple rails application that can be utilized to write simple cucumber tests. There are three sample tests written right now, which are located within the <b>/features/add.feature</b> file. The steps within this file are the Cucumber, or high level steps for Cucumber Testing. They are in the form of Gherkin syntax which relies on the idea of <b>Given, When, Then</b> keywords for writing the steps. The code behind the high level Cucumber steps likes in the <b>/features/step_definitions/navigation_steps.rb</b> file. This is a ruby file that uses regular expressions to capture the gherkin syntax in the Cucumber feature file, and use this to start the actual testing process. In my code, I utilize page objects that are essentially classes that function as each page that is used throughout the UI and testing process. For example, I have a super class AbstractPage which includes the general methods and instance variables that any page could have. From here, my DictionaryPage class inherits from AbstractPage defining the more specific methods and variables that are necessary to test this application. 
To run tests on this application simply use the following commands from the command line:
```
rake
```
or 
```
cucumber /features/add.feature
```

<h2>Cloud 9</h2>
If you are using the cloud service Cloud 9, the following command will deploy your rails application to the address 
<b>"http://peopledictionary-yourCloud9UserName.c9.io/dictionary/index</b>
```
rails s -p $PORT -b $IP
```
If you've never heard of Cloud 9, you can check it out <a href="https://c9.io">here</a>. It is great for application development in the cloud, coming with customizations for many different framework and language configurations, and even allowing for application deployment within the cloud.
