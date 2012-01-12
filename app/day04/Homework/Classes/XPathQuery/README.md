[XPathQuery](http://cocoawithlove.com/2008/10/using-libxml2-for-parsing-and-xpath.html)
===

### Setup

- Under **Build Settings → Header Search Paths** add **/usr/include/libxml2**
- In **Build Phases → Link Binary With Libraries** include **libxml2.dylib**

### Usage

    PerformHTMLXPathQuery(NSData *document, NSString *query)

### More Info

- http://cocoawithlove.com/2008/10/using-libxml2-for-parsing-and-xpath.html
- http://cocoawithlove.com/2008/09/cocoa-application-driven-by-http-data.html
- http://www.w3schools.com/xpath/default.asp

### Copyright

Created by Matt Gallagher on 4/08/08.
Copyright 2008 Matt Gallagher. All rights reserved.

Permission is given to use this source code file, free of charge, in any project, commercial or otherwise, entirely at your risk, with the condition that any redistribution (in part or whole) of source code must retain this copyright and permission notice. Attribution in compiled projects is appreciated but not required.
