# Use Docker to Launch CMS Instances

> NOTE: This is a work in progress!

# Overview

This document describes how to build the CMS system into one of two target systems:

* A new **Virtualbox** on your **OSX** computer used for development.
  This is used primarily for development of this script.
* A new **EC2** instance.  This is used primarily for redeploying a new **acceptance**
  (*canonical cukes*) system.
  In the future, it will probably be used for deploying all **EC2** instances: **acceptance**,
  **staging**, AND **production**, but we're not there yet.


# Instructions on building on your OSX system

You can build a completely new CMS instance inside of a **Virtualbox** here:

## Prerequisites

1.  Have installed Apple developer tools (typically contained in *XCode*).
1.  Have installed **Virtualbox** and **Docker**.  Use **Homebrew** to do this:

     ```bash
     brew update                   # wait for formulas to update
     brew cask install virtualbox  # my version was 4.3.20
     brew install docker           # my version was 1.4.1
     brew install boot2docker      # my version was 1.4.1
     ```

## Initialize Docker in a new Virtualbox Instance

We only have to do this once.  In OSX `iterm2`, run the following command:

```bash
boot2docker init
```

## When You Want to Work With Docker

When you want to work with **Docker**, you must launch it in an instance of *Virtualbox*:

```bash
boot2docker up
```

This will consume considerable memory, so when you're done working with Docker for the time being, do:

```bash
boot2docker down
```

# Instructions for launching an EC2 instance

TODO
