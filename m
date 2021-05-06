Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95195C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 17:49:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C03466112F
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 17:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C03466112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6MxefjGwc8w69X1AZVCyUeijdu6XR9DUWGZpvWtGBEk=; b=h/FwI4mBiYaGfDgISiN3RwYjk
	DiUIweAB5Tx621HsGIHfav3ySjdYI0nu4ArYnue6AaqnOfawhrGyY254ChrDIUfTRqVlaHbWI7k+M
	McI+mVlSGgvoD87e2W5k+mAVho6vEB7PazN2RRjz3f+3d64RsagCVIyYLfA+CSbieDWX8xUPSomHm
	nY9DgLSqoDewLuJMIzEd3S9XNs1DVcG0Uh47PxfbJNza0vZkPUm1mIsari0RI7dm5pXfL2xeA8fod
	a8vQFKi8C6qWVuaGh2+18fgSaTNIEJmeWBDsmFqTJOla0PN/GpQ5bLUmSsbW6WkjFy+sEYo7eDkQF
	8J12gNN/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lei7k-004yKw-Nf; Thu, 06 May 2021 17:49:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lei7i-004yKK-8u
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 17:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ft7TUtBEdfOrFnaq7PjoD6JGt/OipKZ96jhb7jcLtCg=; b=Ftq6HvCvfmWvRrpzKpzGUnD3sE
 blCyy7gEQELQ/UHV2NXolgf96fH3bRx0j4oyh4+n5+uHqz0QV1XbLV9c24dO0wI+8QwuGsJk0LAHA
 fgZUsQSvljGOaJ1pATf9uw4urs+ArLKgjWk+GN0CWN2Svba1ZrLcVbrszjdOo4h4CyRfYGFlMO4Yv
 /2xohJ0dtciqnKUOLbbo9g7Hsmesv7jbMXdsLwjGg5VPw06HuhCwVyMIHlj+zcm5Z5Rmoww47kRiA
 3rmiOUI5DekdX2Qts1NCF0OUncIPDzAx3dv0Hi5caPFO7bV9im+PWmRrpz8i6Fu6xcEIEyUf1Dvdk
 PePSFagw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lei7e-006GUS-VB
 for ath11k@lists.infradead.org; Thu, 06 May 2021 17:49:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620323355; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ft7TUtBEdfOrFnaq7PjoD6JGt/OipKZ96jhb7jcLtCg=;
 b=DNubwXAxk0RgEhw6G2QfpHtGwMKYW3ZLEuErzwIebJixRcq24ikzd98OxniDWEnrSI66adhE
 VhGmTl64Ohttr4d81OKckUbWOJFyhWNhddzoxODEFvKiw62o+ZWztSp2+PUpJ/inNoWKveCD
 ccr7IA0Q74TBfDLrInQx0NTnX7c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60942c138807bcde1d5918fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 17:49:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17AFBC4338A; Thu,  6 May 2021 17:49:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tmariyap)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EE1BC433D3;
 Thu,  6 May 2021 17:49:06 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 06 May 2021 23:19:06 +0530
From: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
In-Reply-To: <ec30381c062e3eb87abb724641a15331cfc3d11c.camel@sipsolutions.net>
References: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
 <c0aef41d2ecf09188de372fe4f7d6b1954e54e07.camel@sipsolutions.net>
 <1ee8d562986128767c037d20aedb96a5@codeaurora.org>
 <ec30381c062e3eb87abb724641a15331cfc3d11c.camel@sipsolutions.net>
