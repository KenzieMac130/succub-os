# Succub-OS

A personal operating system based off of the work of the [Universal Blue](https://universal-blue.org/) project and [Fedora's Kiniote](https://fedoraproject.org/atomic-desktops/kinoite/). Succub-OS is geared towards my own usage and makes little to no effort to support much else. Please do not use this as your own operating system unless we are friends. I have limited time to offer much technical support.

## Goals

* Deliver a KDE Plasma centric desktop experience with minimal opinionated changes
* Provide out of the box support for devices/software/workflows that I personally use
* Be a solid and evolving foundation for me to build my systems off of in the future

#### Why Universal Blue?

I have experience with cloud container deployment and management. I absolutely fell in love with Universal Blue's goal of bringing concepts to desktop OS's. Being able to manage my operating system through container builds and deploy it to my own devices would cut out a lot of the headaches of maintaining multiple devices and ensure I had a more predictable update model.

#### Why not Aurora or Bazzite?

These are great operating systems but are too opinionated for my liking. I prefer more control over my OS and to modify it to accomodate my needs without other teams making decisions about my installed software and preferences as much as possible.

## Included Features

### Better Out of Memory Handling

On most Linux environments processes can end up using all the system's availible memory and swap and still take priority over the desktop environment. This causes an unresponsive system requiring the process to be manually killed if possible or a system reboot. On a desktop environment this is simply awful behavior. [Earlyoom](https://github.com/rfjakob/earlyoom) comes integrated with the OS to kill problematic processes before they get the chance to lock up your system for an unknown length of time potenially causing you to lose unsaved progress in the rest of your session.