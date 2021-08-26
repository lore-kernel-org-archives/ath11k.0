Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0F5C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:22:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C991F61037
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C991F61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov6yYPzSwxprqLcHMplwkh7u7SzYW6heFgaqQ33dlo0=; b=ozlFSv3NkvKTwe
	+KBjQ0Q8YOq18Ta+N6CI8eOExzWDozq3MCdtRuCEgZxsHSqMH4BdgZqAqOkTsgaCm+qD9Hp14GmC6
	Nqlnd1iBzz9dwYGFkJPy36JjXSCPm6piez/vwyQERmEsiXbU33dFJRFMlGPZ0K+OfKpUuAKVzeUcd
	flAXCsK4cOwv9nRahoaExPVu9Snx4MOti1TNVR/Na0dC+hlWndeK59NhoqzVkMHsKR9oK5ZR/tEQu
	gr6YgPezgNNUyJTp0hOeP0N62Q3zCb2kiam6kpZ1jCcH4lTHaQKbnyU+2cHUMSFMh4vx3dQsckRP1
	g4rgWNSQQgQj+XZuO6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAej-009XfB-J2; Thu, 26 Aug 2021 08:22:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAed-009Xeb-Sm
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Qz1AgzJuBgAQZ9DGE2QiZ6gpesJH6ixLBBGr9oJj3sQ=; 
 t=1629966151; x=1631175751; b=Wp5FkXW7lP9H1UwWY2biG44GCxGnkHr+BEZ/SsgHMSVfWE8
 n2jP4NC0NsfpjmSrZpyBef/IkAXQfYlwzEhtqHDSRSF034CFloKQRUuALjJIWXmVwYx0h99ESzi4O
 73Uui+veCYV147imU5sALy4LzSu9u6CMt5qs2AJ2iU1lcwR8RbUyn04zXksadpdrjBS18iMmgX3/j
 aZHh85RzEOT/LPNMciJLcZoIF9bJlUwHVBVs9BKq5jqSxiDAUor4HfrIn3JNA/jR2ulb+9T+oGFJ+
 iN1osNk4rcPg9dWPADdfWrNeorJvm8vrfyvINqe7VDFIURSklqy9Jkt8rQsPoWeA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAec-00G4j1-1T; Thu, 26 Aug 2021 10:22:30 +0200
Message-ID: <4ab79bd421d021a2199c71471f60fefb97f317ad.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:22:29 +0200
In-Reply-To: <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-2-wgong@codeaurora.org>
 <b6ba152ce1efde5863cae53a94728e8472ba53c0.camel@sipsolutions.net>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012231_969937_B6D25EE9 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDEwOjIwICswMjAwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+
ID4gwqBzdHJ1Y3QgY2ZnODAyMTFfY2hhbl9kZWYgewo+ID4gwqAJc3RydWN0IGllZWU4MDIxMV9j
aGFubmVsICpjaGFuOwo+ID4gQEAgLTY4NCw2ICs2ODUsNyBAQCBzdHJ1Y3QgY2ZnODAyMTFfY2hh
bl9kZWYgewo+ID4gwqAJdTMyIGNlbnRlcl9mcmVxMjsKPiA+IMKgCXN0cnVjdCBpZWVlODAyMTFf
ZWRtZyBlZG1nOwo+ID4gwqAJdTE2IGZyZXExX29mZnNldDsKPiA+ICsJZW51bSBubDgwMjExX2Fw
X3JlZ19wb3dlciBwb3dlcl90eXBlOwo+IAo+IEknbSBub3Qgc3VyZSB3aHkgdGhpcyBzaG91bGQg
YmUgaW4gdGhlIGNoYW5kZWYsIHRoZXJlJ3Mgbm8gd2F5IHRoYXQKPiBhbnl0aGluZyBpbiBjZmc4
MDIxMSBpcyBldmVyIHVzaW5nIGl0IHRoZXJlLCBhdCBsZWFzdCBpbiB5b3VyIHBhdGNoZXMuCgpE
b2VzIGl0IGV2ZW4gKmFwcGx5KiB0byBhIGNoYW5uZWw/IFdoYXQgaWYgSSdtIGNvbm5lY3Rpbmcg
dG8gdHdvIEFQcyBvbgp0aGUgc2FtZSBjaGFubmVsICh0d28gY2xpZW50IGludGVyZmFjZXMpPwoK
am9oYW5uZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
