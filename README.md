# Open CombiTVA
This is an open implementation of the CombiTVA paradigm (Vangkilde, Bundesen & Coull, 2011) in OpenSesame (Mathôt, Schreij & Theeuwes, 2012).

This version of Open CombiTVA is out of the box optimized for 24-inch displays with a resolution of 1920 x 1080 px at 100 Hz refresh rate for proper stimulus presentation. Participant should be seated at a distance of 60 cm from the display during the experiment. Of course the experiment can be customized to fit other screen sizes and viewing distances.

In the folder *analysis* you'll find an R-Script that converts the data to the format needed for parameter fitting. The converted files can be fit using either the trial-by-trial fitting program (Kyllingsbæk, 2006) or the LibTVA MatLab library (Dyrholm, Kyllingsbæk, Espeseth & Bundesen, 2011). You can retrieve both software packages from [Claus Bundesen's lab website](http://cvc.psy.ku.dk/resources/).

More resources on OpenSesame can be found at on [Sebastiaan Mathôt's website](http://osdoc.cogsci.nl/).

## Contributions
If you find a bug or have ideas on how to improve the implementation of the experiment you are more than welcome to open an issue or, even better, fork the project and provide solutions in a pull request. :)

## Citing Open CombiTVA
If you'd like to cite Open CombiTVA in your work, you may use the following reference:

Papenberg, M. & Aust, F. (2014). An open implementation of the CombiTVA paradigm in OpenSesame. *github.com*. Retrieved from https://github.com/crsh/combitva

# References
Dyrholm, M., Kyllingsbæk, S., Espeseth, T. & Bundesen, C. (2011). Generalizing parametric models by introducing trial-by-trial parameter variability: The case of TVA. *Journal of Mathematical Psychology*, 55, 416-429. doi: [10.1016/j.jmp.2011.08.005](http://dx.doi.org/10.1016/j.jmp.2011.08.005)

Kyllingsbæk, S. (2006). Modeling visual attention. *Behavior Research Methods*, 38, 123-133. doi: [10.3758/BF03192757](http://dx.doi.org/10.3758/BF03192757)

Mathôt, S., Schreij, D., & Theeuwes, J. (2012). OpenSesame: An open-source, graphical experiment builder for the social sciences. Behavior Research Methods, 44(2), 314-324. doi: [10.3758/s13428-011-0168-7](http://dx.doi.org/10.3758/s13428-011-0168-7)

Vangkilde, S., Bundesen, C., & Coull, J. T. (2011). Prompt but inefficient: nicotine differentially modulates discrete components of attention. *Psychopharmacology*, 218, 667–680. doi: [10.1007/s00213-011-2361-x](http://dx.doi.org/10.1007/s00213-011-2361-x)