Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBB4C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:29:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5CF600CC
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE5CF600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rXd0MBykFlI76bYRZ5LzkqETBnlb/nYkVxuX84qSVE=; b=shd8/ijHcKQwNx
	bMxT2t/yV3fRCptnn+HFgo0rPSSsRM/KsVHW7NN13kSjAAaxIT918Q9onLmXbjFb3OvZ0T7VIMQPu
	408qiCAwHxRl7kSIqjrT2NC1I2HUraXmNuvt27nMra67Eyp6lsG53NIFccTb6DjjObxoEEzXaepd1
	UKJj/1gKcIcW6y/hqD+TEfeFXTxtwhDIGSLhEpVOzWKbiFnBYDWr7Hia4mKqZE57wQoC21H5yfYYf
	mysCaBRIXdnbFyQpYqYbIvSByHKMXG8JECF/HGE1h64bG/tteVoXXX5ugij4u2dWJKXg6HlOKLBr4
	+42dPCd/2ipZPOzX0tng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAlC-009YGs-RR; Thu, 26 Aug 2021 08:29:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAl8-009YGL-0Q
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ChWPK7ox2IYbPXxDUF/DiOKMbfiJndJaeviCuolqwVE=; 
 t=1629966553; x=1631176153; b=rd41ePepwBO/0fiiy/ziW9itczKaLCeK9ErJ2dvVsazMgz8
 Vi6vVJdrecz/xOWmrgkjtbF1DNKZqEip6e5sEMDp7APAV6fOBcodLjfg/uNTbqRqWNO6e/ZYOCYbv
 OsMOAd+jIYTjbevuJ2OevpqTyWDJaBQxPfEK246MlnAX0yG7fIfqFPa2e7rmmobdTR68uzVdVFXNt
 fKWASNRo4ZMufg+boipLZ5jMLGQA5dlPQENZcS0EnhCl9PwBIyuJKL6IR6FbLi4qG1CgcCH5hE/R7
 BSl3HQ7scCel0qoYeCJm81fTpwld3J+3qjRb1yMWK0WWXTIhqKlUteH283411FrA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAl6-00G4rR-ET; Thu, 26 Aug 2021 10:29:12 +0200
Message-ID: <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:29:11 +0200
In-Reply-To: <20210820122041.12157-9-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012914_091964_9336FECD 
X-CRM114-Status: GOOD (  14.98  )
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

T24gRnJpLCAyMDIxLTA4LTIwIGF0IDA4OjIwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiAKPiDC
oAlpZiAoIShpZm1nZC0+ZmxhZ3MgJiBJRUVFODAyMTFfU1RBX0RJU0FCTEVfSEUpKSB7Cj4gwqAJ
CWNvbnN0IHN0cnVjdCBjZmc4MDIxMV9ic3NfaWVzICppZXM7Cj4gKwkJc3RydWN0IGllZWU4MDIx
MV9ic3NfY29uZiAqYnNzX2NvbmY7CgphbSBJIG1pc3Npbmcgd2hlcmUgeW91IHNldCB0aGlzPwoK
PiArCQlpZiAoaXNfNmdoeikgewo+ICsJCQlzdHJ1Y3QgaWVlZTgwMl8xMV9lbGVtcyBlbGVtczsK
ClRoaXMgaXMgcHJldHR5IGJpZywgbm90IHN1cmUgd2Ugd2FudCBpdCBvbiB0aGUgc3RhY2sgKGNh
dXNlcyB3YXJuaW5ncwpmb3IgbWUgaW4gYnVpbGQpLiBBbHNvLCBpZiB3ZSdyZSBkb2luZyB0aGlz
IGFueXdheSwgdGhlbiB3ZSBjYW4gY2hhbmdlCnRoZSBjb2RlIGFib3ZlIChwZXJoYXBzIGFzIGEg
c2VwYXJhdGUgcGF0Y2gpIHRvIG5vdCBkbwpjZmc4MDIxMV9maW5kX2V4dF9pZSgpIGJ1dCByYXRo
ZXIgdGFrZSBpdCBvdXQgb2YgdGhlIHBhcnNlZC4KCj4gKwkJCXU4IGksIGogPSAwOwo+ICsKPiAr
CQkJaWVlZTgwMl8xMV9wYXJzZV9lbGVtcyhpZXMtPmRhdGEsIGllcy0+bGVuLCBmYWxzZSwgJmVs
ZW1zLAoKKGxpbmUgdG9vIGxvbmcpCgo+ICsJCQkJCSAgICAgICBOVUxMLCBOVUxMKTsKPiArCj4g
KwkJCWlmIChlbGVtcy5wd3JfY29uc3RyX2VsZW0pCj4gKwkJCQlic3NfY29uZi0+cHdyX3JlZHVj
dGlvbiA9ICplbGVtcy5wd3JfY29uc3RyX2VsZW07CgpiZWZvcmUgdXNpbmcgaXQ/Cgo+ICsKPiAr
CQkJQlVJTERfQlVHX09OKEFSUkFZX1NJWkUoYnNzX2NvbmYtPnR4X3B3cl9lbnYpICE9Cj4gKwkJ
CQkgICAgIEFSUkFZX1NJWkUoZWxlbXMudHhfcHdyX2VudikpOwo+ICsKPiArCQkJZm9yIChpID0g
MDsgaSA8IGVsZW1zLnR4X3B3cl9lbnZfbnVtOyBpKyspIHsKPiArCQkJCWlmIChlbGVtcy50eF9w
d3JfZW52X2xlbltpXSA+Cj4gKwkJCQkgICAgc2l6ZW9mKGJzc19jb25mLT50eF9wd3JfZW52W2pd
KSkKPiArCQkJCQljb250aW51ZTsKCkkgZGlkIHRoYXQgaW4gdGhlIHBhcnNpbmcgaXRzZWxmLgoK
PiArCj4gKwkJCQlic3NfY29uZi0+dHhfcHdyX2Vudl9udW0rKzsKPiArCQkJCW1lbWNweSgmYnNz
X2NvbmYtPnR4X3B3cl9lbnZbal0sIGVsZW1zLnR4X3B3cl9lbnZbaV0sCj4gKwkJCQkgICAgICAg
ZWxlbXMudHhfcHdyX2Vudl9sZW5baV0pOwoKWW91J3JlIG5ldmVyIHJlc2V0dGluZyBhbnkgb2Yg
dGhpcyBmb3IgdGhlIG5leHQgY29ubmVjdGlvbiAoaWYgaXQncyBub3QKNiBHSHogZm9yIGV4YW1w
bGUsIG9yIGRvZXNuJ3QgaGF2ZSBhbnkgZGF0YSkgLSBzaG91bGQgcHJvYmFibHkgbWVtc2V0CmFs
bCB0aGUgbmV3IG1lbWJlcnMgdG8gMCBiZWZvcmUgdGhlICJpZiAoaXNfNmdoeikiIG9yIHNvPwoK
am9oYW5uZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
