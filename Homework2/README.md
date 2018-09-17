Tip Calculator, Part 1

For this part of the assigment, we will be creating the UI for the tip calculator. All we are looking for is that when we run the project on a device it looks the same as the design. No functionality implementations yet. That will be next weeks homework.
You can view the design here: [Figma](https://www.figma.com/file/NaGJgDsXLxumHkaEjVGS44i3/Tip-Calculator?node-id=0%3A1).

![Imgur](https://i.imgur.com/8Sn6a3e.png)

Using what we've learned about constraints and multipliers, we can create the three views which will have colored backgrounds, and help us to arrange our subcomponents. Please create a new Xcode Project and work on the implementation there.

Tips:
* The input for the calculator found at the top view is a UITextField. This will allow us to actually edit the field.
* The tip buttons can be placed a certain distance away from each other but becareful with certain screen devices.(If you know how to use a stack view, this may be the better route!)
* For giving the buttons a border, remember what we did in class! We did this programatically by creating an outlet on the button, and then accessing its layer property. From here, we were able to set a border width, color, and corner radius.
* If a view/object looks horizontally/vertically centered in it's view it most likely is. Please use centered horizontal/vertical constraints rather than arbitrary top and bottom constraints that look like they are in the middle.

What to submit:
**IMPORTANT** Please run your project on the simulator devices. If we are not able to run the project due to bad/missing constraints we will have to deduct points.
Package this directory as a zip and then submit to the submit server.
We will be grading the .xcodeproj file
