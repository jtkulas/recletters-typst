#let recletter(
  background: none,
  emptyhead: 0,
  subject: none,
  subject-align: "left",
  from-name: none,
  from-title: none,
  from-affiliation: none,
  from-align: "right",
  date: none,
  email: none,
  email-name: none,
  email-domain: none,
  phone: none,
  opening: "Dear",
  closing: "Sincerely",
  signature: none,
  body,
) = {
  set page(
    paper: "us-letter",
    // Use normal document margins throughout. The first-page-only header
    // clearance is added as a one-time spacer below.
    margin: (top: 1in, bottom: 1.1in, left: 1in, right: 1in),
    background: if background != none and background != "" {
      context {
        if counter(page).get().first() == 1 {
          place(
            top + left,
            image(background, width: 100%, height: 100%)
          )
        }
      }
    } else {
      none
    }
  )

  // First-page letterhead clearance: 0.8in preserves the original 1.8in
  // first-page top offset; emptyhead adjusts only this one-time spacer.
  v(0.8in + emptyhead * 1.2em)

  // Sender block
  if from-name != none or from-title != none or from-affiliation != none [
    #align(if from-align == "right" { right } else { left })[
      #if from-name != none [*#from-name*]
      #if from-title != none [#linebreak() #from-title]
      #if from-affiliation != none [#linebreak() #from-affiliation]
    ]
  ]

  v(1.5em)

  // Subject
  if subject != none and subject != "" [
    #align(if subject-align == "right" { right } else { left })[
      *Re: #subject*
    ]
  ]

  v(1em)

  // Opening
  opening

  v(1em)

  // Body
  body

  v(2em)

  // Closing
  closing

  // tight gap before signature
  v(-1em)

  // Signature (Hurricane)
  if signature != none and signature != "" [
    #text(font: "Hurricane", size: 28pt)[#signature]
  ]

  // Date + contact under signature
  v(-2em)
  if date != none and str(date) != "" [
    #if str(date).contains("-") and str(date).len() == 10 [
      #let parts = str(date).split("-")
      #let months = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
      #months.at(int(parts.at(1)) - 1) #parts.at(2), #parts.at(0)
    ] else [
      #date
    ]
  ]

  let contact-email = if email != none and email != "" {
    email
  } else if email-name != none and email-domain != none and email-name != "" and email-domain != "" {
    email-name + "@" + email-domain
  } else {
    none
  }
  if contact-email != none and contact-email != "" {
    let contact-email = contact-email.replace("\\\\@", "@")
    [
      #linebreak()
      #strong[e-mail:] #contact-email
    ]
  }
  if phone != none and phone != "" [
    #linebreak()
    #strong[telephone:] #phone
  ]
}
