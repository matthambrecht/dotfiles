# Code Commenting Guidelines

- Use only standard keyboard characters. No em dashes, arrows, or other
  special symbols. Comments don't need to meet technical writing standards;
  punctuation and capitalization are optional.

- Keep comments sparse and brief. Only comment where the code wouldn't be
  understood at a glance a month later. A few words usually suffice; add
  more only when extra context is genuinely necessary.

- Don't explain implementation history. Comments should describe what the
  code does now, not the MR/PR context or decisions behind it. That context
  won't matter later.

- Don't leave comments describing removed code in the place it used to be.
  Version control already tracks that. The exception: if the removal is an
  intentional deviation from an established norm, note why this place
  differs from the others that follow it.

- Don't address the developer or converse in comments (e.g. "We did y
  because you said x"). Projects have multiple developers, and conversational
  comments make it hard to separate useful comments from cruft.

- If a comment can't be read and understood in a few seconds, it's too long.
  Comments are quick reminders of what the code is doing, not detailed
  explanations.
