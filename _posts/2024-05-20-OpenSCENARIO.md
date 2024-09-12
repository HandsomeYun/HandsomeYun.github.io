---
layout: post
title: "Getting Started with OpenSCENARIO for CARLA"
date: 2024-09-11 15:09:00
description: "A comprehensive guide to understanding geometry and positioning in OpenSCENARIO for creating driving scenarios in CARLA."
tags: carla openscenario tutorial
categories: carla-posts
featured: true
---

### Introduction

**OpenSCENARIO** is a flexible and powerful format for defining complex driving scenarios for testing autonomous vehicles. One of the key aspects of working with **OpenSCENARIO** is understanding how to position entities in the environment, which can be done in various coordinate systems. This guide will explain how to use geometry and positioning for scenarios in **CARLA**.

---

### Understanding Positioning in OpenSCENARIO

In **OpenSCENARIO**, positioning refers to the placement and movement of entities within the simulation environment. There are multiple ways to define the positioning of an entity, depending on the reference system you want to use:

#### 1. Absolute/Relative in the World Coordinate System
   - **Absolute**: Specifies the exact position of an entity in the global world coordinates.
   - **Relative**: Positions an entity relative to the world coordinate system but based on a reference point.

#### 2. Absolute in the Geographic Coordinate System
   - Defines the entity’s position using geographic latitude, longitude, and altitude.

#### 3. Relative to Another Entity
   - This allows the entity to be positioned based on the location of another entity. Useful for scenarios where entities interact, such as following or overtaking other vehicles.

#### 4. Absolute/Relative in the Road Coordinate System
   - **Road Position**: Positioning based on the road’s centerline (s-coordinate) and distance from the centerline (t-coordinate).
   - **Relative Road Position**: Specifies the position relative to a given road or path within the environment.

#### 5. Absolute/Relative in the Lane Coordinate System
   - Used to place vehicles in specific lanes on the road, making it easier to create lane-specific behaviors.

#### 6. Relative to a Route
   - Position entities along a pre-defined route, usually consisting of waypoints that form a path for entities to follow.

#### 7. Relative to a Trajectory
   - Entities can follow a custom trajectory defined by a series of waypoints, useful for simulating dynamic movements like overtaking or evasive maneuvers.

---

### Route and Waypoint Definitions

In **OpenSCENARIO**, routes and waypoints are essential components for defining paths that entities follow:

#### Route
   - A **route** defines a path for an entity to follow through the road network. It consists of waypoints, each connected to form a continuous directional path.

#### Waypoint
   - A **waypoint** represents a specific location on a route that an entity should pass through. It consists of the coordinates and route strategy.

#### Position
   - A waypoint's **position** specifies the coordinates in the road network, determining where the entity should be located at that point.

---

### Global Setting (Defining the Towns and Parameters)

To set up global settings like towns and road networks, use the following structure:

```xml
<?xml version="1.0"?>
<OpenSCENARIO>
  <FileHeader revMajor="1" revMinor="0" date="${Date}" description="CARLA: SynchronizeIntersectionEntry" author="YourName"/>
  <ParameterDeclarations/>
  <CatalogLocations/>
  <RoadNetwork>
    <LogicFile filepath="${Town}"/>
    <SceneGraphFile filepath=""/>
  </RoadNetwork>
</OpenSCENARIO>
```

#### Example ####

```xml
<?xml version="1.0"?>
<OpenSCENARIO>
  <FileHeader revMajor="1" revMinor="0" date="2020-03-24T12:00:00" description="CARLA: SynchronizeIntersectionEntry" author="YourName"/>
  <ParameterDeclarations/>
  <CatalogLocations/>
  <RoadNetwork>
    <LogicFile filepath="Town06"/>
    <SceneGraphFile filepath=""/>
  </RoadNetwork>
</OpenSCENARIO>
```

