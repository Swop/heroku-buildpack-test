# Heroku Test Buildpack

This is a Heroku buildpack used for testing purpose.
It allow buildpack developers to quickly test  new idea for their buildpack.

## How to use this buildpack

The buildpack currently do ... nothing :-P
The compile script just include a file named `test.sh` in the `bin` directory.
You can use this test bash script file to quickly develop the code you want to test on Heroku slug compiler instance.

### Have your own test buildpack
Just fork the current buildpack to your GitHub account. You could now create as many branches as you want to test different things without messing with your master branch.

### Clever use of Git branches when deploying on Heroku (a.k.a. _What's the workflow?_)
Fortunately, you can tell Heroku to use a specific branch of your buildpack went deploying your app. So a good workflow to test a new functionality  consist in the following steps:
*  Create a new test branch from master in your buildpack:

        git checkout -b new_test

*  Write some code you wanna test on Heroku in the `bin/test.sh` file
*  Commit your work and push the brand new branch to GitHub:

        git commit -a && git push -u origin new_test

*  Go in your application repository _(the one which you wanna deploy on Heroku)_ on your local machine
*  Tell Heroku that you wanna use your brand new test branch to build your app's slug:

        heroku config:add BUILDPACK_URL="https://github.com/YOU/heroku-buildpack-test.git#new_test"

*  Push your app to Heroku and see your testing code running in the slug compiler instance:

        git push heroku your_current_branch:master

## Here's some tips...

### What if I usually code my buildpack in another language than bash?

If you code in another language, you can't replace directly the `test.sh` file with your main file  because the compiler script included it as a bash script.
You can however call the desired interpreter (or executable) from the test.sh file.

### I don't want to really deploy my app at the end of the slug compilation

If you just want to execute your test code in the slug compiler but you don't want to truly deploy your app at the end (_very useful to keep working on a test code in the buildpack and don't have to make new dummy commit in the app git repository to force a new deploy_), you can do it in the `test.sh` file.

just override the `FORCE_FAILED_COMPILATION` variable in the script (the initial value is set to 'true') to the desired value. *The buildpack will willingly exit with an error return code, and thus cause the push rejection*:

        FORCE_FAILED_COMPILATION=true
        # ...
