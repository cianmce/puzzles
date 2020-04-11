# Two envelopes problem

## Paradox

In the [two envelopes problem, also known as the exchange paradox](https://en.wikipedia.org/wiki/Two_envelopes_problem), you are given two indistinguishable envelopes, each of which contains a positive sum of money. One envelope contains twice as much as the other. You may pick one envelope and keep whatever amount it contains. You pick one envelope at random but before you open it you are given the chance to take the other envelope instead

If there's 100 in the first envelope, you can say there is either 200 or 50 in the other envelope. Changing would result in you either gaining 100 or losing 50 which would result in an expected value gain of
```
(1/2)(2X) + (1/2)(X/2) = (5X/4)
```

Meaning there appears to be a net gain by switching

## How to run:
```
bundle exec ruby envelopes.rb --count=100000 --verbose=false --randomize=true
```

### Sample output:
#### Randomizing values in envelopes
```
$ bundle exec ruby envelopes.rb --count=10000000 --verbose=false --randomize=true
Randomize values: true
Total iterations: 10,000,000
I've made €75,086,029,600 from changing vs €75,090,138,140 if I stuck
Gain: -0.0055%
Time: 4.708215 seconds
```

#### Fixing values in envelopes as 100 & 200
```
$ bundle exec ruby envelopes.rb --count=10000000 --verbose=false --randomize=false
Randomize values: false
Total iterations: 10,000,000
I've made €1,500,048,000 from changing vs €1,499,952,000 if I stuck
Gain: 0.0064%
Time: 3.945445 seconds
```

#### Verbose randomizing values in envelopes
```
$ bundle exec ruby envelopes.rb --count=5 --verbose=true --randomize=true
Randomize values: true

Randomize values: true
Total iterations: 5
I chose envelope: #0 which has €4,870
The other box either has €9740 or €2,435 or
I'm changing my guess to: #1 which has €9,740
I've made €9,740 from changing vs €4,870 if I stuck
Gain: 100.0%
I chose envelope: #1 which has €5,470
The other box either has €10940 or €2,735 or
I'm changing my guess to: #0 which has €10,940
I've made €20,680 from changing vs €10,340 if I stuck
Gain: 100.0%
I chose envelope: #1 which has €12,080
The other box either has €24160 or €6,040 or
I'm changing my guess to: #0 which has €6,040
I've made €26,720 from changing vs €22,420 if I stuck
Gain: 19.1793%
I chose envelope: #1 which has €2,890
The other box either has €5780 or €1,445 or
I'm changing my guess to: #0 which has €5,780
I've made €32,500 from changing vs €25,310 if I stuck
Gain: 28.4077%
I chose envelope: #0 which has €5,880
The other box either has €11760 or €2,940 or
I'm changing my guess to: #1 which has €2,940
I've made €35,440 from changing vs €31,190 if I stuck
Gain: 13.6262%
I've made €35,440 from changing vs €31,190 if I stuck
Gain: 13.6262%
Time: 0.000305 seconds
```

#### Verbose fixing values in envelopes as 100 & 200
```
$ bundle exec ruby envelopes.rb --count=5 --verbose=true --randomize=false

Randomize values: false
Total iterations: 5
I chose envelope: #0 which has €200
The other box either has €400 or €100 or
I'm changing my guess to: #1 which has €100
I've made €100 from changing vs €200 if I stuck
Gain: -50.0%
I chose envelope: #1 which has €100
The other box either has €200 or €50 or
I'm changing my guess to: #0 which has €200
I've made €300 from changing vs €300 if I stuck
Gain: 0.0%
I chose envelope: #0 which has €200
The other box either has €400 or €100 or
I'm changing my guess to: #1 which has €100
I've made €400 from changing vs €500 if I stuck
Gain: -20.0%
I chose envelope: #0 which has €100
The other box either has €200 or €50 or
I'm changing my guess to: #1 which has €200
I've made €600 from changing vs €600 if I stuck
Gain: 0.0%
I chose envelope: #0 which has €200
The other box either has €400 or €100 or
I'm changing my guess to: #1 which has €100
I've made €700 from changing vs €800 if I stuck
Gain: -12.5%
I've made €700 from changing vs €800 if I stuck
Gain: -12.5%
Time: 0.000205 seconds
```
