Kiip PhoneGap Plugin v3.0.0
===============================

A Cordova plugin for the Kiip SDK. Supports the latest iOS and Android versions.
Updated by Sean Macfarlane.

This plugin has been [forked] [https://github.com/kiip/phonegap-plugin] and updated to work as a Cordova plugin easily. As well as to work with the latest iOS and Android platforms

Installation
------------------------------
cordova plugin add https://github.com/sean-macfarlane/phonegap-plugin.git

Usage Instructions
-------------------

1. To use the SDK you will need to initialize Kiip by doing:

    	kiip.init(api_key, api_secret, successCallback, failureCallback);

2. You can save a moment by doing:

    	kiip.saveMoment(moment_id, successCallback, failureCallback);

3. You can also listen in for virtual currency or swarms by implementing the following callbacks:

		kiip.listenContent(onContentCallback);
    	kiip.listenSwarm(onSwarmCallback);


Help!
------

This plugin is officially supported by the Kiip Support team. If you need a hand you can reach us at [docs.kiip.me] [kiip.me]

Licence
------------------------------

The MIT License

Copyright (c) 2012 Kiip Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[phonegap-guide-android]: http://docs.phonegap.com/en/2.2.0/guide_getting-started_android_index.md.html#Getting%20Started%20with%20Android
[phonegap-guide-ios]: http://docs.phonegap.com/en/2.2.0/guide_getting-started_ios_index.md.html#Getting%20Started%20with%20iOS
[docs.kiip.me]: https://docs.kiip.me/
[resume]: http://docs.phonegap.com/en/2.2.0/cordova_events_events.md.html#resume
[pause]: http://docs.phonegap.com/en/2.2.0/cordova_events_events.md.html#pause
[kiip.me]: http://docs.kiip.com/#support
