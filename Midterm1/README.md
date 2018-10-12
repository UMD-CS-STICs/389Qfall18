# Midterm 1

## Option 1: Make your own project

Create your own app (i.e. a game, fitness app, weather app, stock prices). We are looking to see if you can apply what we've learned about each topic in class, to your app. So note: Your app in no way needs to be fully functional! You will have the opportunity to finish and pollish your app for the final project.

**Rubric:**

 Points | Topic 
 --- | ---
 20 | Navigation 
 20 | IBOutlets & IBActions 
 20 | Complex Component
 30 | Layout Constraints 
 10 | Good Architecture 

**Extra Credit:**

 Points | Topic 
 --- | ---
 10 | Creativity 
 10 | Networking 

**Navigation:** Uses a navigation controller. There is at least two view controllers in the project, with at least 1 segue.

**IBOutlets & IBActions:** An IBOutlet is used. This means that somewhere in our code, we access or modify a UI element that was defined in storyboard. An IBAction is used. This means that we've linked an action from a UI element in our storyboard, that fires a piece of code defined in our view controller.

**Complex Component:** Use of at least one complex UI component, like the Table View we've learned in class, or a Collection View. There is at least one prototype cell in the table view. A custom cell class is not necessary, but if your layout requires one, then use it!

**Layout Constraints:** The app correctly scales on all mobile devices.

**Good Architecture:** Correctly follows MVC. If a new data type is required (i.e. a class, enum, or struct) define it in a separate swift file, and not in the view controller.

**Creativity**

**Networking:** At least one GET or POST request.

## Option 2: Twitter project

We will be creating a mock Twitter thread that (*bonus! Will point to a central message board for the class). We've also left a couple of funny tweets in the project ;).

[Figma](https://www.figma.com/file/LcFq5sePmjT62zaMNgPkeqJA/Twitter-Design?node-id=0%3A1)

[Video](https://www.youtube.com/watch?v=PSnroq7RpkQ&feature=youtu.be)

**Rubric:**

Points | Topic 
--- | ---
10 | Navigation 
20 | IBOutlets & IBActions 
20 | Complex Component
30 | Layout Constraints 
20 | Protocols & Delegates

**Extra Credit:**

Points | Topic 
--- | ---
20 | Networking 

**Navigation:** Creates the segue to display the NewTweetVC. Uses the 'prepare' function.

**IBOutlets & IBActions:** Adding IBActions and IBOutlets in the Login VC and the Main VC. 

**Complex Component:** Creates custom Table View Cell class, and the table view is implemented correctly.

**Layout Constraints:** The Login screen, and the Table View Cell layouts are scalable on mobile devices.

**Protocol & Delegate:** TextFieldDelegate in the Login VC. Also creates your own protocol & delegate to add a new tweet in the Main VC. 

**Networking:** Does a GET to populate the tweets data. Upon adding a tweet, it does a POST to the server. The URL of the server is- https://tweets-b9ac.restdb.io/rest/tweets and the API key we will be using is- 73f92c8c0b35521d8f443b582b0703613f77f
