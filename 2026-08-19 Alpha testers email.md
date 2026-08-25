# Alpha testers, one month to try the published course

**Drafted 2026-08-19. Testers named by Damian the same day: Fernando Ortiz and Salman Baghieri.**

Fernando Ortiz is Manager of the Flow Cytometry and Cell Sorting Facility, and Damian is his supervisor (confirmed from the 2024 and 2025 PDR files). Salman Baghieri does not appear anywhere else on T31 or in `memory/people/`, so nothing is recorded about his role or background.

Assumption made, say if it is wrong: one email addressed to both of them rather than two separate emails.

Deadline used: **Friday 18 September 2026**. One month from today is Saturday 19 September, so this is the working day before it.

---

## Draft

**Subject:** The cytometry R course is published, and I would like you to break it

Hi Fernando and Salman,

The course is finished and public: **https://core-principles.com/CytometryInR/**

Sixteen chapters, start to finish, from installing R through to publication figures. The course data is a separate 299 MB download and the link is in Chapter 4.

Take the next month with it, until **Friday 18 September**. Work through it in order, at whatever pace suits you, and actually run the code rather than reading it. That is the entire test. I know it works on my machine. What I do not know is whether someone who is not me can get from Chapter 1 to Chapter 16 without getting stuck.

What is most useful back:

- anything that did not run, with the error text and the chapter it was in
- anywhere you got stuck, even briefly, and what you did to get past it
- anywhere the book says one thing and your screen shows another
- whether your figures look like the ones in the book

Two things are deliberate, so please do not report them as faults. Chapter 16 ends with an error on purpose, to show what that failure looks like. Chapter 7, on gating, uses its own small example dataset rather than the main course data, also on purpose.

Tell me your operating system and R version when you write back. Chapters 2 and 3 are the install chapters and that is precisely where versions cause trouble.

There is no need to be diplomatic. Blunt is more useful to me than kind.

Thanks both,

Damian

---

## Notes on choices made

- **"Break it" in the subject line** rather than "review" or "feedback", because what is wanted is failure reports, not approval.
- **The NxN grid in Chapter 8 is not mentioned**, despite taking just under ten minutes to run. It is an `eval=FALSE` chunk, so a reader only hits it if they deliberately choose to, and the chapter's own prose already warns them. Adding it here would be noise.
- **Chapter 7's separate dataset is mentioned** because it is a genuine "have I done something wrong?" moment for a first-time reader, and it is not obvious from the chapter that it is intentional.
- **The OS and R version request** exists because Damian runs 4.4 and the book was built and checked on 4.6. If a tester is on something else again, that is worth knowing before the report arrives, not after.
- Deliberately not asked for: a structured form, a rubric, or a checklist. Two testers, one month, and the useful signal is where they stop.
