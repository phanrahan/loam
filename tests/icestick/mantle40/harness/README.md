Simple test script to show how to run a unit test on the icestick.

The script sets DSR when it is finished and CTS to the error condition.

DSR = 0, CTS = x means the test is running
DSR = 1, CTS = 0 means the test was run sucessfully
DSR = 1, CTS = 1 means the test was run and an error occured
