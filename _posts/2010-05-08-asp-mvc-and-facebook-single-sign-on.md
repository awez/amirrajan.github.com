---
title: Facebook Platform OAuth 2.0 Protocol and ASP.NET MVC
category: code
layout: post
tags : [facebook, asp.net mvc]
---
<p>
    The Facebook Platform allows external websites the ability to leverage user accounts that exist in Facebook...<a href="http://en.wikipedia.org/wiki/Single_sign-on" target="_blank">click here for an explanation of single sign-on</a>.
</p>

<h3>What's Covered</h3>
<p>
    After figuring out the protocol and what Facebook expected and returned, the implementation of the protocol in ASP.NET MVC was a piece of cake (for the most part...).  This post will show you:
</p>
<ul>
    <li>How to register your website with Facebook.</li>
    <li>How to configure your Facebook enabled website.</li>
    <li>How to authenticate using Facebook's OAuth 2.0 Protocol.</li>
    <li>How to get user information after the Facebook user has logged in successfully.</li>
    <li>How to log out of Facebook programmatically.</li>
    <li><strong style="font-size: 1.2em">If you are going to leverage the oAuth protocol in a Facebook Canvas App, you need to also read <a href="facebook-oauth-authentication-and-iframe-apps">this blog post</a></strong></li>
</ul>

<h3>Registering Your Website With Facebook</h3>
<p>
   Here are the steps for setting up for your app to communicate with Facebook's Single Sign-on Protocol.  First thing you have to do is register with Facebook (as a person...company pages cannot have apps...).
</p>
<p>
   After you yourself have registered and have exposed yourself to the <a href="http://www.youtube.com/watch?v=7XhzYGoBif8" target="_blank">Facebook conspiracy</a> (I kid, I kid), you then have to add the Developer App to your profile.<br/>
</p>
<image src="/assets/images/facebook_OAuth_step1.png" style="border: solid 1px silver; padding: 3px;" />
<p>
    After you have authorized the Developer App, you can add your website (click the "Set Up New Application" button and set up your app as follows).
</p>
<image src="/assets/images/facebook_OAuth_step2.png" style="border: solid 1px silver; padding: 3px;" />
<p>
    Things you have to set up.<br/><br/>Basic Information (make sure to make note of your <strong>Application ID, API Key, and your Secret Key</strong>):
</p>
<image src="/assets/images/facebook_OAuth_step3.png" style="border: solid 1px silver; padding: 3px;" />

<p>
    Authentication Information:
</p>
<image src="/assets/images/facebook_OAuth_step4.png" style="border: solid 1px silver; padding: 3px;" />

<p>
    Connect Information: (your Connect URL is what Facebook will use to ensure a connection is coming in from you and not some 3rd party)<br/><br/><strong>Also, make sure you keep your connect url as ALL LOWERCASE.  The connect url is case sensitive so any reference to this connect url must be IDENTICAL to what you've provided to Facebook.</strong>
</p>

<image src="/assets/images/facebook_OAuth_step5.png" style="border: solid 1px silver; padding: 3px;" />

