# Initial Raspberry Pi Headless Setup

## 0. Initial setup

Get **[Raspbian](https://www.raspberrypi.org/downloads/raspbian/)** and write it to a SD card.

## 1. SSH to the Pi

`ssh pi@[pi-ip-address]`

Default password for user `pi` is `raspberry`.

## 2. raspi-config

Run:

`sudo raspi-config`

to expand filesystem, change user password and set timezone (in internationalisation options).

## 3. Update

Let's update RPi:

`sudo apt-get update && sudo apt-get upgrade`

It might take a while.

## 4. Watchdog

Now we're going to install watchdog. Its purpose is to automatically restart RPi if it becomes unresponsive.

```
sudo apt-get install watchdog
sudo modprobe bcm2708_wdog
sudo nano /etc/modules
```

And at the bottom add:

`bcm2708_wdog`

Now let's add watchdog to startup applications:

`sudo update-rc.d watchdog defaults`

and edit its config:

`sudo nano /etc/watchdog.conf`

Uncomment the following:

```
max-load-1
watchdog-device
```

Start watchdog with:

`sudo service watchdog start`

## 5. Firewall

We're going to use UFW (Uncomplicated FireWall) to restrict access to our RPi:

```
sudo apt-get install ufw
sudo ufw allow 22
sudo ufw enable
```

And we can see its status with:

`sudo ufw status verbose`

As you can see, we're accepting incoming connections only on port 22.

## 6. fail2ban

Now we're going to install fail2ban which will automatically ban IP addresses that are failing to get into our RPi too many times:

`sudo apt-get install fail2ban`

`sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local`

Restart fail2ban:

`sudo service fail2ban restart`

and check current bans with:

`sudo iptables -L`

Done!

---

> Thanks to Peter Legierski for the original tutorial:

> **[http://blog.self.li/post/63281257339/raspberry-pi-part-1-basic-setup-without-cables](http://blog.self.li/post/63281257339/raspberry-pi-part-1-basic-setup-without-cables)**
