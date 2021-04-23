Return-Path: <SRS0=z4JX=JU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0537C433ED
	for <ath11k@archiver.kernel.org>; Fri, 23 Apr 2021 07:59:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D63611C2
	for <ath11k@archiver.kernel.org>; Fri, 23 Apr 2021 07:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D63611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8GVRLzAkAMP0Sm7tCg5ceRHRBArRzQyf1+scw0kpmSw=; b=LjB61jjGV8i0jBcDcb+DXCv0p
	gV//cgYfc0WodAN+SH9Q1Td7jTnEL2VIMl391MIEvTiyWQL55Q7dP3CXCZbbLh8GZFPg4CgFO9P/4
	UD5982OWNXyXlZ1U5m8XiLXFNqumY/1PLj40/ZFRMKGO+1XuBdwWW/gaoGt7Y0Oc/ffDOfTBSXIc6
	tXJs3nLjPWZ2HdgYIfvNpBxrOh9xNiXiXtgI/IwwMx4aIgnA7KJJkyjM1s0R7xzJePAENDADQ2oPc
	4X8AYehg5/K6WDghJJEtLvKON/h9niWqDfzXukmJSlt2HORNyI6d9Sq/LTGKGt2rpT5IVmuHK0ye2
	AJ2hLnwsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZqib-0010Be-6l; Fri, 23 Apr 2021 07:59:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqi7-00109L-Oy
 for ath11k@desiato.infradead.org; Fri, 23 Apr 2021 07:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=A98QKLDc1dXqV6C5LQiVugcSbqFHRiTJ4JNXDfZGKHI=; b=C6FoenUyrlhKoLqREIKjQohG/I
 noLceGt9N5XIBRemXG5Z6porADrEqNeJ046w12DxitKmMGUxGKpN6VK82F5Ek5CwnVvfhzS6YMOxV
 boUWwTBzIkt5k+GY/vAguppbG8kBKbnmTEo7GDQCqkb2Ec073GVnbKWgyWmMIk0uvHLcs8rWDVp5x
 GAEW9MVLo7CzEDPmlu7qPE2/pZsG2R+9dDwAbQSR35parutKk8mlLOHJj3kRwyN7g8k8bT9EJSam2
 +PtKLrUA/tN0J5HXAvVlDnE/RA6NM42hU17PLEesJGf8i7Kk9Ctnb+CDeW6+sOYv8vJl74xPPySP6
 VJ9MeAjw==;
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqi4-00EEYv-KG
 for ath11k@lists.infradead.org; Fri, 23 Apr 2021 07:58:46 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lZqhy-00FZHv-77; Fri, 23 Apr 2021 09:58:38 +0200
Message-ID: <ec30381c062e3eb87abb724641a15331cfc3d11c.camel@sipsolutions.net>
Subject: Re: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
From: Johannes Berg <johannes@sipsolutions.net>
To: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 23 Apr 2021 09:58:37 +0200
In-Reply-To: <1ee8d562986128767c037d20aedb96a5@codeaurora.org>
References: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
 <c0aef41d2ecf09188de372fe4f7d6b1954e54e07.camel@sipsolutions.net>
 <1ee8d562986128767c037d20aedb96a5@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_005844_682409_A64758C3 
