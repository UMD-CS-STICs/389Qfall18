# Final Project

## Option 1: Make your own project

What app did you dream of creating before taking this class? Now is your chance to make it.
We are hoping to see more complete apps for the final project. You may build off the midterm, but we are grading on functionality and creativity here, and not on specific concepts we've taught in class. So, you're encouraged to implement things we haven't learned in class- Impress us and the class 😉! 

**Rubric:**

Points | Topic 
--- | ---
40 | Completeness 
20 | Design 
20 | Good Architecture
20 | Bugs

**Extra Credit:**

Points | Topic 
--- | ---
30 | Creativity 

**Completeness:** Is your app close to being something we can publish on the app-store? That is, what is the problem/value your app is trying to provide, and how close is it to providing that, given the code you've written.

**Design:** The app correctly scales on all mobile devices. You've also attempted to make your app look nice. We're not expecting you to be designers 😂, so we're lenient. But, in general, screens should not be too cluttered, the user experience is not too complex, and you've attempted a color scheme.

**Good Architecture:** Correctly follows MVC. If a new data type is required (i.e. a class, enum, or struct) define it in a separate swift file, and not in the view controller.

**Bugs:** Did we find any bugs? Does your app crash, or is there weird behavior with edge cases?

**Creativity:** Lots of extra credit to be given here. Is it a cool idea? Did you do something we didn't teach in class? Is it a creative design? 



## Option 2: DYKM (Do you know me?)

Have you ever played Do You Know Me on Facebook messenger?  Well, this is a similar version of the app, but with QR codes! Here is a [demo](https://youtu.be/YeyvoqIPdOM) of how the app works. There is one quiz everyone answers. You sign up with your directory ID, and give your answers to the quiz. Once you've done this, then other people can scan your QR code or manually input your directory ID, and they'll try to guess what answers you put on the quiz. After that, they'll be presented with their score, and that's the end of game.

Profile UI            |  Quiz UI
:-------------------------:|:-------------------------:
![Imgur](https://i.imgur.com/ntRebaA.png)  |  ![Imgur](https://i.imgur.com/WfmtOvK.png)

**Rubric:**

Points | Topic 
--- | ---
15 | IntroUsernameVC- UserDefaults
5   | IntroUsernameVC- prepare
10 | Question.swift 
25 | QuizGame logic
5   | QuizGame cells
20 | ProfileVC UI
10 | Barcode scanner- Button & Cocoapod
10 | AddUserVC- TextFieldDelegate

**Extra Credit:**

Points | Topic 
--- | ---
6 | Take other people's quizzes! 
20 | Surprise me!

We've placed TODO's around the project. You can use the 'search' feature in the editor to find them.
<br/>
<br/>
_IntroUsernameVC_<br/>
Screen where user enters directory ID. Correctly implement prepare function. The username we enter should be saved in UserDefaults and retrieved from it in all future use-cases of the current user's username.<br/>
<br/>
_IntroPreQuestionVC_<br/>
The 'Greetings!' screen right before you take the quiz.

_QuizGameVC_<br/>
Implement Question.swift. Each question holds a question text, and four answer texts. Correctly set the option cell's text from this array of questions. Finally, implement the logic for tapping the 'continue' button.

_ProfileVC_<br/>
Create the UI in storyboard. Use the screeshots & video for reference.

_AddUserVC_<br/>
Install [Cocoapod](https://github.com/hyperoslo/BarcodeScanner) for scanning Barcode. You'll need a physical device to test the scanner. However, we've included the Barcode code, so if you've installed the pod correctly and your code compiles, it should be correct. TextFieldDelegate return function starts the quiz for the entered user.

Extra credit: We'll give 3 points for taking the quiz of another student in the class, for a max of 6 points! We'll have time for the last two days of class to do this.

Note: We've implemented Firebase functions that log who's taken your quiz, and the quizzes you've taken for other people. Feel free to use these in your extra credit!
