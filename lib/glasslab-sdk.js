(function() {

  function _GlassLabSDK() {
    this.httpRequest = null;
    this._displayLogs = this._getDisplayLogsStore();
  }

  _GlassLabSDK.prototype.displayLogs = function() {
    this._displayLogs = true;
    this._updateDisplayLogsStore();
  };

  _GlassLabSDK.prototype.hideLogs = function() {
    this._displayLogs = false;
    this._updateDisplayLogsStore();
  };


  _GlassLabSDK.prototype.request = function( params ) {

    if(this._displayLogs) {
      console.log("GlassLabSDK request - params:", params);
    }

    // Create the XML http request for the SDK call
    this.httpRequest = new XMLHttpRequest();

    // Set the object parameters and open the request
    this.httpRequest.apiKey = params.key;
    this.httpRequest.open( params.method, params.api, true );
    this.httpRequest.setRequestHeader( "Content-type", params.contentType );
    this.httpRequest.setRequestHeader( "Game-Secret", params.gameSecret );

    // Set the callback
    var _this = this;
    this.httpRequest.onreadystatechange = function(){
      _this.response(this);
    };

    // Make the request
    this.httpRequest.send( params.data );
  }

  _GlassLabSDK.prototype.response = function(httpRequest) {
    if(this._displayLogs) {
      console.log("GlassLabSDK response - apiKey:", httpRequest.apiKey, ", responseText:", httpRequest.responseText);
    }

    // Check for completed requests
    if (httpRequest.readyState === 4) {

      // OK status, send the success callback
      if (httpRequest.status === 200 || httpRequest.status === 304) {
        document.getElementsByName( "flashObj" )[0].success( httpRequest.apiKey, httpRequest.responseText );
      }
      // All other status codes will return a failure callback
      else {
        document.getElementsByName( "flashObj" )[0].failure( httpRequest.apiKey, httpRequest.responseText );
      }
    }
  }

  // Private
  _GlassLabSDK.prototype._updateDisplayLogsStore = function() {
    if(typeof(Storage) !== "undefined") {
      localStorage.setItem("displayLogs", this._displayLogs ? 1 : 0);
    }
  };
  _GlassLabSDK.prototype._getDisplayLogsStore = function() {
    var display = false;
    if(typeof(Storage) !== "undefined") {
      if(localStorage.getItem("displayLogs")) {
        display = parseInt(localStorage.getItem("displayLogs"));
        if(isNaN(display)) {
          display = false;
        }
      }
    }

    return display;
  };

  window.GlassLabSDK = new _GlassLabSDK();
})();