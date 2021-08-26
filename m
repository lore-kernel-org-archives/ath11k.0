Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824D6C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C23F60FC1
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C23F60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5xe8VhZAzOyWfzpeBWv892m+kCi/gGFmvQ30ma07h0=; b=j0FXg29pnUSeXD
	KEyrQcck7/uUG8TFH9C+vroLiMRVuwsXcw8egyf5Bk8aNpAHe+Ys7CTrIcM8XrKPxOoRZS+LF6ssp
	AlowLejcoyB/2QuA3QcWdS8Afcz/9HFXDbbFChmXpSWIKRfEXoz1ODhOizoRX/f7+lJa5SogSN7Wb
	uSRjRNccAUf942bCni4KOqNoYA9S1dtmZU9Co/LQa8Nhg88/d4e9HrlKsogs3K0uoIGauW+0wUwQp
	5DOEA0K3ORZYRWoQOcUc+FWHNMKMIOkb/5IiboLV4ZyWJApdgrdjX09UnboWAkflw631M9VNPoLsN
	HX1rmvlVPOvchJ7TrY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD47-009q6t-5l; Thu, 26 Aug 2021 10:56:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD41-009q69-MK
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=PNQZ+rHh7hl5a47PmWoTZeWeMpHJ9fRvLz9pLHak5JM=; 
 t=1629975410; x=1631185010; b=k4XgA9wd65hLlb9TllR5DlFn2yd/g5IAZl2iYIXTt2hZX1L
 E27BiTwFiztF2/DOLDlploS8ODT9KWbzomI4tw3KaVmdoTYjZSsDcwljfNILZI34q3fEO591wwz+g
 WqnUTff/a97ZZXftGFwplNGkDE4PlZm//rpdgQnZgoMRcDmPdXxiXrV5Kd+wkbC9ChOtjs4ZQg2dR
 8cTCabvG2NKdpf5qxHTNBZHO3M/Nf7cRn10avqtdnOohIWFH+l++H49Rn3UITyEMpsHh3ZxSUrvWn
 QoRBKQa4UZ/Xb5WsHofL6VZmulW2L4q6vPGAezoQz95gK/4tXJ7GXKG2K3TbHZwg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJD3w-00G7K9-El; Thu, 26 Aug 2021 12:56:48 +0200
Message-ID: <b3d00d00525bbc2a31653df6c0ce72cfb4d1c8d7.camel@sipsolutions.net>
Subject: Re: [PATCH v2 5/8] cfg80211: save power spectral density(psd) of
 regulatory rule
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 12:56:47 +0200
In-Reply-To: <4eca272868dae4f7a923656a12b03024@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-6-wgong@codeaurora.org>
 <101b523a6fe06fea3e1c9642a1bf5e85a9d0e680.camel@sipsolutions.net>
 <4eca272868dae4f7a923656a12b03024@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035653_763924_FA9C3933 
X-CRM114-Status: GOOD (  10.25  )
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

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDE4OjQzICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiAy
MDIxLTA4LTI2IDE2OjI1LCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+ID4gSSB3YXMgZ29pbmcgdG8g
YXBwbHkgdGhpcyBhbmQgcGF0Y2ggNCBzcXVhc2hlZCwgc2F5aW5nOgo+ID4gCj4gPiAKPiA+IMKg
wqDCoMKgY2ZnODAyMTE6IHJlZ3VsYXRvcnk6IGhhbmRsZSA2IEdIeiBwb3dlciBzcGVjdHJhbCBk
ZW5zaXR5IChQU0QpCj4gPiAKPiA+IMKgwqDCoMKgNiBHSHogcmVndWxhdG9yeSBkb21haW5zIGlu
dHJvZHVjZSBwb3dlciBzcGVjdHJhbCBkZW5zaXR5IChQU0QpLgo+ID4gwqDCoMKgwqBBbGxvdyB3
aXBoeS1zcGVjaWZpYyByZWd1bGF0b3J5IHJ1bGVzIHRvIHNwZWNpZnkgdGhlc2UgdmFsdWVzLgo+
ID4gCj4gPiBidXQgLi4uCj4gPiA+IAo+ID4gPiArCQlpZiAoY2hhbi0+ZmxhZ3MgJiBJRUVFODAy
MTFfQ0hBTl9QU0QpCj4gPiA+ICsJCQljaGFuLT5wc2QgPSBtaW5fdChzOCwgcnJ1bGUxLT5wc2Qs
IHJydWxlMS0+cHNkKTsKPiA+ID4gKwo+ID4gCj4gPiBUaGlzIGlzIG9idmlvdXNseSB3cm9uZz8K
PiBZZXMgaXQgc2hvdWxkIGNoYW5nZSBsaWtlIHRoaXM6Cj4gCj4gCWlmICgocnJ1bGUxLT5mbGFn
cyAmIE5MODAyMTFfUlJGX1BTRCkgJiYgKHJydWxlMS0+ZmxhZ3MgJiAKPiBOTDgwMjExX1JSRl9Q
U0QpKQo+IAkJY2hhbi0+cHNkID0gbWluX3QoczgsIHJydWxlMS0+cHNkLCBycnVsZTEtPnBzZCk7
CgpPbmUgb2YgdGhvc2Ugc3RpbGwgc2hvdWxkIGJlIHJydWxlMiA6KQoKam9oYW5uZXMKCgotLSAK
YXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
