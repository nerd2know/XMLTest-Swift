# XMLTest-Swift
I converted the sample "How to Read and Write XML Documents with GDataXML" tutorial for iOS from the Ray Wenderlich site (http://www.raywenderlich.com/725/xml-tutorial-for-ios-how-to-read-and-write-xml-documents-with-gdataxml#comments) into a Swift project.

Here are a few notes on setting up the Objective-C version of GDataXML-HTML in your XCode project written in Swift. GDataXML-HTML is available on Github, see the project and documentation at https://github.com/graetzer/GDataXML-HTML

In Finder, go to your GitHub folder for GDataXML-HTML. Navigate to the subdirectory Pod/Classes, and select GDataXMLNode.h and GDataXMLNode.m.

When you drag GDataXMLNode.m into your project, you most likely will get a prompt to configure an Objective-C bridging header. Click “Yes” to add the Objective-C bridging header to your project.

If you don't get a prompt for the bridging header, create an Objective-C header file with name starting with your XCode project's name along with “-Bridging-Header.h” at the end of the file's name. Second, in the Project navigator view on the left-hand side of your XCode project, pick the top-level project. Select the “Build Settings” view for the *.xcodeproj file. Under “Swift Compiler – Code Generation” settings group, add a setting called “Objective-C Bridging Header” (if that setting doesn't already exist). Add the bridging header file's path, relative to the root folder of the project (most likely the path will be <project name>/<project name>-Bridging-Header.h) as the value for the Objective-C Bridging Header setting.

in the Project navigator view on the left-hand side of your XCode project, pick the top-level project. Select the Build Settings view for the *.xcodeproj file. Under the Swift Compiler – Code Generation settings group, find “Other Linker Flags”. Double-click the value to edit it, and append -lxml2 to the value.

Finally, still in the Build Settings for the project, add the libxml2 header path, use $(SDKROOT)/usr/include/libxml2
