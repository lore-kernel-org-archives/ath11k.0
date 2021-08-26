Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B863BC4320E
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:59:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1986108F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C1986108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Pk2bjEuo8fVlgPWrw52jGhAstMnzya/BpP7g79z844=; b=GwNEVslCsep2lr
	KlIJFPOfb8z+VW9XD0csQxzFCfxfX3KlzqaVEYdQeIH3tHsHz8uT9oPsJZ0ZYa0rq1LVQ7X4AkE8V
	/EVyH46lqIkBJzDMdBXr8VLyXh4/ojxk4W2XpvnivszwJyGg198c9HFLzLBCCWNC2c9FZ8Kul5AQ6
	wvTtiMY/ioBnYjvX3UdJKYPx6xaOYu3iyrOJa1j0M382CqTELbbVg9np3t/1Jhged4/TSerDStNuZ
	0kMsn10HuDVPZ/Cz/iO/woCbOvHbDa1jVgIQjnjelYg6UCVUMA4ycbDJnWUDMstlOcQNk8DLhjsHF
	kMC8orZWEJb26JFLszVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD6K-009qeM-La; Thu, 26 Aug 2021 10:59:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD6F-009qd3-Oi
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=gDiGKjEUkKRAhz5HdTK51/IAOIhHO1MVRogdEKMpohQ=; 
 t=1629975551; x=1631185151; b=N8isYT6rkz5KkKPw6D/5nOiakVZNjGZ1kJC2a+EelE0tnB9
 oF/s13xyCC61eP4rIpjBYrWvSUB+ppDVnXWYuUsAY/Z98eStoVdbfJtsqz4QrmWtpM4dcEMrRUZkN
 Zy8CKmsSVhDS8CwcpY//S0XpdUCJid3GdS5TmE3YFVrr5nA0SMI4eJLG/MYeDSQUbM2rJNB5L8Ao9
 Lq6igaTyAhukgeolTE9Lv9OO8qN6XcwNkHg129jdAx1sZ7EPgCbUOnWnV26p9pJwV3hrErIK5ML1j
 hB//EFAhC7pRlvNtPt8FH2OE/vf1OpgKyG+OZaeinvAybhvrcx6O0GlfRrPxzhiw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJD6E-00G7PG-3A; Thu, 26 Aug 2021 12:59:10 +0200
Message-ID: <7e07a64f33bc1a1ca09e36d6152628478a622b69.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 12:59:09 +0200
In-Reply-To: <e6006814059d085a1f57af24b9561dde@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
 <e6006814059d085a1f57af24b9561dde@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035911_845219_E956DD82 
X-CRM114-Status: GOOD (  12.74  )
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

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDE4OjU3ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiAy
MDIxLTA4LTI2IDE2OjIwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gPiDCoHN0cnVjdCBjZmc4
MDIxMV9jaGFuX2RlZiB7Cj4gPiA+IMKgCXN0cnVjdCBpZWVlODAyMTFfY2hhbm5lbCAqY2hhbjsK
PiA+ID4gQEAgLTY4NCw2ICs2ODUsNyBAQCBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgewo+ID4g
PiDCoAl1MzIgY2VudGVyX2ZyZXEyOwo+ID4gPiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2VkbWcgZWRt
ZzsKPiA+ID4gwqAJdTE2IGZyZXExX29mZnNldDsKPiA+ID4gKwllbnVtIG5sODAyMTFfYXBfcmVn
X3Bvd2VyIHBvd2VyX3R5cGU7Cj4gPiAKPiA+IEknbSBub3Qgc3VyZSB3aHkgdGhpcyBzaG91bGQg
YmUgaW4gdGhlIGNoYW5kZWYsIHRoZXJlJ3Mgbm8gd2F5IHRoYXQKPiA+IGFueXRoaW5nIGluIGNm
ZzgwMjExIGlzIGV2ZXIgdXNpbmcgaXQgdGhlcmUsIGF0IGxlYXN0IGluIHlvdXIgcGF0Y2hlcy4K
PiA+IAo+IEl0IGlzIHVzZWQgaW4gbWFjODAyMTEgb2YgW1BBVENIIHYyIDMvOF0gbWFjODAyMTE6
IGFkZCBwYXJzZSByZWd1bGF0b3J5IAo+IGluZm8gaW4gNiBHSHogb3BlcmF0aW9uIGluZm9ybWF0
aW9uLgo+IHNob3VsZCBpIG1vdmUgaXQgdG8gbWFjODAyMTEncyAuaCBmaWxlPwo+ID4gPiArLyoq
Cj4gPiA+ICsgKiBlbnVtIG5sODAyMTFfYXBfcmVnX3Bvd2VyIC0gcmVndWxhdG9yeSBwb3dlciBm
b3IgYSBBY2Nlc3MgUG9pbnQKWy4uLl0KPiA+IAo+IEl0IGlzIHVzZWQgaW4gbWFjODAyMTEgb2Yg
W1BBVENIIHYyIDMvOF0gbWFjODAyMTE6IGFkZCBwYXJzZSByZWd1bGF0b3J5IAo+IGluZm8gaW4g
NiBHSHogb3BlcmF0aW9uIGluZm9ybWF0aW9uLgo+IHNob3VsZCBpIG1vdmUgaXQgdG8gbWFjODAy
MTEncyAuaCBmaWxlPwoKWWVhaCBJIHNhdyBib3RoIG9mIHRoZW0gYXJlIHVzZWQsIGJ1dCB3aHkg
YXJlIHRoZXkgZGVmaW5lZCBhcyBubDgwMjExCkFQST8gRG8geW91IGhhdmUgYW55IGludGVudGlv
biB0byBzZXQgdGhlbSB0aHJvdWdoIG5sODAyMTE/CgpBbmQgbGlrZSBJIHNhaWQsIEknbSBub3Qg
cmVhbGx5IGNvbnZpbmNlZCB0aGlzIGJlbG9uZ3MgaW50byBzdHJ1Y3QKY2ZnODAyMTFfY2hhbl9k
ZWYgZWl0aGVyLiBNYXliZSBpdCBzaG91bGQgYmUgaW4gYnNzX2NvbmYgdG9vPwoKam9oYW5uZXMK
PiAKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