<h3>Authenticating With Facebook</h3>
<p>
   Now comes the fun part.  Facebook has provided documentation of the <a href="http://developers.facebook.com/docs/authentication/" target="_blank">[authentication process]</a> (which wouldn't hurt to read).  Here is a summary of what you have to do to have a successful "handshake" with Facebook:
</p>
<ol>
    <li>Place a "Sign In With Facebook" link on your authentication page.</li>
    <li>The user will click the link which will redirect them to Facebook for authentication.</li>
    <li>After authenticating, the user will be required to Authorize your App.</li>
    <li>After authorization, Facebook will redirect back to your website, with a token representing the <strong>authenticated Facebook session</strong>.</li>
    <li>Taking this token, you will need to request an <strong>access token from Facebook's Graph API Service</strong>.</li>
    <li>If token exchange is successful, you will be given an access token that you can then use with the Graph API.</li>
    <li><strong>Using the Graph API, you then can query for the user's holy grail...the UserId...</strong></li>
    <li>You can save this UserId to your database and "go to town" relating "stuff" to it!</li>
</ol>

<h3>The Code</h3>
<p>
   Alright.  You've registered your website with Facebook.  And you understand (at least at a high level) what is involved with performing a successful handshake.  Now it's time to implement that handshake in ASP.NET MVC.
</p>

<h4>Step 1: Create a Controller Action that Redirects to Facebook</h4>
<p>
   Per the Facebook documentation, you have to redirect to: <strong>https://graph.facebook.com/oauth/authorize</strong> to get things started.  There are 3 query string parameters you have to include with this URL:
</p>

<ul>
  <li>client_id: this is your Application ID</li>
  <li>redirect_uri: this is the URI Facebook will redirect to after authentication is successful.  <strong>This URI must be prefixed with the Connect URL that you provided to Facebook and is case sensitive.</strong>  The redirect_uri will be a controller action we provide in our ASP.NET MVC application.</li>
  <li>type: there are two options for this, you can do user_agent or web_server as the type.  Because we are not Authentication via javascript/asynchronously, we will use the web_server option.</li>
</ul>

<p>
    Here is the controller action for redirecting to Facebook:
</p>

<pre>
[HttpGet]
[ActionName("FacebookLogin")]
public ActionResult FacebookLogin()
{
     //redirect to https://graph.facebook.com/oauth/authorize giving Facebook my application id, the request type and the redirect url
     return new RedirectResult("https://graph.facebook.com/oauth/authorize? type=web_server&amp; client_id=114756055226487&amp; redirect_uri=http://www.examplewebsite.com/facebook/handshake/");
}
</pre>

<p>
    Here is the html for the action link.
</p>

<pre name="code" class="html">
&lt;% string facebookLoginUrl = Url.RouteUrl(new { controller = "Authentication", action = "FacebookLogin" }); %&gt;
&lt;a href="&lt;%= facebookLoginUrl %&gt;"&gt;log in with Facebook&lt;/a&gt;
</pre>

<h4>Step 2: Handle the redirect from Facebook</h4>
<p>
    The redirect will take the user to a Facebook login screen.  If the login is successful (and if the user authorizes your application), <strong>Facebook will redirect back to the url that was provided in the redirect_uri query string parameter with an access code for the Facebook session</strong>.  For this example the Facebook redirect url to something like: 
</p>

<pre name="code" class="c#">
http://www.examplewebsite.com/facebook/handshake/?code=2.DQUGad7_kFVGqKTeGUqQTQ__.3600.1273809600-1756053625|dil1rmAUjgbViM_GQutw-PEgPIg.
</pre>

<p>
    Alright.  Let's keep the end goal in mind and work backwards.  What we're trying to get from Facebook is a UserId.  The UserId will always be the same for a given user.  And of course, if we have the UserId, we can start relating stuff to it (such as profile information).  <strong>Here is the workflow (working backwards) for getting the UserId:</strong>
</p>
<ul>
    <li>GOAL: We have the UserId.</li>
    <li>To get the UserId, we need to deserialize the JSON object that gets returned from Facebook's Graph Api.</li>
    <li>To get the JSON object that contains the UserId, we need to perform an HTTP/GET to the following Graph Api URI: <strong>https://graph.facebook.com/me</strong>.</li>
    <li>To perform an HTTP/GET against the Graph Api, which will give us a JSON serialization of the user, which we'll deserialize to get the UserId...we need an access token.</li>
    <li>THIS IS WHERE WE ARE AT: To get the access token, which will allow us to do the HTTP/GET against the Graph API, which will give us the JSON representation of the user, which will then be deserialized to get the UserId....we need to request an access token from the following uri: <strong>https://graph.facebook.com/oauth/access_token</strong>.  And with that uri, we need to pass the session key provided by Facebook, our Application ID, our Secret Key, and a redirect URL.  When we perform the HTTP/GET with all this information.  We will have our access token.</li>
</ul>

<p>
   The workflow make sense?  Good.  Here is the code:
</p>

<pre name="code">
//this is the statically typed representation of the JSON object that will get returned from: https://graph.facebook.com/me
public class FacebookUser
{
    public long id { get; set; } //yes. the user id is of type long...dont use int
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string name { get; set; }
    public string email { get; set; }

}

//this controller action will be called when Facebook redirects
[HttpGet]
[ActionName("handshake")]
public ActionResult Handshake(string code)
{
     //after authentication, Facebook will redirect to this controller action with a QueryString parameter called "code" (this is Facebook's Session key)

     //example uri: http://www.examplewebsite.com/facebook/handshake/?code=2.DQUGad7_kFVGqKTeGUqQTQ__.3600.1273809600-1756053625|dil1rmAUjgbViM_GQutw-PEgPIg.

    //this is your Facebook App ID
    string clientId = "114756055226487";
    
    //this is your Secret Key
    string clientSecret = "YOURSECRETKEY";

    //we have to request an access token from the following Uri
    string url = "https://graph.facebook.com/oauth/access_token?client_id={0}&amp;redirect_uri={1}&amp;client_secret={2}&amp;code={3}";

    //your redirect uri must be EXACTLY the same Uri that caused the initial authentication handshake
    string redirectUri = "http://www.examplewebsite.com/facebook/handshake/"; 

    //Create a webrequest to perform the request against the Uri
    WebRequest request = WebRequest.Create(string.Format(url, clientId, redirectUri, clientSecret, code));
    
    //read out the response as a utf-8 encoding and parse out the access_token
    WebResponse response = request.GetResponse();
    Stream stream = response.GetResponseStream();
    Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
    StreamReader streamReader = new StreamReader(stream, encode);
    string accessToken = streamReader.ReadToEnd().Replace("access_token=", "");
    streamReader.Close();
    response.Close();

    //set the access token to some session variable so it can be used through out the session
    Session["FacebookAccessToken"] = accessToken;

    //now that we have an access token, query the Graph Api for the JSON representation of the User
    string url = "https://graph.facebook.com/me?access_token={0}";

    //create the request to https://graph.facebook.com/me
    request = WebRequest.Create(string.Format(url, accessToken));

    //Get the response
    response = request.GetResponse();

    //Get the response stream
    Stream stream = response.GetResponseStream();

    //Take our statically typed representation of the JSON User and deserialize the response stream
    //using the DataContractJsonSerializer
    DataContractJsonSerializer dataContractJsonSerializer = new DataContractJsonSerializer(typeof(FacebookUser));
    FacebookUser user = new FacebookUser();
    user = dataContractJsonSerializer.ReadObject(stream) as FacebookUser;

    //close the stream
    response.Close();

    //capture the UserId
    Session["FacebookUserId"] = user.id;

    //Set the forms authentication auth cookie
    FormsAuthentication.SetAuthCookie(user.email, false);

    //redirect to home page so that user can start using your application      
    return RedirectToAction("Home", "User");
}
</pre>

<p>
    Whew.  Great.  User is authenticated.  Now you can use any resource provided by <a href="http://developers.facebook.com/docs/reference/api/" target="_blank">[Facebook's Graph Api]</a>.  All entities returned for the Graph Api are JSON objects...so all you have to do is create a static representation of the JSON entity in C# and use the DataContractJsonSerializer to deserialize the response stream (as demonstrated above).
</p>

<h3>Logging Out of Facebook Programmatically</h3>
<p>
   OAuth is a great authentication protocol.....too bad Facebook hasn't provided any restful way to logout and purge any Facebook session cookies...so we have two options.
</p>

<ol>
    <li>Logout via javascript using Facebooks Javascript SDK.</li>
    <li>Redirect to Facebook's logout page (this approach is not documented and Facebook may change it without giving the developer community notice).</li>
</ol>

<h3>Logging Out with the Javascript Facebook SDK</h3>
<p>
   Here is how you log out of Facebook.  Remember, even if you do FormsAuthentication.Logout(), the user <strong>is still logged into Facebook (so you must sign out of Facebook also to ensure user privacy)</strong>.
</p>

<p>
   Since this is Javascript based, you need to have a controller action that just redirects to a view page:
</p>

<pre name="code" class="c#">
[ActionName("FacebookLogout")]
[HttpGet]
public ActionResult FacebookLogout()
{
    FormsAuthentication.SignOut();
    return View();
}
</pre>

<p>
   This is what the view code will look like (it's very....hackish...unfortunately...but each piece of html is needed....maybe one day Facebook will stream line this...):
</p>

<pre name="code" class="html">
&lt;%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %&gt;

&lt;asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"&gt;
    FacebookLogout
&lt;/asp:Content&gt;
&lt;asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"&gt;
    &lt;!-- this is a message to show while the javascript executes --&gt;
    Logging you out of Facebook....

    &lt;!-- reference to google's jquery ui library --&gt;
    &lt;script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"&gt;&lt;/script&gt;

    &lt;!-- this div element is required...I have no idea why...but when i remove it, the log out doesn't occur --&gt;
    &lt;div id="fb-root"&gt;
    &lt;/div&gt;

    &lt;!-- pull down Facebook's Javascript SDK --&gt;
    &lt;script src="http://connect.facebook.net/en_US/all.js"&gt;&lt;/script&gt;

    &lt;!-- execute the following script immediately when the page loads --&gt;
    &lt;script&gt;
        // initialize the library with your Facebook API key
        FB.init({ apiKey: 'f3ff8e4ed6becc81176d0b2517c9c44c' });

        // fetch the status so that we can log out,  once the login status is fetched, call handleSessionResponse
        FB.getLoginStatus(handleSessionResponse);

        // handle a session response from any of the auth related calls
        function handleSessionResponse(response) {
            // if we dont have a session (which means the user has been logged out, redirect the user)
            if (!response.session) {
                window.location = "http://www.examplewebsite.com/Authentication/Login/";
                return;
            }

            //if we do have a non-null response.session, call FB.logout(),
            //the JS method will log the user out
            //of Facebook and remove any authorization cookies
            FB.logout(handleSessionResponse);
        }
    &lt;/script&gt;

&lt;/asp:Content&gt;
</pre>

<h3>Logging Out of Facebook Using a Redirect</h3>
<p>
   Alternately (if you dont like the Javascript approach).  You can log out of Facebook by redirecting to their logout.php page.  Please keep in mind that this approach isn't documented.  I used Fiddler2 to see how the Javascript SDK did it's log out magic....so just keep in mind that Facebook can change this anytime without prior notice.
</p>

<p>
    To log out, just redirect to logout.php with your Api Key and the Original Session Key that was provided in the first handshake...the session code/key...not the Graph API Access Token:
</p>

<pre name="code" class="c#">
[ActionName("FacebookLogout")]
[HttpGet]
public ActionResult FacebookLogout()
{
    string url = "http://www.facebook.com/logout.php?api_key=f3ff8e4ed6becc81176d0b2517c9c44c&amp;session_key={0}";
    
    //the Facebook session token is passed in, this was the token that was given to you immediately after Facebook authenticated the user
    return new RedirectResult(string.Format(url, Session["FacebookSessionToken"]));
}
</pre>

<h3>Summary</h3>
<p>
    That's really all there is to Facebook's Single Sign-On.  If you have any questions, don't hesitate to email me (my email address is located at the bottom of the "about" page).
</p>

