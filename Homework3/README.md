# Tip Calculator Part 2

For this part of the assigment, we will be finish off the implementation of the tip calculator. We are looking to see that when a user types an amount and either hits return or a tip percentage for the total amount label to update as accordingly. A video of a working demo can be found here. [YouTube](https://youtu.be/_tIYuO9cUxQ)

We will use what we've learned about IBOutlet, IBActions, Protocols, and Delegates in order to finish the implementation of the tip calculator. Please use your existing project that you made for part 1. If you are having design troubles with part 1 of the hw, please see us in office hours or email us in order to send you a working design copy.

## What To Do:
In this repository, you will find a sample ViewController.swift file. please use this as a template for your ViewController. As you can see from the viewcontroller file, we have already implemented the UITextFieldDelegate, and have already filled out the function for textFieldDidReturn. You will also notice a Double variable called tipAmount which will store a Double representing the tip percentage. For example 15% tip will be 0.15. You will not need to touch these. However, you will need to do the following:
1. Create and Complete 3 IBAction Functions that respond to tip button taps
* These IBActions will update the tipAmount variable to the correct amount and will call the function to recalculate the tip total.
* When a button has been tapped make it's background color green instead of black in order to look selected. Make sure that every other button that wasn't tapped still has their backgrounds as black. An example can be seen below: ![Imgur](https://i.imgur.com/sgKQ99f.png)
2. Complete the calculateTotal() function.
* This method will take the users input from the textfield and calculate the total amount after tip has been factored in. We have already provided the implementation to convert a String into a Double. Do not put a $ in the Bill amount field. It will not be able to convert it to a number. Make sure to change tipField to the name of the outlet assigned to your Textfield.
* You will then take the double from what the user typed in the bill amount and calculate the total amount.
* Lastly, You will need to set the totalAmount label to the total price you calculated. Make sure to add a $ in front of the amount. 

What to submit:
**IMPORTANT** Please run your project on the simulator devices. If we are not able to run the project due to bad/missing constraints we will have to deduct points.
Package this directory as a zip and then submit to the submit server.
We will be grading the .xcodeproj file
