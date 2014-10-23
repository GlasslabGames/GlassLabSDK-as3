/*

Copyright (c) 2014, GlassLab, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies, 
either expressed or implied, of the FreeBSD Project.

*/


/**
* glsdk_const.as
* GlassLab SDK
*
* This class represents all of the static and constant information used by
* the GlassLab Core class. This includes the SDK version, API paths, content
* types, and response values.
*
* @author Ben Dapkiewicz
*
* Copyright (c) 2014 GlassLab. All rights reserved.
*/
package GlassLabSDK {
	
	public class glsdk_const {

		public static const SDK_VERSION : String = "1.2.1";
		
		public static const API_CONNECT					: Object = { KEY: "connect",				API: "/sdk/connect" };
		public static const API_GET_CONFIG 				: Object = { KEY: "getConfig", 				API: "/api/v2/data/config/:gameId" };
		public static const API_GET_AUTH_STATUS 		: Object = { KEY: "getAuthStatus", 			API: "/api/v2/auth/login/status" };
		public static const API_POST_DEVICE_UPDATE 		: Object = { KEY: "deviceUpdate", 			API: "/api/v2/data/game/device" };
		public static const API_GET_PLAYER_INFO 		: Object = { KEY: "getPlayerInfo", 			API: "/api/v2/data/game/:gameId/playInfo" };
		public static const API_POST_TOTAL_TIME_PLAYED 	: Object = { KEY: "sendTotalTimePlayed", 	API: "/api/v2/data/game/:gameId/totalTimePlayed" };
		public static const API_GET_PLAY_SESSION_START 	: Object = { KEY: "startPlaySession", 		API: "/api/v2/data/playSession/start" };
		public static const API_POST_SESSION_START 		: Object = { KEY: "startSession", 			API: "/api/v2/data/session/start" };
		public static const API_POST_SESSION_END 		: Object = { KEY: "endSession", 			API: "/api/v2/data/session/end" };
		public static const API_POST_EVENTS 			: Object = { KEY: "sendTelemEvents", 		API: "/api/v2/data/events" };
		public static const API_GET_ACHIEVEMENTS 		: Object = { KEY: "getAchievements", 		API: "/api/v2/dash/game/:gameId/achievements/all" };
		public static const API_POST_ACHIEVEMENTS 		: Object = { KEY: "saveAchievement", 		API: "/api/v2/data/game/:gameId/achievement" };
		public static const API_GET_SAVE_GAME 			: Object = { KEY: "getSaveGame", 			API: "/api/v2/data/game/:gameId" };
		public static const API_POST_SAVE_GAME 			: Object = { KEY: "postSaveGame", 			API: "/api/v2/data/game/:gameId" };
		
		public static const CONTENT_TYPE_APPLICATION_JSON					: String = "application/json";
		public static const CONTENT_TYPE_APPLICATION_X_WWW_FORM_URLENCODED	: String = "application/x-www-form-urlencoded";
		
		public static const MESSAGE_CONNECT 				: int = 0;
		public static const MESSAGE_GET_CONFIG				: int = 1;
		public static const MESSAGE_AUTH_STATUS				: int = 2;
		public static const MESSAGE_DEVICE_UPDATE 			: int = 3;
		public static const MESSAGE_GET_PLAYER_INFO			: int = 4;
		public static const MESSAGE_POST_TOTAL_TIME_PLAYED	: int = 5;
		public static const MESSAGE_SESSION_START 			: int = 6;
		public static const MESSAGE_SESSION_END 			: int = 7;
		public static const MESSAGE_EVENTS 					: int = 8;
		public static const MESSAGE_GET_ACHIEVEMENTS 		: int = 9;
		public static const MESSAGE_POST_ACHIEVEMENT 		: int = 10;
		public static const MESSAGE_GET_SAVE_GAME 			: int = 11;
		public static const MESSAGE_POST_SAVE_GAME 			: int = 12;
		public static const MESSAGE_ERROR 					: int = 13;
		
		public static const UPDATE_TIMER				: int = 3;	// Update function is called at this interval
		public static const TELEMETRY_DISPATCH_CHUNK 	: int = 32;	// Dispatch a number of telemetry events per tick
		
		public static const THROTTLE_PRIORITY_DEFAULT : int = 10;		// Default priority level for throttling telemetry
		public static const THROTTLE_INTERVAL_DEFAULT : int = 30000;	// Default request interval to throttle telemetry (milliseconds)
		public static const THROTTLE_MIN_SIZE_DEFAULT : int = 5;		// Minimum number of events to reach before sending telemetry
		public static const THROTTLE_MAX_SIZE_DEFAULT : int = 100;		// Maximum number of events reached will send telemetry
	}
}