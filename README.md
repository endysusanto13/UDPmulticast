# Password Authentication API

## Problem

Problem 2 - Parallel Processing

In distributed transactions, we need to guarantee that concurrent updates on a
replicated database are seen in the same order everywhere. This requires a
totally‐ordered multicast

– Update 1: add $100 to an account (initial value = $1000)
– Update 2: add 1% interest to account

– In absence of proper synchronization: replica 1 = $1111, replica 2 = $1110.

Lamport’s logical clocks can be used to implement totally‐ordered multicast in a
completely distributed fashion.

Let’s assume there are two processes communicating with each other. Each maintains
its own logical clock, multicast events at random time intervals.

Write code that allows the execution of events in a total ordered fashion. Use a UDP
socket for this communication, build your own data packet and ack structure. Each
process will be acting as client and server at the same time. Use UDP socket to solve
the above mentioned problem. You can use any programming language you want.


You can use any data structure you want. We recommend that you can use a dictionary
to maintain the IP, PORT for each process, use this dictionary to send packets to every
entry inside the dictionary. However, you can use some other data structure for this job.

Note: The output on each process console should only display the events ready for
execution i.e. after acquiring all the acks

At Process P1
P1: Executing event <logical_clock_value, Src_Process=x>
P1: Executing event <logical_clock_value, Src_Process=x>

Similarly, at proces P2
P2: Executing event<logical_clock_value, Src_Process=x>
P2: Executing event<logical_clock_value, Src_Process=x>

## Installation

Install ruby (https://www.ruby-lang.org/en/documentation/installation/)


## Usage

1. Open 3 separate terminals.
2. For each terminal, run each script separately.
    - Type 'ruby processP1.rb' in terminal 1 at root directory.
    - Type 'ruby processP2.rb' in terminal 2 at root directory.
    - Type 'ruby UDPclient.rb' in terminal 3 at root directory.