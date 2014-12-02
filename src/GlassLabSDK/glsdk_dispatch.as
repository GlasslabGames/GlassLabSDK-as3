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
* glsdk_dispatch.as
* GlassLab SDK
*
* A dispatch object represents the data that will be sent along with an HTTP request.
* The dispatch is used internally and defines callback functions for server responses.
*
* @author Ben Dapkiewicz
*
* Copyright (c) 2014 GlassLab. All rights reserved.
*/
package GlassLabSDK {
	
	public class glsdk_dispatch {

		public var m_path : Object;					// The API key and path
		public var m_method : String;				// The method type (GET or POST)
		public var m_postData : Object;				// The post data.
		public var m_contentType : String;			// The content type.
		public var m_successCallback : Function;	// A callback function indicating a successful request.
		public var m_failureCallback : Function;	// A callback function indicating a failed request.
		
		
		/**
		* Parameterized constructor requires all fields for a successful dispatch.
		*
		* @param p_path The API key and path.
		* @param p_method The method type.
		* @param p_postData The post data. This can be blank or an empty JSON object.
		* @param p_contentType The content type.
		* @param p_successCallback The success callback function.
		* @param p_failureCallback The failure callback function.
		*/
		public function glsdk_dispatch( p_path:Object, p_method:String, p_postData:Object, p_contentType:String, p_successCallback:Function, p_failureCallback:Function ) {
			m_path = p_path;
			m_method = p_method;
			m_postData = p_postData;
			m_contentType = p_contentType;
			m_successCallback = p_successCallback;
			m_failureCallback = p_failureCallback;
		}
	}
}