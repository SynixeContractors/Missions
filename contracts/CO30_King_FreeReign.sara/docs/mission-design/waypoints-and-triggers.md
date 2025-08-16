# Waypoints & Triggers

## Trigger Conditions

Triggers are something incredibly useful, and often intuitive to add a special
colour to your mission. They are a condition that will decide whether something
in the mission happens or not, based on what did or did not happen before.
Below we will see some examples of what can be added as trigger conditions.

```admonish warning title="Warning"
In most cases, we will need to define a variableName for the item we want to
track. This is basically the game's / computer's way of knowing which item in
specific we are reffering to. You can set this by opening an item's attributes
either by double-clicking on it, or right-click then go to the Attributes option.
```

It is useful to be aware of the following expressions:

`!` means NOT. If we were to use `!alive` this means NOT alive.

`&&` means AND. This lets us combine two lines of code, such as:
`!alive variableName1 && alive variableName2`.

`||` means OR. This means that either condition will activate the trigger,
regardless of the other: `!alive variableName1 || alive variableName2`.

### Checking if a specific unit, object, or vehicle, is alive

If we put `alive variableName` in a trigger's condition field, we will check
whether that item is alive or dead to activate the trigger. Once they are dead,
the trigger will be activated. If we want to check for the opposite, we can
use `!alive variableName` inside the trigger's condition field.

```admonish info
Do you want something to happen when a certain unit is killed, or when a
structure is destroyed? This is the way!
```

### Checking if a specific unit, object, or vehicle, is inside the trigger

We can use `variableName in thisList` inside a trigger's condition field to
check if a specific unit is present inside of it.

### Checking if another trigger was activated beforehand

If we want to have a trigger depend on another trigger, we can use
`triggerActivated triggerName` within another trigger's condition field to
make it depend upon another trigger having been activated previously, meaning
that, this trigger won't activate on it's own.

### Checking for a specific in-game time

If we want something to happen at a specific in-game time, we can put the
following inside the trigger's condition field:

```sqf
((date select 3) >= HH) && ((date select 4) >= MM)
```

```admonish info
`(date select 3)` stands for HOUR, while `(date select 4)` stands for MINUTES.
This includes both of them, if you only want to use one or the other, you can
keep one of either and remove the &&'s.
```

## On Activation Code Snippets

Here are some simple things you can use in the On Activation field for your missions.

### Destroying an Object

If you want a unit to die, a car to explode, a building to collapse, or a bomb
to go off, giving the aforementioned objects a variableName, and then using
the following code within the trigger's On Activation field should do the trick:

```sqf
variableName setDammage 1;
```

## Trigger-Activated Waypoints

As opposed to most normal waypoints, some waypoints never get completed on their
own when the AI reach their position, and as such, they need something external
to activate them. We will most commonly find ourselves using the HOLD and CYCLE
waypoints under this premise.

Say we wanted to add a group of enemies that will wait at one position, until a
trigger gets activated, to then execute an ambush or a reinforcement. For this,
we'd give our group a HOLD waypoint with the characteristics we want. Then,
we will right-click and in connect we select Set Waypoint Activation.

If we want to have a group patrol until a trigger is activated, we can follow
this same structure, except we sync the CYCLE waypoint to a trigger.

```admonish warning title="Warning"
Make sure that within your waypoint activation trigger that you set it's Type to
Skip Waypoint, otherwise it will not work!
```
