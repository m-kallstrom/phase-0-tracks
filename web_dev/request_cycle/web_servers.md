#What are some of the key design philosophies of the Linux operating system?

"An operating system, by its nature, embodies the philosophy of its creators... The creators of the Unix operating system started with a radical concept: they assumed that the user of their operating system would be computer literate from the start. The entire Unix philosophy revolves around the idea that the user knows what he or she is doing."


"Even the Linux GUI desktops whispers, "Use the force, Luke," to all who use them. "

Heheheh

"The so-called "Open Source development model" is a phenomenon that started with the Free Software Foundation and which was popularized with Linux. It's a totally different way of producing software that opens up every aspect of development, debugging, testing, and study to anyone with enough interest in doing so. Rather than relying upon a single corporation to develop and maintain a piece of software, Open Source allows the code to evolve, openly, in a community of developers and users who are motivated by desire to create good software, rather than simply make a profit."


Small is Beautiful
Each Program Does One Thing Well
Prototype as Soon as Possible
Choose Portability Over Efficiency
Store Data in Flat Text Files
Use Software Leverage
Use Shell Scripts to Increase Leverage and Portability
Avoid Captive User Interfaces
Make Every Program a Filter


#In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

  A virtual private server is a chunk of hard drive space on a computer somewhere that has been walled off and behaves as though it's an independent, actual computer. They can be created and deleted without fear of ruining your own computer, and allow you to save space and stay safe from internet black hats. It's also cheaper than buying and maintaining a physical server and many places offer them with differing levels of support. They're also easily scalable if the needs of your website grow.

#Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?

If your system is attacked, someone can upload malicious code to that program and that code will have full root access which means it can do literally anything it wants and also hide itself deep where your anti-malware can't find it.