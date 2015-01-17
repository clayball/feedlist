feedslist
=========

Fetch XML based RSS feeds from various information security websites.
- save the XML file for processing later.. possibly in various ways/functions
The original idea was to fetch feeds specifically related to alerts and advisories relate
vulnerabilities. It might be useful to include other classifications of sources, e.g., fa
news, and (cough..cough) vendors. 


Running
-------

At some point we may package this as a gem. Until then..

from the main infosec-feeds/ directory

  bin/infosec-feeds


The following sources are fetched
---------------------------------

FIX: the descriptions below have been trimmed somehow.

- US-CERT is part of DHS' National Cybersecurity and Communications Integration Center (N
  The Department of Homeland Security's United States Computer Emergency Readiness Team (
  leads efforts to improve the nation's cybersecurity posture, coordinate cyber informati
  and proactively manage cyber risks to the Nation while protecting the constitutional ri

- NVD is the U.S. government repository of standards based vulnerability management data 
  using the Security Content Automation Protocol (SCAP). This data enables automation of 
  management, security measurement, and compliance. NVD includes databases of security ch
  security related software flaws, misconfigurations, product names, and impact metrics.

- Cisco Security Advisories
  PSIRT manages the receipt, investigation, and public reporting of security vulnerabilit
  to Cisco products and networks. Subscribe to the Cisco Security Advisory RSS Feed to re
  about significant security issues that directly involve Cisco products and require an u
  customer action.

- TODO: add more sources
        More sources will allow us to collorelate data across sources and possibly make d
        on patterns found across many sources. For example, an SSH vulnerability is blowi
        ..we should pay special attention to this vulnerability ASAP.
