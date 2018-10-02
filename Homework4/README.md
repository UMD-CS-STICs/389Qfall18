# Task Manager

Check out this [video](https://youtu.be/WiymScIjr08) to see how the app should function. We will use what we learned about tableview, creating custom table cells, protocols & delegates, and segues. By the end of this assignment, we will have a simple Task Manager application.
If you are having trouble with this assignment, this [video](https://l.facebook.com/l.php?u=https%3A%2F%2Fyoutu.be%2FFtO5QT2D_H8&h=AT1DhHWp_wOR2i1R7JPRqtZe14Du4HhhsZoTUYTXoWkeeGwiXbztryAgx1nflwzKZRM1cJ1ngCgAsv4nFsGYkPoQ8BsWIk7ZG9cymWfZNllvX1wPrGhGoe7dFyNRqVPM_LUSslAZfNM) helps with understanding TableView and creating custom cells. Our Panopto recording also goes over tableview, segues, and protocols & delegates.

## What to do:

We have already included a ViewController that conforms to the UITableViewDelegate, and UITableViewDataSource protocols, and has a TableView component inside. We have also included a Task class, where this models the data of a task. 
One task, will be displayed in one tableview cell. It can be one of three categories (as defined in the Categories enum in the Task file)- Math, Science, and English.

For Regular Credit:
1. Create the layout for the tableview cell- [design](https://www.figma.com/file/PAVbt1sKIGChC8qzbjKa7smC/Task-Cell?node-id=0%3A1). 
2. Make the custom tableview cell class (Tip: make sure you add the classname and reuse identifier in storyboard)
3. Implement the delegate functions, to make the tableview return the predefined list of 5 tasks, and display your custom view cells. Based on the task category, display a different colored 'marker' on the left of the cell. Math is red, Science is green, and English is blue. 

For Extra Credit:

Now, our app can display a list of tasks from our tasks array. But, we cannot add new tasks. This is what we will implement in this section.
We've included an AddTaskVC, where this will be the view to use to create new tasks.

1. Upon clicking on the '+' button, segue to the second view controller (don't forget to add the identifier!)
2. Protocols + delegates: Create a protocol with a function for adding tasks, and conform to the protocol we created, so that we can update the tasks array with data sent from the second view controller. (Hint: This means the tableview controller should conform to the protocol we create, and update the tasks array with our new entry, and reloadData(). Make sure to set the delegate in our second view controller as well, by assigning it in the 'prepare' function in the tableview controller)

## What to submit:
Package this directory as a zip and then submit to the submit server.
It will be due at the end of day Friday.
We will be grading the .xcodeproj file
