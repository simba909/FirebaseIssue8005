#  Firebase issue 8005 sample

This sample project uses the semi-recently release Firebase 8.14.0 SPM distribution (via the [awesome SPM distribution by akaffenberger](https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks)) with the following SDKs:

 - FirebaseAnalytics
 - FirebaseFirestore

along with all the necessary dependencies for each SDK. The `-ObjC` linker flag is also set.

Steps to reproduce the issue:

 - Add a valid `Google-Info.plist` file for a Firebase project to the Xcode project navigator
 - Open `ContentView.swift`
 - ~In the preview pane on the right hand side, click the little "Play" icon on the top left of the simulator (after first clicking the "Resume" button)~
    - As of Xcode 13.3, simply opening `ContentView.swift` with the Preview Pane open will trigger the issue and a "Problem Report for FirebaseIssue8005" window will open with the details of the crash.
 
~This should try to start the live SwiftUI preview, which in most cases will crash. If it doesn't crash immediately try
running the app in the simulator, then try the previews again. Sometimes it requires a little bit of back-and-forth
before the issue reproduces, but after the first time it will happen repeatedly.~

~Usually the SwiftUI preview doesn't show you _why_ it crashed, so you need to look for the crash logs in:~

~`~/Library/Logs/DiagnosticReports`~

~where they will be named `FirebaseIssue8005_<date>_<hostname>.crash` (for this project).~

Edit: As of Xcode 13.3 there is no longer a need to go looking for the crash report - it will show up automatically.

Video that shows the issue:

https://user-images.githubusercontent.com/1217839/120623203-d1756100-c45f-11eb-8b3e-01a3cf9c2c7e.mov

Sample crash log:

```
Process:               FirebaseIssue8005 [72466]
Path:                  /Users/USER/Library/Developer/Xcode/UserData/Previews/Simulator Devices/4631766E-9C43-461C-8EB6-2B639CEE6CB0/data/Containers/Bundle/Application/876F748F-5A04-48BE-8CE7-4E7E9A656B20/FirebaseIssue8005.app/FirebaseIssue8005
Identifier:            FirebaseIssue8005
Version:               1.0 (1)
Code Type:             ARM-64 (Native)
Parent Process:        launchd_sim [71416]
Responsible:           SimulatorTrampoline [14030]
User ID:               501

Date/Time:             2021-06-03 11:21:53.099 +0200
OS Version:            macOS 11.4 (20F71)
Report Version:        12
Anonymous UUID:        F93B1C6C-FB25-3318-6C72-1454398C835A

Sleep/Wake UUID:       0C7E3AEF-C47E-48C7-A72B-1F756CDBF406

Time Awake Since Boot: 650000 seconds
Time Since Wake:       5600 seconds

System Integrity Protection: enabled

Crashed Thread:        3  Dispatch queue: com.google.GDTCCTUploader

Exception Type:        EXC_CRASH (SIGABRT)
Exception Codes:       0x0000000000000000, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Application Specific Information:
dyld: in dladdr()
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[FBLPromise HTTPBody]: unrecognized selector sent to instance 0x6000001c65b0'
terminating with uncaught exception of type NSException
abort() called
CoreSimulator 757.5 - Device: iPhone 12 Pro (4631766E-9C43-461C-8EB6-2B639CEE6CB0) - Runtime: iOS 14.5 (18E182) - DeviceType: iPhone 12 Pro

Application Specific Backtrace 1:
0   CoreFoundation                      0x00000001803f7978 __exceptionPreprocess + 236
1   libobjc.A.dylib                     0x0000000180188800 objc_exception_throw + 56
2   CoreFoundation                      0x0000000180406f14 +[NSObject(NSObject) instanceMethodSignatureForSelector:] + 0
3   CoreFoundation                      0x00000001803fbbf0 ___forwarding___ + 1408
4   CoreFoundation                      0x00000001803fde7c _CF_forwarding_prep_0 + 92
5   FirebaseIssue8005                   0x0000000104f0daf8 -[GDTCCTUploadOperation updateNextUploadTimeWithResponse:forTarget:] + 64
6   FirebaseIssue8005                   0x0000000104f0d3dc __64-[GDTCCTUploadOperation sendURLRequestWithBatch:target:storage:]_block_invoke + 76
7   FirebaseIssue8005                   0x0000000104e812a8 __56-[FBLPromise chainOnQueue:chainedFulfill:chainedReject:]_block_invoke.48 + 52
8   libdispatch.dylib                   0x0000000180100580 _dispatch_call_block_and_release + 24
9   libdispatch.dylib                   0x0000000180101d44 _dispatch_client_callout + 16
10  libdispatch.dylib                   0x0000000180108dcc _dispatch_lane_serial_drain + 968
11  libdispatch.dylib                   0x00000001801097f8 _dispatch_lane_invoke + 400
12  libdispatch.dylib                   0x0000000180113a58 _dispatch_workloop_worker_thread + 744
13  libsystem_pthread.dylib             0x00000001bca3b028 _pthread_wqthread + 272
14  libsystem_pthread.dylib             0x00000001bca39df8 start_wqthread + 8

Thread 0:: Dispatch queue: com.apple.main-thread
0   dyld_sim                      	0x0000000105852eb8 ImageLoaderMachO::findClosestSymbol(mach_header const*, void const*, void const**) + 388
1   dyld_sim                      	0x0000000105852db0 ImageLoaderMachO::findClosestSymbol(mach_header const*, void const*, void const**) + 124
2   dyld_sim                      	0x0000000105846760 dladdr + 168
3   libdyld.dylib                 	0x0000000180228608 dladdr + 172
4   libsystem_c.dylib             	0x0000000180082750 backtrace_symbols + 108
5   com.apple.Foundation          	0x000000018083616c -[_NSCallStackArray descriptionWithLocale:indent:] + 148
6   com.apple.CoreFoundation      	0x00000001803f7c38 __handleUncaughtException + 584
7   libobjc.A.dylib               	0x000000018016c2e4 _objc_terminate() + 112
8   libc++abi.dylib               	0x000000018021c2f8 std::__terminate(void (*)()) + 16
9   libc++abi.dylib               	0x000000018021c290 std::terminate() + 44
10  libdispatch.dylib             	0x0000000180101d58 _dispatch_client_callout + 36
11  libdispatch.dylib             	0x000000018010f384 _dispatch_main_queue_callback_4CF + 1100
12  com.apple.CoreFoundation      	0x0000000180365d1c __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__ + 12
13  com.apple.CoreFoundation      	0x000000018036025c __CFRunLoopRun + 2448
14  com.apple.CoreFoundation      	0x000000018035f3bc CFRunLoopRunSpecific + 572
15  com.apple.GraphicsServices    	0x000000018afdd70c GSEventRunModal + 160
16  com.apple.UIKitCore           	0x00000001843f03d0 -[UIApplication _run] + 964
17  com.apple.UIKitCore           	0x00000001843f51ac UIApplicationMain + 112
18  com.apple.SwiftUI             	0x00000001b34c6f6c closure #1 in KitRendererCommon(_:) + 108
19  com.apple.SwiftUI             	0x00000001b34c6efc runApp<A>(_:) + 160
20  com.apple.SwiftUI             	0x00000001b309ca74 static App.main() + 80
21  com.example.FirebaseIssue8005 	0x0000000104d83584 static FirebaseIssue8005App.$main() + 112 (FirebaseIssue8005App.swift:10)
22  com.example.FirebaseIssue8005 	0x0000000104d8363c main + 12
23  libdyld.dylib                 	0x0000000180224554 start + 4
```
