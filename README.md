# How to Use Password Storage
- - - - - - - - - - - - - - 

## Setup

1. Clone the repository
2. Include the repository in your PATH

## Display passwords

```bash
./decrypt.sh
```
... and enter the password.


## Add passwords

```bash
./add-password.sh
```
Follow the prompts on the screen.

... and enter the password three times (the second two times will be to write to the new file, so if you want to change the password, you can enter a new password there.)

## Remove a password

```bash
./remove-password.sh
```
Follow the prompts on the screen.

... and enter the password three times, and that password entry will be removed.
