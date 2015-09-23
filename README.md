# Magnus

# What it does

Magnus is an app that will transform your whiteboard and paper wireframes into a interactive prototypes. There's no need to take a picture of your drawing. Take your magic pen and place your iPhone next to your surface and start creating!

# How I built it

We built a library that gives meaning to the data coming out of the magnetometer. It can track the 3D position of a magnet within short distance of the iPhone. We took a pen apart and placed a magnet close to its tip. As we use the magnetic pen to draw on paper, the app transcribes everything on the iPhones memory. Snapshots of this memory are processed through an OpenCV script that extracts shapes and renders native UI elements on the phone's screen.

# Challenges I ran into

Figuring out the precise 3D (or even 2D) position of a magnet using just the data from a smartphone's magnetometer is a really hard problem. OpenCV was also a challenge.

# What I learned

I learned it's wise to keep magnets away from your wallet :)

# Built With
IOS
OpenCV
C++
Objective-C
