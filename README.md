# Letters of Recommendation -- Quarto 

`recletters` generates typst pdf recommendation letters. The first page of the letter will be rendered on user--provided electronic letterhead (.pdf, .png, .jpg, .svg, & .webp letterhead formats are supported). Letterhead is somewhat contraband for all but a limited number of organizational representatives -- `recletters` allows approved users to maintain local copies of their institution's letterhead while still using Quarto as an authoring tool. 

> [!NOTE]
> Many Universities seem to maintain .doc/.docx letterhead templates. These are not currently supported. If your institution distributes only .doc/.docx letterhead, you will need to save as .pdf (or other similar workaround).

## Installing

```bash
quarto use template jtkulas/recletters-typst
```

This will install the extension under the `_extensions` subdirectory.

## Using

Identify the extension within your YAML with `format: recletters-typst`. 

The letterhead should be stored locally and is identified with `background: letterhead.*`:

```bash
---
title: "Letter of Recommendation"
format:
  recletters-typst:
    background: letterhead/SCSUPsychologyLetterhead.pdf  
---

I am writing to **strongly recommend**...

```

The minimal specification (`format: recletters-typst` and `background: letterhead.*`) will provide a workable letter writing canvas. Optional specifications control header blocks, signature blocks, and header and footer spacing (to accommodate different letterhead stylings).  

### Options: 

|Option   | Description           |  Default Value         |  Example  |
|---------|-----------------------|------------------------|-----------|
|from-name    | letter writer (or addressee)  | NULL      | from-name: "I. M. Awesome"     |
|from-title   | job title of letter writer (or addressee) | NULL | from-title: "Assistant Professor"  |
|from-affiliation    | department affiliation of letter writer (or addressee) | NULL | from-affiliation: "Biosciences"   |
|from-align | location of "from" block: `left` or `right` | left  | from-align: right  |
|subject | bolded "Re:..." to be rendered above opening line | NULL | subject: "Recommendation for Bullwinkle J. Moose"  |

## Examples


## Known issues

+ e-mail addresses are currently YAML specified separately by alias and domain - there was a rendering issue with typst's treatment of the "at" sign (@) and this is the current workaround. If you have a better idea, please open an issue.

## Contributing 

Issues and pull requests are welcome! Please open an issue on the GitHub repository to propose changes or make feature requests.






