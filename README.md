# Open CombiTVA
This is an open implementation of the CombiTVA paradigm (Vangkilde, Bundesen & Coull, 2011) in OpenSesame (Mathôt, Schreij & Theeuwes, 2012).

More resources on OpenSesame can be found at on [Sebastiaan Mathôt's website](http://osdoc.cogsci.nl/).

### Requirements
Open CombiTVA by default is optimized for 24-inch displays with a resolution of 1920 x 1080 px at 100 Hz refresh rate for proper stimulus presentation. Only run the experiment with monitor refresh rates that enable the presentation of 10 ms frames (-> 100 Hz, not 75 or 60 Hz). Participant should be seated at a distance of 60 cm from the display during the experiment. Of course the experiment can be customized to fit other screen sizes and viewing distances (see below how). All instructions are in English language. Currently, translations for German are available in a text file in the folder *languages*.

### Running Open CombiTVA
You find the actual experiment in the folder *experiment*. Before running the experiment you need to add all images in the subfolder *pool* to OpenSesame's file pool. If you want to use German instructions, copy and paste the instructions from the text-file into the corresponding elements' scripts in OpenSesame.

Before running the experiment, you will have to adjust the experimental settings to your monitor, so that positioning and size of the stimuli are in accordance to the specifications in the combiTVA paper. That is: the letters must be presented in a circle of 7.5 degrees of visual angle around the center of the screen and must correspond to a height of 2.7 degrees of visual angle. 

__How do I calibrate the monitor?__

It is recommended and most convenient to use the OpenSesame sample experiment in the *calibration* folder to calibrate the experiment to your monitor. After calibrating the settings you can simply insert them the into the actual experiment the same way. You will need to do five adjustments:

* screen resolution
  * insert the resolution that your monitor is running on to the general properties of the experiment
  * the general properties are found in the upper most item in the item overview on the left (= Insert_Resolution_here)
* screen_width
  * open the inline script 'Adjust_monitor' in the item overview to do the remaining four adjustments
  * measure the width of your screen (cm) and insert assign the value to the variable 'screen_width'
* resolution_width
  * assign the resolution width of your screen (pixels) to the variable 'resolution_width'
* screen_distance
  * use the variable 'screen_distance' to indicate how far from the screen participants will be seated (also in cm!)
* letter_size
  * when you have made the four assignments from above, run the experiment
  * you will see how the letters will be presented on the screen
  * a message will be displayed that shows the necessary height of the letters
  * measure the actual height of the letters
  * end the experiment by clicking any key
  * you have found the correct adjustments for your monitor if the actual height and the displayed height are the same
  * if not: adjust the letter_size variable and run the experiment as long as is needed to find the correct letter size 
  * then insert the five adjustments to the actual TVA experiment in the same way as you did in the sample experiment


### Data output
To do: explain the output of the experiment



### Data analysis
In the folder *analysis* you'll find an R-Script that converts the data to the format needed for parameter fitting. The converted files can be fit using either the trial-by-trial fitting program (Kyllingsbæk, 2006) or the LibTVA MatLab library (Dyrholm, Kyllingsbæk, Espeseth & Bundesen, 2011). You can retrieve both software packages from [Claus Bundesen's lab website](http://cvc.psy.ku.dk/resources/).

## Contributions
If you find a bug or have ideas on how to improve the implementation of the experiment you are more than welcome to open an issue or, preferably, fork the project and provide solutions in a pull request. :)

If you translate or improve the Open CombiTVA instructions, we would be happy to make your translation available to other researchers. Have a look at the existing language-files if you'd like to provide a translation.

## Citing Open CombiTVA
If you'd like to cite Open CombiTVA in your work, you may use the following reference:

Papenberg, M. & Aust, F. (2014). An open implementation of the CombiTVA paradigm in OpenSesame. *github.com*. Retrieved from https://github.com/crsh/combitva

Vangkilde, S., Bundesen, C., & Coull, J. T. (2011). Prompt but inefficient: nicotine differentially modulates discrete components of attention. *Psychopharmacology*, 218, 667–680. doi: [10.1007/s00213-011-2361-x](http://dx.doi.org/10.1007/s00213-011-2361-x)

# References
Dyrholm, M., Kyllingsbæk, S., Espeseth, T. & Bundesen, C. (2011). Generalizing parametric models by introducing trial-by-trial parameter variability: The case of TVA. *Journal of Mathematical Psychology*, 55, 416-429. doi: [10.1016/j.jmp.2011.08.005](http://dx.doi.org/10.1016/j.jmp.2011.08.005)

Kyllingsbæk, S. (2006). Modeling visual attention. *Behavior Research Methods*, 38, 123-133. doi: [10.3758/BF03192757](http://dx.doi.org/10.3758/BF03192757)

Mathôt, S., Schreij, D., & Theeuwes, J. (2012). OpenSesame: An open-source, graphical experiment builder for the social sciences. Behavior Research Methods, 44(2), 314-324. doi: [10.3758/s13428-011-0168-7](http://dx.doi.org/10.3758/s13428-011-0168-7)

Vangkilde, S., Bundesen, C., & Coull, J. T. (2011). Prompt but inefficient: nicotine differentially modulates discrete components of attention. *Psychopharmacology*, 218, 667–680. doi: [10.1007/s00213-011-2361-x](http://dx.doi.org/10.1007/s00213-011-2361-x)
