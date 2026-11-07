#show: doc => recletter(
  background: "$background$",
  $if(emptyhead)$emptyhead: $emptyhead$,$endif$
  $if(emptyfoot)$emptyfoot: $emptyfoot$,$endif$
  $if(subject)$subject: "$subject$",$endif$
  $if(subject-align)$subject-align: "$subject-align$",$endif$
  $if(from-name)$from-name: "$from-name$",$endif$
  $if(from-title)$from-title: "$from-title$",$endif$
  $if(from-affiliation)$from-affiliation: "$from-affiliation$",$endif$
  $if(from-align)$from-align: "$from-align$",$endif$
  $if(date)$date: "$date$",$endif$
  $if(email)$email: "$email$",$endif$
  $if(email-name)$email-name: "$email-name$",$endif$
  $if(email-domain)$email-domain: "$email-domain$",$endif$
  $if(phone)$phone: "$phone$",$endif$
  opening: "$opening$",
  closing: "$closing$",
  $if(signature)$signature: "$signature$",$endif$
  doc,
)
