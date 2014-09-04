GlassLab SDK as3 (Flash, Flex)
==============================

This Flash and Flex compatible GlassLab SDK allows games and other applications to connect to the GlassLab Game Services platform. The primary purpose of integrating this library into your project is to track game sessions and store telemetry for those sessions.

This package includes the GlassLabSDK.swc library file, the source code, and some examples on how to use it.

Supported runtimes:
- Flash Player 10+

Libraries used:
- as3corelib (This is used for FP10 JSON compatibility. Should FP11+ be detected, native JSON functionality will be used instead for a performance boost. Note that only a small subset of this library is used: serialization.)
- as3crypto (This is used for ByteArray to/from Hex conversions.)


Integration
-----------

There are two ways you can integrate the SDK into your project: linking the .swc or using the source code directly.

1) GlassLabSDK.swc

The .swc library contains all source files required to use the SDK. To use this, add the GlassLabSDK.swc to your library paths within the .fla properties. To use the SDK classes, be sure to include the following import statement:
- import GlassLabSDK.*

2) GlassLab SDK src

The source files are also available to be included in the project. Simply drop the GlassLabSDK folder in an appropriate folder and include the following import statement in the file you wish to reference it from:
- import GlassLabSDK.*

The primary source class containing the core functionality of the SDK is *glsdk_core.as*. This class is responsible for communicating requests to the server and intercepting response messages to be communicated back to the client. This class creates the respective dispatch and response objects using the *glsdk_dispatch.as* and *glsdk_response.as* classes. Finally, refer to *glsdk_const.as* for information on routes and other constants.


Initialize the SDK and establish a connection
---------------------------------------------

In order to begin using the SDK, you must first create the SDK object and establish a connection. It is recommended to use the sample API, *glsdk.as*, as a starting point. In this sample, we subclassed *glsdk_core.as* and treated it as a singleton which allows for ease of access throughout the project. Finally, to connect to the server, simply call *SDK.connect( gameId, deviceId, serverURI )* and pass in the appropriate information:
- gameId: in order for the server to accept telemetry, a valid game Id must be provided. Game Ids are provided to developers when they register for GlassLab Game Services.
- deviceId: leave this field marked as "test_device".
- serverURI: this is the server the game will make requests to.


API subclass
------------

It is recommended to create an API subclass that inherits from glsdk_core.as in order to make calls to the SDK and receive response information from the server.

Recommended functions to utilize:
- startSession
- endSession
- saveTelemEvent
- popMessageQueue

When popMessageQueue is called the *glsdk_core.as* base class will return the first received response message from the server with a message type and associated JSON data. A list of possible messages can be found in *glsdk_cosnt.as*.

As mentioned above, use the *glsdk.as* subclass example as a starting point, which contains sample code for each of the above recommended functions.


Sample API
----------

A sample API is provided in the examples folder.

To use this sample, focus the canvas and use the following keys:
- start a session with S
- end the session with E
- send telemetry with T

Success and failure from the server is determined by order of calls received. Keep the following in mind:
- You cannot send telemetry if no session is active. Call start session first.
- You cannot close a session that doesn't exist. Call start session first.


Telemetry Format and Examples
-----------------------------

Adding custom telemetry to the server message queue is fairly straightforward and allows for some flexibility. Telemetry events adhere to a specific data schema that the SDK will construct automatically. When creating a new telemetry event to be sent to the system, the user specifies the name of the event and as many custom parameters as necessary. Telemetry events can be as  simple as triggers, containing no custom paramters:
- "Player_jump" : {}
 
Or they can be more descriptive and reusable:
- "Player_take_damage" : { amount : "10" }

The SDK functions required to write telemetry events are as follows:
- addTelemEventValue_string( key, value )
- addTelemEventValue_int( key, value )
- addTelemEventValue_uint( key, value )
- addTelemEventValue_bool( key, value )
- addTelemEventValue_number( key, value )
- saveTelemEvent( eventName )

The "addTelemEventValue_[type]" functions allow for custom parameters to be sent with each telemetry event and are therefore not required. In the above example, we created a parameter keyed as "amount" with the value "10". It is important to note that the telemetry parameters must be added before a telemetry event is saved. These parameters are simply stored locally until "saveTelemEvent( eventName )" is called, at which point they are appended to the event named "eventName" and then reset.

The code below demonstrates how we can write the aforementioned telemetry examples:

```
// Send the "Player_take_damage" event with amount parameter
SDK.addTelemEventValue_int( "amount", 10 );
SDK.saveTelemEvent( "Player_take_damage" );

// Send the "Player_jump" event
SDK.saveTelemEvent( "Player_jump" );
```

Note that the parameter "amount" with value "10" will not be sent along with the "Player_jump" event because it was flushed after the "Player_take_damage" event was saved.

You can also add a telemetry event with parameters with a single line of code, using the "saveTelemEventWithData" function. This function accepts the event name and a generic data object as parameters. The "Player_take_damage" example above can be rewritten like so:

```
// Send the "Player_take_damage" event with amount parameter
SDK.saveTelemEventWithData( "Player_take_damage", { "amount" : 10 } );
```

A few more examples:

```
// The player selected the "Read More" Icon in the game
SDK.saveTelemEvent( "action_Read_More" );

// The player explains reasoning using the wheel interface
// Her reasoning was considered correct
SDK.addTelemEventValue_bool( "correct", true );
SDK.saveTelemEvent( "RWheel" );
```


Achievements
------------

Achievements are one piece of the reporting on GlassLab Game Services. This information will come from the game and all logic governing achievements must be defined there, but the SDK can be used to send recorded achievements to the server. They go through the same pipeline as telemetry and can be triggered with the "saveAchievement" function. The SDK requires three unique parameters for each achievement:
- item (the name of the achievement)
- group (the primary standard this achievement is associated with)
- subgroup (the standard sub-type)

The developer is responsible for defining the achievements and must register them through the developer portal with their game. Successful registration will return the appropriate item, group, and subGroup values that can be used in-game and that the server will accept as valid.

The sample API has an example achievement defined that the server currently accepts for GlassLab's Mars Generation One iPad game. It is written as such:

```
// Send the Core Cadet achievement
SDK.saveAchievement( "Core Cadet", "CCSS.ELA-Literacy.WHST.6-8.1", "b" );
```

You can also access acceptable achievements for your game with the "getAchievements()" SDK function. Be sure to intercept the response with the "popMessageQueue()" function and check for the "glsdk_const.MESSAGE_GET_ACHIEVEMENTS" message. See the sample API for more details.


Game Saves
----------

You can also record and access game saves per user with two simple functions:
- getSaveGame()
- postSaveGame( object:Object )

Note that you must be authenticated with the server in order to get and send save games. The AS3 SDK allows you to save games in generic Object format or binary format. To save games in binary format, use the "postSaveGameBinary( bytes:ByteArray )" function and pass in a ByteArray as the parameter. The SDK will convert this to hex format and send it to the server.
