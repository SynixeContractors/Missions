# Creating the FOB

Every mission needs a FOB. This is where players will spawn, and where they will
return to after completing objectives. The FOB is also where players will access
the shop, and where vehicles will be spawned.

## Pick a location

A FOB must be within a reasonable distance from the AO, but far enough away that
the enemies will not be alerted to the FOB's presence.

A good FOB location:

- Is a reasonably flat area
- Is at least 2km from the AO
- Is not too close to any civilian areas
- Has access to a road

## Place the Contractors

Place the contractors in the FOB. These are the units that players will control.
They should be placed without colliding with any other objects.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_players.webm" type="video/webm" markdown="1">
</video>

1. Place the player group, found in
`Compositions > Independent > Synixe Contractors > Base Components > Players`
2. Highlight all units in the group.
3. Right click on one of the units, select `Attributes`
4. Change `Callsign` to `Synixe`
5. Navigate down to the `Object: Control` section
6. Check `Playable`
7. Set the Role Description to `Contractor`

## Respawns

By default, no respawn setup is needed. Players will respawn where their player started.

You can alternatively set up respawn points.

### Default Respawn

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_respawn_default.webm" type="video/webm" markdown="1">
</video>

1. Place a `Respawn` object, found in `Objects > Props > Synixe Contractors > Helpers`.

That is it! Players will now respawn at the location of the `Respawn` object.

If multiple `Respawn` objects are placed, players will respawn at a random one.

### Triggered Respawn

It is possible to change the respawn points based on a trigger.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_respawn_triggered.webm" type="video/webm" markdown="1">
</video>

1. Place a `Respawn` object, found in `Objects > Props > Synixe Contractors > Helpers`.
2. Place a `Trigger`, configure it to your liking.
3. Sync the `Respawn` objects to the `Trigger`.

When the trigger is activated, any synced `Respawn` objects will become the only
active respawn points.

## Spectator Screens

Spectator screens allow players to spectate the mission if they have died or join
late to watch the mission.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_spectator.webm" type="video/webm" markdown="1">
</video>

1. Place a `Spectator Screen` object, found in
`Objects > Props > Synixe Contractors > Electronics > Spectator Screen`.

That is it! Players are now able to spectate the mission.

## Shop

The shop is where players will purchase and access their equipment.

It is advised to place multiple shops around the FOB, so players are able to
spread out and not crowd around a single shop.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_shop.webm" type="video/webm" markdown="1">
</video>

1. Place any object that is a viable shop.
2. Right click on the object, select `Attributes`.
3. Navigate down to the ``Object: Crate - Persistent Gear`.
4. Check `Shop`.

## Vehicles

Various kinds of vehicles can be spawned at the FOB.

They are:

- Land
- Heli
- Plane
- Sea
- Thing

`Thing` is a special category that allows for non-enterable objects,
jerry cans, crates, etc.

You are required to place a `Land` and `Thing` spawn point. The other spawn points
should be placed whenever possible.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_fob_vehicles.webm" type="video/webm" markdown="1">
</video>

1. Find the appropriate spawn point in `Objects > Props > Synixe Contractors > Helpers`.
2. Place the spawn point in a suitable location, ensuring no objects are colliding
with it.

Multiple spawn points can be placed, when an object is spawned it will select the
first available spawn point of the correct type and size.

Small vehicles can use large spawn points, but large vehicles cannot use small
spawn points.