Message-ID: <df6e33fe198e179f1c1f31ca6d55e995@codeaurora.org>
X-Sender: tmariyap@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_104915_616689_315883C4 
X-CRM114-Status: GOOD (  22.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNC0yMyAxMzoyOCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBXZWQsIDIwMjEt
MDQtMjEgYXQgMjI6MTggKzA1MzAsIFRoaXJhdml5YW0gTWFyaXlhcHBhbiB3cm90ZToKPj4gSW4g
Y2FzZSBvZiBNZXNoIGZhc3RfcnggaXMgbm90IGFwcGxpY2FibGUsIGJ1dCBzdGlsbCBVU0VTX1JT
UyBjYW4gYmUKPj4gZW5hYmxlZCBmcm9tIGRyaXZlciB3aGVuIHBhcmFsbGVsIFJYIGlzIHN1cHBv
cnRlZCBieSBIVy9Ecml2ZXIsCj4+IHJpZ2h0P8KgCj4gCj4gWWVzLCBJIGd1ZXNzIHRoYXQncyB0
cnVlLgo+IAo+PiBIZW5jZSBjaGVja2VkIGZvciBVU0VTX1JTUyBzdXBwb3J0IHRvIHVwZGF0ZSBw
ZXIgY3B1IHN0YXRzLlBsZWFzZQo+PiBjb3JyZWN0IG1lIGlmIHRoZSBtZWFuaW5nIG9mIFVTRVNf
UlNTIGlzIG1pc3VuZGVyc3Rvb2QgYW5kIGl0IGFwcGxpZXMKPj4gb25seSB3aGVuIGZhc3Rfcngg
Zm9yIGEgU1RBIGlzIGVuYWJsZWQuCj4+IAo+IAo+IFdlbGwsIGFjdHVhbGx5IHVzaW5nIG11bHRp
LXF1ZXVlIGlzIHBvaW50bGVzcyBvciBldmVuIAo+IGNvdW50ZXItcHJvZHVjdGl2ZQo+IHdoZW4g
eW91IGRvbid0IGhhdmUgZmFzdC1SWCwgc2luY2UgdGhlbiB5b3UnbGwgcnVuIGludG8gYSBjb21t
b24gbG9jaywKPiBhbmQgZG9pbmcgbXVjaCBwcm9jZXNzaW5nIG9uIG11bHRpcGxlIENQVXMgYnV0
IHVuZGVyIGEgY29tbW9uIGxvY2sgCj4gbWlnaHQKPiB3ZWxsIGJlIHdvcnNlIHRoYW4gZG9pbmcg
aXQgb24gYSBzaW5nbGUgQ1BVIGluIHRoZSBmaXJzdCBwbGFjZSwgc2luY2UKPiB5b3UnbGwgYm91
bmNlIHRoZSBsb2NrIGFyb3VuZCBhbGwgdGhlIHRpbWUuCj4gCj4gSG93ZXZlciwgeW91J3JlIHJp
Z2h0IHRoYXQgdGhlIGRyaXZlciBtaWdodCBnZW5lcmFsbHkgYWR2ZXJ0aXNlCj4gVVNFU19SU1Ms
IGJ1dCB0aGVuIG5vdCBkbyBpdCBmb3IgbWVzaCwgYnV0IHRoYXQgdGhyb3dzIG9mZiBzb21lCj4g
c3RhdGlzdGljcy4KPiAKPiBTb21ldGhpbmcgbGlrZSB0aGlzIG1pZ2h0IHRoZW4gYmUgYSBtdWNo
IGJldHRlciBmaXggdGhvdWdoPwpCZWxvdyBmaXggZ29vZCB0byBtZSBhbmQgd29ya2luZyBmaW5l
Lgo+IAo+IAo+IGRpZmYgLS1naXQgYS9uZXQvbWFjODAyMTEvc3RhX2luZm8uYyBiL25ldC9tYWM4
MDIxMS9zdGFfaW5mby5jCj4gaW5kZXggZWM2OTczZWU4OGVmLi5mODdlODgzODYyZDkgMTAwNjQ0
Cj4gLS0tIGEvbmV0L21hYzgwMjExL3N0YV9pbmZvLmMKPiArKysgYi9uZXQvbWFjODAyMTEvc3Rh
X2luZm8uYwo+IEBAIC0yMDkyLDcgKzIwOTIsNyBAQCBzdGFfZ2V0X2xhc3Rfcnhfc3RhdHMoc3Ry
dWN0IHN0YV9pbmZvICpzdGEpCj4gIAlzdHJ1Y3QgaWVlZTgwMjExX2xvY2FsICpsb2NhbCA9IHN0
YS0+bG9jYWw7Cj4gIAlpbnQgY3B1Owo+IAo+IC0JaWYgKCFpZWVlODAyMTFfaHdfY2hlY2soJmxv
Y2FsLT5odywgVVNFU19SU1MpKQo+ICsJaWYgKCFzdGEtPnBjcHVfcnhfc3RhdHMpCj4gIAkJcmV0
dXJuIHN0YXRzOwo+IAo+ICAJZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+IEBAIC0yMTky
LDkgKzIxOTIsNyBAQCBzdGF0aWMgdm9pZCBzdGFfc2V0X3RpZHN0YXRzKHN0cnVjdCBzdGFfaW5m
byAKPiAqc3RhLAo+ICAJaW50IGNwdTsKPiAKPiAgCWlmICghKHRpZHN0YXRzLT5maWxsZWQgJiBC
SVQoTkw4MDIxMV9USURfU1RBVFNfUlhfTVNEVSkpKSB7Cj4gLQkJaWYgKCFpZWVlODAyMTFfaHdf
Y2hlY2soJmxvY2FsLT5odywgVVNFU19SU1MpKQo+IC0JCQl0aWRzdGF0cy0+cnhfbXNkdSArPQo+
IC0JCQkJc3RhX2dldF90aWRzdGF0c19tc2R1KCZzdGEtPnJ4X3N0YXRzLCB0aWQpOwo+ICsJCXRp
ZHN0YXRzLT5yeF9tc2R1ICs9IHN0YV9nZXRfdGlkc3RhdHNfbXNkdSgmc3RhLT5yeF9zdGF0cywg
dGlkKTsKPiAKPiAgCQlpZiAoc3RhLT5wY3B1X3J4X3N0YXRzKSB7Cj4gIAkJCWZvcl9lYWNoX3Bv
c3NpYmxlX2NwdShjcHUpIHsKPiBAQCAtMjMwOCw4ICsyMzA2LDcgQEAgdm9pZCBzdGFfc2V0X3Np
bmZvKHN0cnVjdCBzdGFfaW5mbyAqc3RhLCBzdHJ1Y3QKPiBzdGF0aW9uX2luZm8gKnNpbmZvLAo+
IAo+ICAJaWYgKCEoc2luZm8tPmZpbGxlZCAmIChCSVRfVUxMKE5MODAyMTFfU1RBX0lORk9fUlhf
QllURVM2NCkgfAo+ICAJCQkgICAgICAgQklUX1VMTChOTDgwMjExX1NUQV9JTkZPX1JYX0JZVEVT
KSkpKSB7Cj4gLQkJaWYgKCFpZWVlODAyMTFfaHdfY2hlY2soJmxvY2FsLT5odywgVVNFU19SU1Mp
KQo+IC0JCQlzaW5mby0+cnhfYnl0ZXMgKz0gc3RhX2dldF9zdGF0c19ieXRlcygmc3RhLT5yeF9z
dGF0cyk7Cj4gKwkJc2luZm8tPnJ4X2J5dGVzICs9IHN0YV9nZXRfc3RhdHNfYnl0ZXMoJnN0YS0+
cnhfc3RhdHMpOwo+IAo+ICAJCWlmIChzdGEtPnBjcHVfcnhfc3RhdHMpIHsKPiAgCQkJZm9yX2Vh
Y2hfcG9zc2libGVfY3B1KGNwdSkgewo+IAo+IAo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxp
bmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
