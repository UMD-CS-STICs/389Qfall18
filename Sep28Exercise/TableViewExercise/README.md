We will be implementing a basic ToDo app, and learning about creating TableViews, custom table view cells, and modelling it off a data source.

The solution is in the TableViewExample directory.

Note that we used a TableViewController and did 'override func' on the functions we wanted to override (numberOfSections, numberOfRowsInSection, and cellForRowAt). However, in the homework later it is a bit different, where instead we drag a Table View into the view controller, and then override the functions using a delegate.

Steps to complete app:

1. Create a new TableViewCell, by going to new, and subclass UITableViewCell
2. Set a reuse identifier on the TableViewCell
3. Make sure the text field is exposed in the custom cell
4. Now we can set the custom text field in the cellForRowAt method.
