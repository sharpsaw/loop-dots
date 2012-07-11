loop-dots
=========

A looping set of scripts to allow many
[`...`](http://github.com/ingydotnet/....git) repos to play along nicely.

This should go high up in the `~/.../conf`, so that its dot-files take
precedence over the other repos (but, don't worry - the others will still get
sourced. In fact, that's the whole point of loop-dots!)

By convention, repos that are designed to be used after loop-dots are all
named `*-dots`.

---

The easiest way to understand how to make your own setup is to mimic

http://sharpsaw.org/init

…which is a short script that downloads `...` then my `.../conf` file, then
runs `... install`. Those three tasks are pretty much the entirety of the work
needed to use this system well (even if you do each manually, it's not so bad.)

Tools
-----

There are some [`...`](http://github.com/ingydotnet/....git) tools that help
with both scripting and interactive shelling. They are all named
`...<something>`, so you can tab-complete to see what is available.

These tools are, from the vantage point of `...`, all "opt-in" - unless you
source `~/.../lib/___`, they stay out of your way. But, when you're using
loop-dots, you're definitely opted-in (that is, both `.bashrc` and `.zshenv`
source `~/.../lib/basics`).

Let's look at a few of the functions:

* `...src` (a.k.a., `...repos`) - cd to the `~/.../src` directory for working
  with the `*-dots` repos. You can give it an arg that is the name of the
  repo (and you can even omit the `-dots` part.)
* `...each` - `cd` to each repo then eval the given string. It's functional
  programming for dotfiles! Can I get a w00t-w00t?
* Tracing - There are several handy functions that echo either invariably or
  only when `...traceon` has been called. Especially useful are `...traceq`
  and `...tracex` (louder than `...traceq`) in debugging init processes. The
  rest are in `~/.../lib/tracefuncs`)
* `...source` - Same as the `source` builtin but with trace-awareness.
* `...sourceif` - Calls `...source`, but only if the file exists. Beware that
  this can quietly skip over missing parts, so you might have to `...trace*`
  to figure out what's going on, sometimes.
* `...sourcedircontents` - Source all files in the given dir.
* `$PATH` manipulators - `..path-prepend`, `...path-append`, `...path-remove`,
  and `...path-list`

Also, since `~/.../lib/basics` ends up making these vars available:
* `$DOTDOTDOT_ROOT` - usually is `~/...`
* `$DOTDOTDOT_ORDER` - a list of the repos in accordance with `.../conf`
  sequence. Remember that, since the lower files in the list are sourced
  later, their specific parts can override the previous files.
* `$SHELLNAME` - The shortname of a shell, so `zsh` or `bash`. Traditionally
  you have to check `$BASH_VERSION` or `$ZSH_VERSION` in your scripts, but
  this gives you a handier token.

Zsh Sequence
------------

In zsh, the init sequence is kind of interesting. For the full story try:
    xterm -e 'man zsh | less -p STARTUP/SHUTDOWN'
(And also: the [Zsh Startup Files
Intro](http://zsh.sourceforge.net/Intro/intro_3.html).)

Here is a cheat-sheet:

        zsh -l            zsh -i              zsh -c          zsh -f
    (login shell)   (interactive shell)     (scripting)      (no-rcs)
          ↓                  ↓                   ↓
       .zshenv            .zshenv            .zshenv
          ↓                  ↓
       .zprofile          .zshrc
          ↓
       .zshrc
          ↓
       .zlogin

Now, loop-dots makes this system even more "interesting" by checking for the
above files in all -dots repos, plus adding the ~/.zsh dir to facilitate
organization (and nice, atomic names).

The following dirs correspond to the above files:
    ~/.zsh/env/
    ~/.zsh/rc/
    ~/.zsh/profile/
    ~/.zsh/login/

So you can create my-dots/.zsh/rc/my-aptly-named-thing and trust that it gets
sourced as part of loop-dots/.zshrc. If you need something to happen early or
late relative to the others, you can always prefix with `00-___` or `zzz-___`.

Additionally, there is a .sh/ dir that is similar to .zsh/rc, but is for
things that would work in both bash and zsh (which is most things, so it's
good to try for that).

`...` itself comes with some tracing tools to sourt this out, a bit. Look in
~/.../lib/tracefuncs (which is avilable by default if you are using the
loop-dots repo) for the `...trace` function.

Bash Sequence
-------------

The loop-dots `.bashrc` will load:

- Everything in `~/.sh/*`, then
- Everything in `~/.bash/*`, then
- Any `.bashrc` found in the `~/.../src/*` dirs (in order from `~/.../conf`)

(It also does a few things with `~/.bashrc..`, but we mostly have these
features replicated through the normal system.)

The current `.profile` is not very refined. (TODO)

Pair Up
-------

Once you get on board with `loop-dots`, you can much more easily work with
other programmers' favorite configs. This is the main reason behind this
system, in fact.

The goal is to make it so you can toss in a buddy's dotfiles repo into your
list, then run `... install -s` and (hopefully) away you go!

To pop his stuff back out, run `... remove`, take his entry out, then do `...
install -s` again. ¡Muy caliente!

PairUp!™
--------

Then, the next level is spinning up VMs using your config.

Check out: http://github.com/PairUp/pairup#readme
