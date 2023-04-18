Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82132C77B76
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOj5zIcS0r1mqPiJrEaIJp2+EapGVkaqGHGuyHPmCZo=; b=Kfw5wd7LBLPaZb
	WHTVS8bUBKVHACqHkgEnh6pQ9pF6DCVUbRTqcH2CJVpXulAwgG5gWVIArZOTb61ASL4eQABD+t+u/
	U+BExPU7aKF9cWHBF1iRxso5GkhjXbXhcp9D+TctBedNHa3Fynr/FSwX20/yJ7euDdVaqWjfmJIr2
	H7w3JaxxP9S742HvvIXuWXCHY7nByajBC66WMCehcoWcSvCHpGMq0wnhu6lXXFDUvkWo/Qd0Yo+dC
	1lnMWpkBvrjRdwia2D3+c2ioLdHCy/WvuvxQXLffjPAr6EVygNlEl2/a2Asi/9nJQY1lomFTBCMoH
	4TmERLsG3G5nHVlc0xKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohNg-001Q5J-0e;
	Tue, 18 Apr 2023 09:12:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohNd-001Q4U-2X
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zK8zF1kv2IyfmHNqL8WpvXeKTJt2wi4/ey5nx1c2iU0=;
	t=1681809125; x=1683018725; b=CqkgfnawxDMWE3o28T5fxpSMDcy8jiLT5A3tcqk+H53/Gdt
	wHj+p5Utg2kNI4CLqk07fWe3Tu8zpmL1h5BUZZw/5xoVwmjWlPCy7Pg8Txz75thNTxfapVUKObNms
	ZQvhXpLSnbK7Pn1Nu/sHRipZQijJN5CT3dN7YMVOG5qDRPxZTH6TAeMqgCUUSmDSWZLqhczxKKOAY
	TnyGYOaM7ba6zzrgjDqynQaljezw0xALX5kFOMokZbuT4GwNicN0j/td1P1GB9Zu10Gk35mkUxgQc
	MlBuuz3Qp9HQutQmIkE9DqcZQwlFv2LGoluyHxQjwzCCDGYELT0tX2Bvk08U/8Yg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pohNY-001YUp-2P;
	Tue, 18 Apr 2023 11:12:01 +0200
Message-ID: <6a33a41b5aa6c98d95ff934fbb6a10dfe78e6e6e.camel@sipsolutions.net>
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 11:11:59 +0200
In-Reply-To: <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
	 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
	 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
	 <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
	 <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_021205_823537_2185CE47 
X-CRM114-Status: GOOD (  21.97  )
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

