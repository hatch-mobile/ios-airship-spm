# ios-airship-spm

Airship w/o source, binary spm dependency

xcframeworks sourced (each individual one rezipped) from official Airship GitHub releases.

No script automation to do this yet.

# Usage

Use this by adding an entry to your Package.swift for the dependency and products needed:
```
Package(
    ...
    dependencies: [
        .package(
            url: "https://github.com/hatch-mobile/ios-airship-spm.git",
            exact: Version(16, 10, 7)
        ),
    ],
    targets: [
        target(
            ...
            dependencies: [
                .product(
                    name: "AirshipCore",
                    package: "ios-airship-spm"
                ),
                .product(
                    name: "AirshipAutomation",
                    package: "ios-airship-spm"
                ),
                .product(
                    name: "AirshipMessageCenter",
                    package: "ios-airship-spm"
                )
           ]
     ]
```

## To add a new version of Airship here:
1. Download official Airship release zip from their Github releases and unzip it.
1. Zip up each of the xcframeworks into _individual zip files_, and place them in your local working copy of this repo (they are .gitignore'd)
1. Update the version number in the Package.swift binaryTarget URL's in this repo to reflect the new version of Airship.  You should only have to change the version number in the URL.  Assets won't be available at those URL's yet because we have not attached them to a published release yet.
1. Recalculate checksum entries for each of the xcframeworks locally, and update the Package.swift in this repo with those new checksums.
    ```
    $ swift package compute-checksum AirshipBasement.16.10.7.xcframework.zip
    d2348aa2aeef3914b2a076a026b4f2a7841d95408d68143e2fa3b2e285c4288e
    ... repeat ...
    ```
1. Commit those url and checksum updates.  Tag that sha with the Airship version number.  Push that commit and the tag.
1. Create the Github release in this repo.  Name it for the version, select the tag you pushed, and drag/drop attach the 4 xcframework zip files.
1. Publish the Github release to bind the release version/tag into the asset urls that are attached to the release -- otherwise release assets will have 'untagged-[sha]' in URL (i.e. - in a Draft release)
3. Update consumer (Package.swift or Package.resolved) of this repo to use new version.
