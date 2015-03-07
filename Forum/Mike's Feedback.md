
Feedback on first code submission (March 5, 1015)

Great job overall.  You've done a lot of work and made enormous progress.  Opening your project, you made me say, "Wow!"

I was also very pleased and impressed with your contribution to the class discussion on Thursday.  

Now some specific comments about individual classes / components of your project:

** Your Questions **

In Objective-C, you import classes one-by-one.  Swift is different.  In Swift, all the classes in an app are automatically added to the app's module. This means that you don't have to import them. All "internal" components are automatically available to all other internal components, and most items are internal by default. 

To add an Objective-C class to a module, include that class in "Forum-Bridging-Header.h".  Once you've done that, every Swift file in your project will be able to access that Objective-C class.

The method that you've used for creating your singleton is both brilliant and horrifying. In the future, when static variables are supported in classes, you won't do something like this. Even today, I would take a different approach.  Rather than using a nested type, I would simply make the variable that holds the shared instance a private variable in global scope. Variables in global scope aren't initialized until the first time that they're used, and I believe that they are smart about locking to ensure that they can't be initialized twice, so I think that's a cleaner, safer approach. You can still use a calculated class property to return the shared instance.  

** Main.storyboard ** 

Your password field for the login screen should not expose the user's password in plain text.  You can use the Attributes Inspector to turn on "Secure Text Entry" for this UITextField.  You should always use that option for password fields.

You have the "My Groups" navigation controller. It looks like you are pushing a second navigation controller onto it from the "My Groups" tableview.  Is there a reason that you're doing that?

** LoginViewController / LoginLogic ** 

Right now your LoginViewController and your LoginLogic are very tightly coupled with one another.

I would enourage you to make the following changes:

1)  If the user name or password are nil, the LoginLogic methods should never be called. The ViewController should stop the user from going forward without the LoginLogic routines needing to be involved. This would also mean that the LoginLogic would not need to take optionals as parameters anymore -- by the time that LoginLogic is called, it should be certain that there are strings for both the user name and password.

2)  Can you make it so that the LoginLogic doesn't need to know about the LoginViewController? Ideally, the LoginLogic method would have a protocol defining a couple of callback methods: one would return a failure message, the other would return a valid user.  The LoginViewController could then implement these these methods.  The advantage to this code is that it separates the LoginLogic completely from the LoginViewController, which makes it easy to reuse the LoginLogic code if you want to do so.

** WebServiceImitation **

"NsModel" is not a good name for one of your own variables.  First, the NS prefix is generally reserved for Foundation classes, and could cause confusion.  Second, starting a variable name with "Ns" violates the naming convention that variables should be lowerCamelCase.

** Member / MemberModel **

Why do you have two separate classes?

** That's all for now **

That's all for my first set of feedback.  Keep up the good work, and let me know when you'd like me to review your project again. I'm pleased with the amount that you've been able to do in a very short period of time.