T24gVHVlLCAyMDIzLTA0LTE4IGF0IDE3OjAyICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA0
LzE4LzIwMjMgNDo0OCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiA+
IE15IGNhc2UgaXM6Cj4gPiA+IFdoZW4gY29ubmVjdCB3aXRoIDIgbGlua3MgQVAsIHRoZSBjZmc4
MDIxMV9ob2xkX2JzcygpIGlzIGNhbGxlZCBieQo+ID4gPiBjZmc4MDIxMV9tbG1lX2Fzc29jKCkK
PiA+ID4gZm9yIGVhY2ggQlNTIG9mIHRoZSAyIGxpbmtzLAo+ID4gPiAKPiA+ID4gV2hlbiBhc3Nz
b2NSZXNwIGZyb20gQVAgaXMgbm90IHN1Y2Nlc3Moc3VjaCBhcyBzdGF0dXNfY29kZT09MSksIHRo
ZQo+ID4gPiBpZWVlODAyMTFfbGlua19kYXRhIG9mIDJuZCBsaW5rKHNkYXRhLT5saW5rW2xpbmtf
aWRdKQo+ID4gPiBpcyBOVUxMIGJlY2F1c2UgaWVlZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKS0+aWVl
ZTgwMjExX3ZpZl91cGRhdGVfbGlua3MoKQo+ID4gPiBpcyBub3QgY2FsbGVkLgo+ID4gPiAKPiA+
ID4gVGhlbiBzdHJ1Y3QgY2ZnODAyMTFfcnhfYXNzb2NfcmVzcCByZXNwIGluIGNmZzgwMjExX3J4
X2Fzc29jX3Jlc3AoKSBhbmQKPiA+ID4gc3RydWN0IGNmZzgwMjExX2Nvbm5lY3RfcmVzcF9wYXJh
bXMgY3IgaW4gX19jZmc4MDIxMV9jb25uZWN0X3Jlc3VsdCgpCj4gPiA+IHdpbGwgb25seSBoYXZl
IHRoZSBkYXRhIG9mCj4gPiA+IHRoZSAxc3QgbGluaywgYW5kIGZpbmFsbHkgY2ZnODAyMTFfY29u
bmVjdF9yZXN1bHRfcmVsZWFzZV9ic3NlcygpIG9ubHkKPiA+ID4gY2FsbCBjZmc4MDIxMV91bmhv
bGRfYnNzKCkKPiA+ID4gZm9yIHRoZSAxc3QgbGluaywgdGhlbiBCU1Mgb2YgdGhlIDJuZCBsaW5r
IHdpbGwgbmV2ZXIgZnJlZSBiZWNhdXNlIGl0cwo+ID4gPiBob2xkIGlzIGF3bGF5cyA+IDAgbm93
Lgo+ID4gSGFoLCB5ZXMsIG91Y2guCj4gPiAKPiA+ID4gSSBmb3VuZCBpdCBpcyBub3QgZWFzeSB0
byByZWZpbmUgaXQsIHNvIGRvIHlvdSBoYXZlIGFueSBhZHZpc2UvaWRlYT8KPiA+ID4gCj4gPiA+
IGZvciAobGlua19pZCA9IDA7IGxpbmtfaWQgPCBJRUVFODAyMTFfTUxEX01BWF9OVU1fTElOS1M7
IGxpbmtfaWQrKykgewo+ID4gPiAgIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfbGlu
a19kYXRhICpsaW5rOwo+ID4gPiAKPiA+ID4gICDCoMKgwqDCoMKgwqDCoCBsaW5rID0gc2RhdGFf
ZGVyZWZlcmVuY2Uoc2RhdGEtPmxpbmtbbGlua19pZF0sIHNkYXRhKTsKPiA+ID4gICDCoMKgwqDC
oMKgwqDCoCBpZiAoIWxpbmspCj4gPiA+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTsKPiA+ID4gCj4gPiA+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKCFhc3NvY19kYXRhLT5saW5rW2xp
bmtfaWRdLmJzcykKPiA+ID4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+ID4g
PiAKPiA+ID4gICDCoMKgwqDCoMKgwqDCoCByZXNwLmxpbmtzW2xpbmtfaWRdLmJzcyA9IGFzc29j
X2RhdGEtPmxpbmtbbGlua19pZF0uYnNzOwo+ID4gPiAgIMKgwqDCoMKgwqDCoMKgIHJlc3AubGlu
a3NbbGlua19pZF0uYWRkciA9IGxpbmstPmNvbmYtPmFkZHI7Cj4gPiA+ICAgwqDCoMKgwqDCoMKg
wqAgcmVzcC5saW5rc1tsaW5rX2lkXS5zdGF0dXMgPSBhc3NvY19kYXRhLT5saW5rW2xpbmtfaWRd
LnN0YXR1czsKPiA+ID4gCj4gPiBCdXQgaXMgaXQgcmVhbGx5IHNvIGhhcmQ/IFdlIG9ubHkgbmVl
ZCBsaW5rIGZvciBsaW5rLT5jb25mLT5hZGRyLCBhbmQgd2UKPiA+IGNhbiB1c2UgYXNzb2NfZGF0
YS0+bGlua1tsaW5rX2lkXS5hZGRyIGZvciB0aGF0IGluc3RlYWQsIG5vPyBXZSBuZWVkIHRvCj4g
PiBzdG9yZSB0aG9zZSBsb2NhbGx5IHRvIGF2b2lkIGEgdXNlLWFmdGVyLWZyZWUsIGJ1dCB0aGF0
J3MgYXQgbW9zdCAxNQo+ID4gYWRkcmVzc2VzIG9uIHRoZSBzdGFjaywgd2hpY2ggc2VlbXMgYWNj
ZXB0YWJsZT8KPiA+IAo+ID4gT2ggYW5kIHRoZXJlJ3MgdGhlIHVhcHNkIHN0dWZmIGJ1dCB0aGF0
IG9ubHkgbWF0dGVycyBpbiB0aGUgc3VjY2VzcyBjYXNlCj4gPiBhbnl3YXkuIEluIGZhY3QgSSdt
IG5vdCBldmVuIHN1cmUgdGhlIGFkZHJlc3MgbWF0dGVycyBpbiB0aGUKPiA+IHVuc3VjY2Vzc2Z1
bCBjYXNlIGJ1dCB3ZSBoYXZlIGl0IHByZXR0eSBlYXNpbHkuCj4gPiAKPiA+IGpvaGFubmVzCj4g
T0suIFNvIEkgZ3Vlc3MgeW91IGFscmVhZHkgaGF2ZSBnb29kIHdheSB0byByZWZpbmUgaXQ/Cj4g
CgpObywgbm90IHJlYWxseSwgd2FzIGp1c3QgdGhpbmtpbmcgb3V0IGxvdWQgaGVyZSA6KQoKam9o
YW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
