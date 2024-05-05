
## Information about Honig et al.'s data

- Participants completed 4 sessions. Sessions 1 & 4 used a uniform color space.
- Session 2 & 3 used a von-mises color space. In each session, people complete
~300 trials (differs because they could stop when they achieve a set number of
points). On each trial, four colors were presented for 100ms. After a 1000ms
delay, they had to report the color of one cued location, then draw an arc.
- They got point based on the size of the arc and whether it included the
stimulus.
- Mat file have four variables - dm, x, fa & pr
    - ex - overall exp info (subjN, sessionN, points, etc)
    - fa - trial information. Hass 500 trials, but only some where used
        - fa.dotcols - color of the four dots
        - fa.probed - id of the probed dot (column # in fa.dotcols
        - fa.probedcol - color of probed dot
        - fa.dotdist - likely the position of the study dots
        - fa.porbeddist - likely the position of the probed dot
    - dm - response information
        - dm.betcolor - point response
        - dm.betarc - confidence response
        - dm.resptime - RT for point response (probably)