### Defining Entities
The category and model for vehicles can be found at [CARLA Vehicle Catalogue](https://carla.readthedocs.io/en/latest/catalogue_vehicles/). Properties like ***BoundingBox*** and ***Axles*** can be consistent across different vehicle models. Here's the general structure for defining entities:

Type:
  - ***Type == “ego_vehicle”*** Indicates this is the car that you want to drive in default when you run manual_control.py. 
  - ***Type == “simulation”*** indicates this is the car for simulation. You can also drive them when run manual_control.py with –filter=${modelName}

```xml
<Entities>
  <ScenarioObject name="${EntityName}">
    <Vehicle name="${VehicleModelInCarla}" vehicleCategory="${VehicleCategoryInCarla}">
      <ParameterDeclarations/>
      <Performance maxSpeed="${maxSpeed}" maxAcceleration="${maxAcceleration}" maxDeceleration="${maxDeceleration}"/>
      <BoundingBox>
        <Center x="${x}" y="${y}" z="${z}"/>
        <Dimensions width="${width}" length="${length}" height="${height}"/>
      </BoundingBox>
      <Axles>
        <FrontAxle maxSteering="${maxSteering}" wheelDiameter="${wheelDiameter}" trackWidth="${trackWidth}" positionX="${positionX}" positionZ="${positionZ}"/>
        <RearAxle maxSteering="${maxSteering}" wheelDiameter="${wheelDiameter}" trackWidth="${trackWidth}" positionX="${positionX}" positionZ="${positionZ}"/>
      </Axles>
      <Properties>
        <Property name="type" value="${type}"/>
      </Properties>
    </Vehicle>
  </ScenarioObject>
</Entities>
```

#### Example for an Ego Vehicle

```xml
<Entities>
  <ScenarioObject name="hero">
    <Vehicle name="vehicle.tesla.model3" vehicleCategory="car">
      <ParameterDeclarations/>
      <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
      <BoundingBox>
        <Center x="1.5" y="0.0" z="0.9"/>
        <Dimensions width="2.1" length="4.5" height="1.8"/>
      </BoundingBox>
      <Axles>
        <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
        <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
      </Axles>
      <Properties>
        <Property name="type" value="ego_vehicle"/>
      </Properties>
    </Vehicle>
  </ScenarioObject>
</Entities>
```

### Storyboard Structure
Starting the Scenario

```xml
<Storyboard>
   <Init>
       <Actions>
			"a. Setting Environment"
			“b. Spawn Entity”
       </Actions>
   </Init>
<Story name="Story Name">
	<Act name="ActName">
			“c. Act”
	</Act>
</Story>
			“d. Stop trigger for story”
 </Storyboard>
</OpenSCENARIO>
```

### Setting your weather
  - cloudState: “overcast”, “free”...
  - PrecipitationType: “rain”/”snow”
  - Can change other weather component with any number you want. The elevation are in radians. 

```xml
<Storyboard>
  <Init>
    <Actions>
      <GlobalAction>
        <EnvironmentAction>
          <Environment name="${SetEnvironmentName}">
            <TimeOfDay animation="${true/false}" dateTime="${DateTime}"/>
            <Weather cloudState="rain">
              <Sun intensity="0.30" azimuth="0" elevation="1.31"/>
              <Fog visualRange="100000.0"/>
              <Precipitation precipitationType="rain" intensity="0.2"/>
            </Weather>
            <RoadCondition frictionScaleFactor="1.0"/>
          </Environment>
        </EnvironmentAction>
      </GlobalAction>
    </Actions>
  </Init>
</Storyboard>
```
#### Spawning Entities
Entity positioning can be defined using RoadPosition or WorldPosition:

***Road Position Example***: 
```xml
<RoadPosition roadId="${roadId}" s="${s}" t="${t}">
  <Orientation h="0.0" p="0.0" r="0" type="relative"/>
</RoadPosition>
```

***Road Position Example***: 
```xml
<RoadPosition roadId="${roadId}" s="${s}" t="${t}">
  <Orientation h="0.0" p="0.0" r="0" type="relative"/>
</RoadPosition>
```
***World Position Example***: 
```xml
<WorldPosition x="2" y="68.03" z="0.3" h="-1.57"/>
```
***Road Position Example***: 
```xml
<RoadPosition roadId="${roadId}" s="${s}" t="${t}">
  <Orientation h="0.0" p="0.0" r="0" type="relative"/>
</RoadPosition>
```

#### Teleporting Non-Ego Vehicles
```xml
<Private entityRef="${EntityName}">
  <PrivateAction>
    <TeleportAction>
      <Position>
        <RoadPosition roadId="1" s="10" t="2">
          <Orientation h="0.0" p="0.0" r="0" type="relative"/>
        </RoadPosition>
      </Position>
    </TeleportAction>
  </PrivateAction>
</Private>
```
***Example Storyboard for Ego Vehicle***: 
```xml
<Private entityRef="hero">
  <PrivateAction>
    <TeleportAction>
      <Position>
        <RoadPosition roadId="1" s="2" t="2">
          <Orientation h="0.0" p="0.0" r="0" type="relative"/>
        </RoadPosition>
      </Position>
    </TeleportAction>
  </PrivateAction>
  <PrivateAction>
    <ControllerAction>
      <AssignControllerAction>
        <Controller name="HeroAgent">
          <Properties>
            <Property name="module" value="external_control"/>
          </Properties>
        </Controller>
      </AssignControllerAction>
      <OverrideControllerValueAction>
        <Throttle value="0" active="false"/>
        <Brake value="0" active="false"/>
        <Clutch value="0" active="false"/>
        <ParkingBrake value="0" active="false"/>
        <SteeringWheel value="0" active="false"/>
        <Gear number="0" active="false"/>
      </OverrideControllerValueAction>
    </ControllerAction>
  </PrivateAction>
</Private>
```

#### Defining Acts and Maneuvers

An ***Act*** groups ***Maneuvers***, which are further broken down into ***Events***. Each event can have ***Actions***, and conditions are used to start or stop these actions.

***Maneuver***: used to group two instances of Event. Two instances of Maneuver may also be used, each hosting one Event. Both alternatives yield the same simulation outcome, as long as each Event retain its startTrigger.

You can organize ***Acts*** and ***Maneuvers*** in different ways, but the outcome remains the same as long as the ***startTrigger*** conditions for each event are maintained.
  - ***Start Trigger***: Defines when the event or act should begin. This is a required part of each event or act.
  - ***Stop Trigger***: Optional. Defines when the event or act should end.

***General Structure***: 
```xml
<Story name="StoryName">
  <Act name="YourActName">
    <ManeuverGroup name="YourGroupName" maximumExecutionCount="1">
      <Actors selectTriggeringEntities="false">
        <EntityRef entityRef="ActorReference"/>
      </Actors>
      <Maneuver name="ManeuverName">
        <Event name="EventName" priority="overwrite">
          <Action name="ActionName">
            <!-- Define the action here -->
          </Action>
          <StartTrigger>
            <ConditionGroup>
              <Condition name="ConditionName" delay="0" conditionEdge="rising">
                <!-- Define the start condition here -->
              </Condition>
            </ConditionGroup>
          </StartTrigger>
          <!-- Optionally add a stop trigger -->
        </Event>
      </Maneuver>
    </ManeuverGroup>
    <!-- Start trigger for the entire act -->
    <StartTrigger>
      <ConditionGroup>
        <Condition name="ActStartCondition" delay="0" conditionEdge="rising">
          <!-- Define the condition to start the act -->
        </Condition>
      </ConditionGroup>
    </StartTrigger>
  </Act>
</Story>
```
---

Example: A Straight-Driving Scenario
Below is an example of a simple Act where a vehicle starts driving straight based on a simulation time condition.

```xml
<Act name="DriveStraightAct">
  <ManeuverGroup name="DriveStraightGroup" maximumExecutionCount="1">
    <Actors selectTriggeringEntities="false">
      <EntityRef entityRef="audi"/>
    </Actors>
    <Maneuver name="DriveStraightManeuver">
      <Event name="StartDriving" priority="overwrite">
        <Action name="DriveAction">
          <PrivateAction>
            <LongitudinalAction>
              <SpeedAction>
                <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                <SpeedActionTarget>
                  <AbsoluteTargetSpeed value="13.89"/>
                </SpeedActionTarget>
              </SpeedAction>
            </LongitudinalAction>
          </PrivateAction>
        </Action>
        <StartTrigger>
          <ConditionGroup>
            <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
              <ByValueCondition>
                <SimulationTimeCondition rule="greaterThan" value="0.0"/>
              </ByValueCondition>
            </Condition>
          </ConditionGroup>
        </StartTrigger>
      </Event>
    </Maneuver>
  </ManeuverGroup>
  <StartTrigger>
    <ConditionGroup>
      <Condition name="ImmediateActStart" delay="0" conditionEdge="rising">
        <ByValueCondition>
          <SimulationTimeCondition rule="greaterThan" value="0.0"/>
        </ByValueCondition>
      </Condition>
    </ConditionGroup>
  </StartTrigger>
</Act>
```

#### Triggers and Conditions
There are two main types of conditions that determine when actions and events start or stop:
  - ***ByEntityCondition***: These conditions evaluate entity-related states like position, speed, or distance from other entities. They help in defining interactions between entities.
  - ***ByValueCondition***: Logical expressions based on simulation parameters such as time, traffic signal states, or other non-entity values.

***Stop Triggers for Stories***
```xml
<StopTrigger>
  <ConditionGroup>
    <Condition name="StopCondition" delay="0" conditionEdge="rising">
      <ByValueCondition>
        <SimulationTimeCondition rule="greaterThan" value="10.0"/>
      </ByValueCondition>
    </Condition>
  </ConditionGroup>
</StopTrigger>
```

***Private Actions***
Private actions apply to specific entities and can be used in the init section or during a ***Maneuver***. Some commonly used private actions include:
  - ***LongitudinalAction***: Controls the speed of the entity.
LateralAction: Controls lane changes or turning.
  - ***VisibilityAction***: Modifies visibility conditions for the entity.
SynchronizeAction: Synchronizes the behavior of multiple entities.

You can explore more about private actions and conditions in the ASAM [OpenSCENARIO documentation](https://www.asam.net/index.php?eID=dumpFile&t=f&f=4092&token=d3b6a55e911b22179e3c0895fe2caae8f5492467#_maneuvergroups_maneuvers_events_and_actions).

----
### Complete Example
```xml
<?xml version="1.0"?>
<OpenSCENARIO>
 <FileHeader revMajor="1" revMinor="0" date="2020-03-24T12:00:00" description="CARLA:SynchronizeIntersectionEntry" author=""/>
 <ParameterDeclarations/>
 <CatalogLocations/>
 <RoadNetwork>
   <LogicFile filepath="Town06"/>
   <SceneGraphFile filepath=""/>
 </RoadNetwork>
 <Entities>
   <ScenarioObject name="hero">
     <Vehicle name="vehicle.tesla.model3" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="ego_vehicle"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="audi">
     <Vehicle name="vehicle.audi.tt" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="simulation"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="Lincoln">
     <Vehicle name="vehicle.lincoln.mkz_2017" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="simulation"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="Mercedes">
     <Vehicle name="vehicle.mercedes.coupe" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="simulation"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="Mini">
     <Vehicle name="vehicle.mini.cooper_s_2021" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="simulation"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="Mercedes2">
     <Vehicle name="vehicle.mercedes.coupe" vehicleCategory="car">
       <ParameterDeclarations/>
       <Performance maxSpeed="69.444" maxAcceleration="200" maxDeceleration="10.0"/>
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="2.1" length="4.5" height="1.8"/>
       </BoundingBox>
       <Axles>
         <FrontAxle maxSteering="0.5" wheelDiameter="0.6" trackWidth="1.8" positionX="3.1" positionZ="0.3"/>
         <RearAxle maxSteering="0.0" wheelDiameter="0.6" trackWidth="1.8" positionX="0.0" positionZ="0.3"/>
       </Axles>
       <Properties>
         <Property name="type" value="simulation"/>
       </Properties>
     </Vehicle>
   </ScenarioObject>


   <ScenarioObject name="pedestrian_1">
     <Pedestrian model="walker.pedestrian.0001" mass="90.0" name="walker.pedestrian.0001" pedestrianCategory="pedestrian">
       <BoundingBox>
         <Center x="1.5" y="0.0" z="0.9"/>
         <Dimensions width="0.5" length="0.5" height="1.7"/>
       </BoundingBox>
       <Properties>
         <Property name="type" value="pedestrian"/>
       </Properties>
     </Pedestrian>
   </ScenarioObject>
 </Entities>


 <Storyboard>
   <Init>
       <Actions>
         <GlobalAction>
           <EnvironmentAction>
             <Environment name="Environment1">
               <TimeOfDay animation="false" dateTime="2019-06-25T12:00:00"/>
               <Weather cloudState="overcast">
                 <Sun intensity="0.30" azimuth="0" elevation="1.31"/>
                 <Fog visualRange="100000.0"/>
                 <Precipitation precipitationType="rain" intensity="0.2"/>
               </Weather>
               <RoadCondition frictionScaleFactor="1.0"/>
             </Environment>
           </EnvironmentAction>
         </GlobalAction>
           <Private entityRef="hero">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="9" y="68.03" z="0.3" h="-1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
               <PrivateAction>
                 <ControllerAction>
                   <AssignControllerAction>
                     <Controller name="HeroAgent">
                       <Properties>
                         <Property name="module" value="external_control"/>
                       </Properties>
                     </Controller>
                   </AssignControllerAction>
                   <OverrideControllerValueAction>
                     <Throttle value="0" active="false"/>
                     <Brake value="0" active="false"/>
                     <Clutch value="0" active="false"/>
                     <ParkingBrake value="0" active="false"/>
                     <SteeringWheel value="0" active="false"/>
                     <Gear number="0" active="false"/>
                   </OverrideControllerValueAction>
                 </ControllerAction>
               </PrivateAction>
           </Private>
           <Private entityRef="audi">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="2" y="68.03" z="0.3" h="-1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
           <Private entityRef="Mercedes">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="5.31" y="68.03" z="0.3" h="-1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
           <Private entityRef="Lincoln">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="6" y="75.03" z="0.3" h="-1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
            <Private entityRef="Mini">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="5.31" y="150.03" z="0.3" h="-1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
           <Private entityRef="Mercedes2">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="-5.31" y="33.03" z="0.3" h="1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
           <Private entityRef="pedestrian_1">
               <PrivateAction>
                   <TeleportAction>
                       <Position>
                           <WorldPosition x="15.31" y="33.03" z="0.3" h = "1.57"/>
                       </Position>
                   </TeleportAction>
               </PrivateAction>
           </Private>
       </Actions>
   </Init>
<Story name="DriveStraightStory">


   <Act name="DriveStraightAct">
       <ManeuverGroup name="DriveStraightManeuverGroup" maximumExecutionCount="1">
           <Actors selectTriggeringEntities="false">
               <EntityRef entityRef="audi"/>
           </Actors>
           <Maneuver name="DriveStraightManeuver">
               <Event name="StartDriving" priority="overwrite">
                   <Action name="DriveAction">
                       <PrivateAction>
                           <LongitudinalAction>
                               <SpeedAction>
                                   <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                                   <SpeedActionTarget>
                                     <AbsoluteTargetSpeed value="13.89"/>
                                 </SpeedActionTarget>
                               </SpeedAction>
                           </LongitudinalAction>
                       </PrivateAction>
                   </Action>
             <StartTrigger>
               <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                   <ByValueCondition>
                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                   </ByValueCondition>
                 </Condition>
               </ConditionGroup>
             </StartTrigger>
           </Event>
         </Maneuver>
       </ManeuverGroup>
       <StartTrigger>
         <ConditionGroup>
           <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
             <ByValueCondition>
               <SimulationTimeCondition rule="greaterThan" value="0.0"/>
             </ByValueCondition>
           </Condition>
         </ConditionGroup>
       </StartTrigger>
     </Act>


     <Act name="DriveStraightAct">
       <ManeuverGroup name="DriveStraightManeuverGroup" maximumExecutionCount="1">
           <Actors selectTriggeringEntities="false">
               <EntityRef entityRef="Mini"/>
           </Actors>
           <Maneuver name="DriveStraightManeuver">
               <Event name="StartDriving" priority="overwrite">
                   <Action name="DriveAction">
                       <PrivateAction>
                           <LongitudinalAction>
                               <SpeedAction>
                                   <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                                   <SpeedActionTarget>
                                     <AbsoluteTargetSpeed value="13.89"/>
                                 </SpeedActionTarget>
                               </SpeedAction>
                           </LongitudinalAction>
                       </PrivateAction>
                   </Action>
             <StartTrigger>
               <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                   <ByValueCondition>
                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                   </ByValueCondition>
                 </Condition>
               </ConditionGroup>
             </StartTrigger>
           </Event>
         </Maneuver>
       </ManeuverGroup>
       <StartTrigger>
         <ConditionGroup>
           <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
             <ByValueCondition>
               <SimulationTimeCondition rule="greaterThan" value="0.0"/>
             </ByValueCondition>
           </Condition>
         </ConditionGroup>
       </StartTrigger>
     </Act>


     <Act name="DriveStraightAct">
       <ManeuverGroup name="DriveStraightManeuverGroup" maximumExecutionCount="1">
           <Actors selectTriggeringEntities="false">
               <EntityRef entityRef="Mercedes2"/>
           </Actors>
           <Maneuver name="DriveStraightManeuver">
               <Event name="StartDriving" priority="overwrite">
                   <Action name="DriveAction">
                       <PrivateAction>
                           <LongitudinalAction>
                               <SpeedAction>
                                   <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                                   <SpeedActionTarget>
                                     <AbsoluteTargetSpeed value="13.89"/>
                                 </SpeedActionTarget>
                               </SpeedAction>
                           </LongitudinalAction>
                       </PrivateAction>
                   </Action>
             <StartTrigger>
               <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                   <ByValueCondition>
                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                   </ByValueCondition>
                 </Condition>
               </ConditionGroup>
             </StartTrigger>
           </Event>
         </Maneuver>
       </ManeuverGroup>
       <StartTrigger>
         <ConditionGroup>
           <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
             <ByValueCondition>
               <SimulationTimeCondition rule="greaterThan" value="0.0"/>
             </ByValueCondition>
           </Condition>
         </ConditionGroup>
       </StartTrigger>
     </Act>


     <Act name="DriveStraightAct">
       <ManeuverGroup name="DriveStraightManeuverGroup" maximumExecutionCount="1">
           <Actors selectTriggeringEntities="false">
               <EntityRef entityRef="Mercedes"/>
           </Actors>
           <Maneuver name="DriveStraightManeuver">
               <Event name="StartDriving" priority="overwrite">
                   <Action name="DriveAction">
                       <PrivateAction>
                           <LongitudinalAction>
                               <SpeedAction>
                                   <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                                   <SpeedActionTarget>
                                     <AbsoluteTargetSpeed value="13.89"/>
                                 </SpeedActionTarget>
                               </SpeedAction>
                           </LongitudinalAction>
                       </PrivateAction>
                   </Action>
             <StartTrigger>
               <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                   <ByValueCondition>
                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                   </ByValueCondition>
                 </Condition>
               </ConditionGroup>
           </StartTrigger>
           </Event>
         </Maneuver>
       </ManeuverGroup>
       <StartTrigger>
         <ConditionGroup>
           <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
             <ByValueCondition>
               <SimulationTimeCondition rule="greaterThan" value="0.0"/>
             </ByValueCondition>
           </Condition>
         </ConditionGroup>
       </StartTrigger>
     </Act>


     <Act name="FollowMercedesAct">
         <ManeuverGroup name="FollowMercedesManeuverGroup" maximumExecutionCount="1">
             <Actors selectTriggeringEntities="false">
                 <EntityRef entityRef="Lincoln"/>
             </Actors>
             <Maneuver name="FollowMercedesManeuver">
                 <Event name="StartFollowing" priority="overwrite">
                     <Action name="FollowAction">
                         <PrivateAction>
                             <LongitudinalAction>
                                 <SpeedAction>
                                     <SpeedActionDynamics dynamicsShape="step" value="1000.0" dynamicsDimension="time"/>
                                     <SpeedActionTarget>
                                         <AbsoluteTargetSpeed value="13.89"/>
                                     </SpeedActionTarget>
                                 </SpeedAction>
                             </LongitudinalAction>
                         </PrivateAction>
                     </Action>
                     <StartTrigger>
                         <ConditionGroup>
                             <Condition name="ImmediateStart" delay="1" conditionEdge="rising">
                                 <ByValueCondition>
                                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                                 </ByValueCondition>
                             </Condition>
                         </ConditionGroup>
                     </StartTrigger>
                 </Event>
             </Maneuver>
         </ManeuverGroup>
         <StartTrigger>
             <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                     <ByValueCondition>
                         <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                     </ByValueCondition>
                 </Condition>
             </ConditionGroup>
         </StartTrigger>
     </Act>




     <Act name="PedStraightAct">
       <ManeuverGroup name="PedStraightManeuverGroup" maximumExecutionCount="1">
           <Actors selectTriggeringEntities="false">
               <EntityRef entityRef="pedestrian_1"/>
           </Actors>
           <Maneuver name="WalkStraightManeuver">
               <Event name="StartWalking" priority="overwrite">
                   <Action name="DriveAction">
                       <PrivateAction>
                           <LongitudinalAction>
                               <SpeedAction>
                                 <SpeedActionDynamics dynamicsShape="step" value="1.5" dynamicsDimension="time"/>
                                 <SpeedActionTarget>
                                   <AbsoluteTargetSpeed value="1.5"/>
                                 </SpeedActionTarget>
                               </SpeedAction>
                           </LongitudinalAction>
                       </PrivateAction>
                   </Action>
             <StartTrigger>
               <ConditionGroup>
                 <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
                   <ByValueCondition>
                     <SimulationTimeCondition rule="greaterThan" value="0.0"/>
                   </ByValueCondition>
                 </Condition>
               </ConditionGroup>
             </StartTrigger>
           </Event>
         </Maneuver>
       </ManeuverGroup>
       <StartTrigger>
         <ConditionGroup>
           <Condition name="ImmediateStart" delay="0" conditionEdge="rising">
             <ByValueCondition>
               <SimulationTimeCondition rule="greaterThan" value="0.0"/>
             </ByValueCondition>
           </Condition>
         </ConditionGroup>
       </StartTrigger>
     </Act>
    
   </Story>
   <StopTrigger>
     <ConditionGroup>
         <Condition name="criteria_CollisionTest" delay="0" conditionEdge="rising">
           <ByValueCondition>
             <ParameterCondition parameterRef="" value="" rule="lessThan"/>
           </ByValueCondition>
       </Condition>
     </ConditionGroup>
 </StopTrigger>
 </Storyboard>
</OpenSCENARIO>
```