component {
    /*
        Application variables
        https://wikidocs.adobe.com/wiki/display/coldfusionen/Application+variables
    */
    this.name = "YourAppName" & hash(getCurrentTemplatePath());
    this.applicationTimeout = createTimeSpan(1,0,0,0);
    this.sessionTimeout = createTimeSpan(1,0,0,0);
    this.sessionManagement = true;
    this.setClientCookies = false;

    /*
        onApplicationStart
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onApplicationStart
        First function run when ColdFusion receives the first request for a page in the application.
    */
    public boolean function onApplicationStart() {
        return true;
    }

    /*
        onApplicationEnd
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onApplicationEnd
        Last function run when Application times out or server is shut down.
    */
    public void function onApplicationEnd(struct applicationScope={}) {
        return;
    }

    /*
        onSessionStart
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onSessionStart
        Run when first setting up a session.
    */
    public void function onSessionStart() {
        return;
    }

    /*
        onSessionEnd
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onSessionEnd
        Run when a session ends.
    */
    public void function onSessionEnd(required struct sessionScope, struct applicationScope={}) {
        return;
    }

    /*
        onRequestStart
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequestStart
        First page-processing function run when a page request starts.
        Return False to prevent ColdFusion from processing the request.
    */
    public boolean function onRequestStart(required string targetPage) {
        return true;
    }

    /*
        onRequest
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequest
        Runs when a request starts, after the onRequestStart event handler.
        This method is optional. If you implement this method, it must explicitly call the requested page to process it.
    */
    public void function onRequest(required string targetPage) {
        include arguments.targetPage;
        return;
    }

    /*
        onCFCRequest
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onCFCRequest
        Intercepts any HTTP or AMF calls to an application based on CFC request.
        Whereas onRequest handles only requests made to ColdFusion templates, this function controls Ajax, Web Service, and Flash Remoting requests.
    */
    public void function onCFCRequest(string cfcname, string method, struct args) {
        return;
    }

    /*
        onRequestEnd
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onRequestEnd
        Runs at the end of a request, after all other CFML code.
    */
    public void function onRequestEnd() {
        return;
    }

    /*
        onAbort
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onAbort
        Runs when you execute the CFML tag cfabort or cfscript "abort".
        If showError attribute is specified in cfabort, onError method is executed instead of onAbort.
        When using cfabort, cflocation, or cfcontent tags, the onAbort method is invoked instead on onRequestEnd.
    */
    public void function onAbort(required string targetPage) {
        return;
    }

    /*
        onError
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onError
        Runs when an uncaught exception occurs in the application.
        This method overrides any error handlers that you set in the ColdFusion Administrator or in cferror tags. It does not override try/catch blocks.
    */
    public void function onError(required any exception, required string eventName) {
        return;
    }

    /*
        onMissingTemplate
        https://wikidocs.adobe.com/wiki/display/coldfusionen/onMissingTemplate
        Runs when a request specifies a non-existent CFML page.
        True, or no return value, specifies that the event has been processed. If the function returns false, ColdFusion invokes the standard error handler.
    */
    public boolean function onMissingTemplate(required string targetPage) {
        return true;
    }
}
