DB Schema
=========

Looking at implementing the alert feeds first.

I'm thinking a table for feed. That way tables fields can be limited to what the feed provides.


CERT XML
--------

<channel>
	<link></link>
	<title></title>
	<item>
		<title></title>
		<link></link>
		<description></description>
		<pubDate></pubDate>
	</item>
</channel>


National Vulnerability Database XML
-----------------------------------

<channel rdf:about="http://web.nvd.nist.gov/view/vuln/search">
	<title></title>
	<link></link>
	<description></description>
	<items>
		<rdf:Seq>
		list of all items!
		...
		<rdf:li rdf:resource="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9292" />
		...
    </rdf:Seq>
	</items>
</channel>

<item rdf:about="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6656">
  <title>CVE-2012-6656 (glibc)</title>
  <link>http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6656</link>
  <description>iconvdata/ibm930.c in GNU C Library (aka glibc) before 2.16 allows context-dependent attackers to cause a denial of service (out-of-bounds read) 
    via a multibyte character value of "0xffff" to the iconv function when converting IBM930 encoded data to UTF-8.</description>
  <dc:date>2014-12-05T16:59:00Z</dc:date>
</item>
<item rdf:about="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3988">
  <title>CVE-2014-3988 (kcfinder)</title>
  <link>http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3988</link>
  <description>Cross-site scripting (XSS) vulnerability in index.php in SunHater KCFinder 3.11 and earlier allows remote attackers to inject arbitrary web script or HTML via (1) file or (2) directory (folder) name of an uploaded file.</description>
  <dc:date>2014-12-03T01:59:00Z</dc:date>
</item>


IBM Internet Security Systems
-----------------------------
<channel>
	<title>IBM Internet Security Systems Internet Threat Information</title>
	<link></link>
	<description></description>
	<item>
    <title>Microsoft Windows OLE Automation Array Remote Code Execution</title>
    <link>http://www.iss.net/threats/491.html</link>
    <description>There is a vulnerability in the way that a Microsoft Windows library (OleAut32.dll) resizes certain array objects which can lea
d to remote compromise for users of Internet Explorer and Microsoft Excel.</description>
    <pubDate>Tue, 11 Nov 2014 00:00:00 -0500</pubDate>
</item><item>
    <title>Vulnerability in Microsoft OLE Could Allow Remote Code Execution</title>
    <link>http://www.iss.net/threats/490.html</link>
    <description>Microsoft has issued security advisory 3010060 to identify a vulnerability in OLE that could allow remote code execution. This 
vulnerability, CVE-2014-6352, is present in all supported versions of Microsoft Windows, excluding Windows Server 2003.</description>
    <pubDate>Fri, 24 Oct 2014 00:00:00 -0400</pubDate>
</item>




