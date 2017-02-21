# Demonstration of Xcode Coverage Issue

**XCTest UI tests do not include coverage information for embedded frameworks.**

* In Xcode 8.2.1 coverage is reported for the target app.
* In Xcode 8.3 beta 3 coverage is _not_ reported for the target app.

In neither version is coverage reported for embedded frameworks used by the target app. However, coverage _is_ reported for the embedded frameworks used by the XCTRunner process, i.e our test code.

In the below screenshot, you can see that `UsedByTest` is covered, and `UsedByApp` is not. `UsedByTest` is called from `CoverageTestUITests.testCoverage`, whereas
`UsedByApp` is called from `ViewController`.

![coverage screenshot](https://github.com/ileitch/xcode-coverage-bug/raw/master/screenshot.png)

My expectation is that coverage for `UsedByApp` is reported instead of `UsedByTest`, since the coverage of framework code used by tests is far less useful than the framework code used by the app.

1. Run `bundle install`
2. Run `bundle exec pod install`
3. Open the xcworkspace and run the tests
4. Observe in the XCTRunner console: "!!!! UsedByTest.perform was called"
5. Observe the app console: ""!!!! UsedByApp.perform was called"
6. Observe that coverage is not reported for code in the `Shared` framework that is called from the app target
