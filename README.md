# Letters of Recommendation - Quarto 

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

### Options

Everything listed here is optional and organized by consequence ([address block](#address-block), [signature block](#signature-block), or [general formatting](#general-formatting)):

#### Address block

These options populate a small block of text to be located at the head of the document, situated either right or left (see `from-align`.

|Option   | Description           |  Default Value         |  Example  |
|---------|-----------------------|------------------------|-----------|
|from-name    | letter writer (or addressee)  | NULL      | from-name: "I. M. Awesome"     |
|from-title   | job title of letter writer (or addressee) | NULL | from-title: "Assistant Professor"  |
|from-affiliation    | department affiliation of letter writer (or addressee) | NULL | from-affiliation: "Biosciences"   |
|from-align | location of "from" block: `left` or `right` | left  | from-align: right  |

#### Signature block

These options populate a small block of text to be located at the foot of the document, left-justified. The script font is the google font, "[Hurricane](https://fonts.google.com/specimen/Hurricane?preview.script=Latn)", which comes bundled with the extension install.   

|Option   | Description           |  Default Value         |  Example  |
|---------|-----------------------|------------------------|-----------|
|closing    | salutation to appear above signature  | NULL      | closing: "Insincerely,"     |
|signature   | name to appear in script font | NULL | signature: "Ignacious M Awesome"  |
|date    | use `date: today` for auto-complete in Month day, Year format | NULL | date: today   |
|email-name | email alias (content "to the left" of the @ symbol) | NULL  | email-name: "imawesome"  |
|email-domain | email domain (content "to the right" of the @ symbol) | NULL  | email-domain: "looneytunes.edu"  |
|phone    | letter writer's phone number  | NULL      | phone: "320-555-1234"     |

> [!NOTE]
> `email-name` and `email-domain` are separate fields because typst was interpreting the "@" symbol as a citation key. The separation of name and domain is a current workaround.

#### General formatting

`emptyhead` and `emptyfoot` are intended to provide "vertical text shifting" for letter writers whose letterhead content likely differs in "thickness". Negative values are allowed (e.g., `emptyhead: -2` will shift the entire text "up" two rows).

|Option   | Description           |  Default Value         |  Example  |
|---------|-----------------------|------------------------|-----------|
|subject | bolded "Re:..." to be rendered above opening line | NULL | subject: "Recommendation for Bullwinkle J. Moose"  |
|subject-align | `left` or `right` justification of subject line | left | subject-line: right  |
|emptyhead | number of empty rows to add prior to any document text (1^st^ page) | 0 | emptyhead: 5 |
|emptyfoot | number of empty rows to add at the bottom of the 1^st^ page | 0 | emptyfoot: -2 |

## Examples


## Known issues

+ e-mail addresses are currently YAML specified separately by alias and domain - there was a rendering issue with typst's treatment of the "at" sign (@) and this is the current workaround. If you have a better idea, please open an issue.
+ `date` (signature block) only accepts "today" as a valid value. If users want a different date, it will need to be specified outside of the signature block
+ `emptyhead` is intended to impact only the first page (with the letterhead) but currently affects all pages. `emptyfoot` is also intended only to impact the first page (if the footer content is thick), but currently is inoperative

## Contributing 

Issues and pull requests are welcome! Please open an issue on the GitHub repository to propose changes or make feature requests.






