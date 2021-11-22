# IO Service

This project provides a lightweight REST API around the Adafruit FT232H device's Python libraries.
This allows other applications (which may be written in other languages like C++) to very simply
access GPIO, I2C, and SPI devices without needing to be tightly coupled to the Adafruit FT232H
Python code.

I originally named this "Adafruit FT232H Microservice", but renamed it to "IO Service" because
it can be extended to wrap other backends, such as Linux spidev/gpiod/i2c-dev, etc.

## Getting Started

You'll need Python 3 installed on your machine. All other dependencies will be installed within
the virtual environment. The script run.sh demonstrates how to create the virtual environment
and run the application.
