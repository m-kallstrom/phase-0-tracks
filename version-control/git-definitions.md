# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
  Version control is a way to preserve different versions of the project you're working on. This is useful for falling back on solid code when your new code has problems, protecting your main code from possible corruption or deletion, and allowing many different people to develop ideas at the same time without stepping on each other's toes. It also allows you to experiment without the fear of ruining everything forever.

* What is a branch and why would you use one?
  A branch is a copy of either the master code, or another branch off of that code, that allows you to make changes to the copy before integrating them later. You can use one to develop new features, to collaborate with multiple people on the same project, and to keep your master code clean and safe until branches are finished and reviewed and ready to be merged.

* What is a commit? What makes a good commit message?
    A commit is a save point for the code you're working with on a particular branch in your repository. A good commit message describes the specific changes made and/or their purpose.

* What is a merge conflict?
    A merge conflict arises when the branch being merged has a different change to the same line of the same file as the branch it's being merged into. This can be because two people were working on the same file on the same branch but made different changes. Or it could be the master branch was updated in between the time that the branch was created and the merge was attempted.