X-CRM114-Status: GOOD (  14.26  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTA0LTIxIGF0IDIyOjE4ICswNTMwLCBUaGlyYXZpeWFtIE1hcml5YXBwYW4g
d3JvdGU6Cj4gSW4gY2FzZSBvZiBNZXNoIGZhc3RfcnggaXMgbm90IGFwcGxpY2FibGUsIGJ1dCBz
dGlsbCBVU0VTX1JTUyBjYW4gYmUKPiBlbmFibGVkIGZyb20gZHJpdmVyIHdoZW4gcGFyYWxsZWwg
UlggaXMgc3VwcG9ydGVkIGJ5IEhXL0RyaXZlciwKPiByaWdodD/CoAoKWWVzLCBJIGd1ZXNzIHRo
YXQncyB0cnVlLgoKPiBIZW5jZSBjaGVja2VkIGZvciBVU0VTX1JTUyBzdXBwb3J0IHRvIHVwZGF0
ZSBwZXIgY3B1IHN0YXRzLlBsZWFzZQo+IGNvcnJlY3QgbWUgaWYgdGhlIG1lYW5pbmcgb2YgVVNF
U19SU1MgaXMgbWlzdW5kZXJzdG9vZCBhbmQgaXQgYXBwbGllcwo+IG9ubHkgd2hlbiBmYXN0X3J4
IGZvciBhIFNUQSBpcyBlbmFibGVkLgo+IAoKV2VsbCwgYWN0dWFsbHkgdXNpbmcgbXVsdGktcXVl
dWUgaXMgcG9pbnRsZXNzIG9yIGV2ZW4gY291bnRlci1wcm9kdWN0aXZlCndoZW4geW91IGRvbid0
IGhhdmUgZmFzdC1SWCwgc2luY2UgdGhlbiB5b3UnbGwgcnVuIGludG8gYSBjb21tb24gbG9jaywK
YW5kIGRvaW5nIG11Y2ggcHJvY2Vzc2luZyBvbiBtdWx0aXBsZSBDUFVzIGJ1dCB1bmRlciBhIGNv
bW1vbiBsb2NrIG1pZ2h0CndlbGwgYmUgd29yc2UgdGhhbiBkb2luZyBpdCBvbiBhIHNpbmdsZSBD
UFUgaW4gdGhlIGZpcnN0IHBsYWNlLCBzaW5jZQp5b3UnbGwgYm91bmNlIHRoZSBsb2NrIGFyb3Vu
ZCBhbGwgdGhlIHRpbWUuCgpIb3dldmVyLCB5b3UncmUgcmlnaHQgdGhhdCB0aGUgZHJpdmVyIG1p
Z2h0IGdlbmVyYWxseSBhZHZlcnRpc2UKVVNFU19SU1MsIGJ1dCB0aGVuIG5vdCBkbyBpdCBmb3Ig
bWVzaCwgYnV0IHRoYXQgdGhyb3dzIG9mZiBzb21lCnN0YXRpc3RpY3MuCgpTb21ldGhpbmcgbGlr
ZSB0aGlzIG1pZ2h0IHRoZW4gYmUgYSBtdWNoIGJldHRlciBmaXggdGhvdWdoPwoKCmRpZmYgLS1n
aXQgYS9uZXQvbWFjODAyMTEvc3RhX2luZm8uYyBiL25ldC9tYWM4MDIxMS9zdGFfaW5mby5jCmlu
ZGV4IGVjNjk3M2VlODhlZi4uZjg3ZTg4Mzg2MmQ5IDEwMDY0NAotLS0gYS9uZXQvbWFjODAyMTEv
c3RhX2luZm8uYworKysgYi9uZXQvbWFjODAyMTEvc3RhX2luZm8uYwpAQCAtMjA5Miw3ICsyMDky
LDcgQEAgc3RhX2dldF9sYXN0X3J4X3N0YXRzKHN0cnVjdCBzdGFfaW5mbyAqc3RhKQogCXN0cnVj
dCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsID0gc3RhLT5sb2NhbDsKIAlpbnQgY3B1OwogCi0JaWYg
KCFpZWVlODAyMTFfaHdfY2hlY2soJmxvY2FsLT5odywgVVNFU19SU1MpKQorCWlmICghc3RhLT5w
Y3B1X3J4X3N0YXRzKQogCQlyZXR1cm4gc3RhdHM7CiAKIAlmb3JfZWFjaF9wb3NzaWJsZV9jcHUo
Y3B1KSB7CkBAIC0yMTkyLDkgKzIxOTIsNyBAQCBzdGF0aWMgdm9pZCBzdGFfc2V0X3RpZHN0YXRz
KHN0cnVjdCBzdGFfaW5mbyAqc3RhLAogCWludCBjcHU7CiAKIAlpZiAoISh0aWRzdGF0cy0+Zmls
bGVkICYgQklUKE5MODAyMTFfVElEX1NUQVRTX1JYX01TRFUpKSkgewotCQlpZiAoIWllZWU4MDIx
MV9od19jaGVjaygmbG9jYWwtPmh3LCBVU0VTX1JTUykpCi0JCQl0aWRzdGF0cy0+cnhfbXNkdSAr
PQotCQkJCXN0YV9nZXRfdGlkc3RhdHNfbXNkdSgmc3RhLT5yeF9zdGF0cywgdGlkKTsKKwkJdGlk
c3RhdHMtPnJ4X21zZHUgKz0gc3RhX2dldF90aWRzdGF0c19tc2R1KCZzdGEtPnJ4X3N0YXRzLCB0
aWQpOwogCiAJCWlmIChzdGEtPnBjcHVfcnhfc3RhdHMpIHsKIAkJCWZvcl9lYWNoX3Bvc3NpYmxl
X2NwdShjcHUpIHsKQEAgLTIzMDgsOCArMjMwNiw3IEBAIHZvaWQgc3RhX3NldF9zaW5mbyhzdHJ1
Y3Qgc3RhX2luZm8gKnN0YSwgc3RydWN0IHN0YXRpb25faW5mbyAqc2luZm8sCiAKIAlpZiAoIShz
aW5mby0+ZmlsbGVkICYgKEJJVF9VTEwoTkw4MDIxMV9TVEFfSU5GT19SWF9CWVRFUzY0KSB8CiAJ
CQkgICAgICAgQklUX1VMTChOTDgwMjExX1NUQV9JTkZPX1JYX0JZVEVTKSkpKSB7Ci0JCWlmICgh
aWVlZTgwMjExX2h3X2NoZWNrKCZsb2NhbC0+aHcsIFVTRVNfUlNTKSkKLQkJCXNpbmZvLT5yeF9i
eXRlcyArPSBzdGFfZ2V0X3N0YXRzX2J5dGVzKCZzdGEtPnJ4X3N0YXRzKTsKKwkJc2luZm8tPnJ4
X2J5dGVzICs9IHN0YV9nZXRfc3RhdHNfYnl0ZXMoJnN0YS0+cnhfc3RhdHMpOwogCiAJCWlmIChz
dGEtPnBjcHVfcnhfc3RhdHMpIHsKIAkJCWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKCgpq
b2hhbm5lcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
