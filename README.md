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
2. Zip up each of the xcframeworks into _individual zip files_, and place them in your local working copy of this repo (they are .gitignore'd)
3. Update the version number in the Package.swift binaryTarget URL's in this repo to reflect the new version of Airship.  You should only have to change the version number in the URL.  Assets won't be available at those URL's yet because we have not attached them to a published release yet.
4. Recalculate checksum entries for each of the xcframeworks locally, and update the Package.swift in this repo with those new checksums.
    ```
    $ swift package compute-checksum AirshipBasement.16.10.7.xcframework.zip
    d2348aa2aeef3914b2a076a026b4f2a7841d95408d68143e2fa3b2e285c4288e
    ```
5. Commit those url and checksum updates. 
    ```
    git add .
    git commit -m "Added support for x.y.z"
    git push
    ```
6. Create an annotated tag using the Airship version number.  Push that tag to origin.
    ```
    git tag "x.y.z" -a -m "Adding support for x.y.z"
    git push origin --tags
    ```
7. Create the Github release in this repo by visiting https://github.com/hatch-mobile/ios-airship-spm/releases/tag/x.y.z. 
   1. Click on `Create release from tag` 
   2. Name the release the same as the tage
   3. Attach the zipped xcframework files.
   4. Accept all other defaults then click on `Publish Release`. This will bind the release version/tag into the asset urls that are attached to the release -- otherwise release assets will have 'untagged-[sha]' in URL (i.e. - in a Draft release)
8.  Update consumer (Package.swift or Package.resolved) of this repo to use new version.
