# ACApiWrapper

## Installation

You can load this project into Pharo using Metacello. Just open a playground and paste the Metacello code snippet shown below into it. Select and run it. It will load the Core, Scripts and Tests.

```Smalltalk
Metacello new
  repository: 'github://migchiel/ACApiWrapper:master/releases/latest';
  baseline: 'ACApiWrapper';
  load.
```

If you only want to load the Core API wrapper classes:

```Smalltalk
Metacello new
  repository: 'github://migchiel/ACApiWrapper:master/releases/latest';
  baseline: 'ACApiWrapper';
  load: 'Core'
```

If you want to load the Core API wrapper classes and the scripts:

```Smalltalk
Metacello new
  repository: 'github://migchiel/ACApiWrapper:master/releases/latest';
  baseline: 'ACApiWrapper';
  load: 'Scripts'
```


