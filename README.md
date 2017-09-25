# Space Gophers macOS Screen Saver

A macOS screensaver inspired GopherCon 2017.

![Space Gophers Animated Gif](https://github.com/apiarian/space-gophers/blob/add_sample/images/space_gophers_animated.gif?raw=true)

Gopher images from [Ashely McNamara's fantastic collection](https://github.com/ashleymcnamara/gophers). Speficially [this issue](https://github.com/ashleymcnamara/gophers/issues/6).


## Installation

Maybe try installing the `space-gophers.saver` file directly? I don't really know enough about the security restrictions of macOS to say if it will work correctly. If not, you can build the screensaver as outlined in the Development Notes section. Pull requests and suggestions on how to make this easier to install are welcome.


## Development Notes

Open the `space-gophers` project in Xcode. Make changes. Press `ctrl-b` to rebuild the project. Right click on the `space-gophers.savers` file in the Products group, and click `Show in Finder`. Double-click to install or reinstall the screensaver. **Quit** and reopen `System Preferences.app` to see the changes in the preview and sample of the screen saver.

You will probably need to link your Xcode to a developer account and adjust the signing team in the Signing section of the Xcode project settings. If somebody has a better idea of how to deal with these signing things on open-source Xcode projects, please open an issue or pull request. Or at least some clarification on this point?


## License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).
