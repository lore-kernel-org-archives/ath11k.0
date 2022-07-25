Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9455BC43334
	for <ath11k@archiver.kernel.org>; Mon, 25 Jul 2022 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRjyAp94b2A3jE1/L6H8FSENeasiJlZFXOzaBex9Xhs=; b=kIUNEeGd3n8D8e
	QB4UXZg5FAljj3A5KZXWU52VVJW/ukbDkmb7KZ0ZmTex01WvOsTxCC1bJvpvYYTuLmR6MsZxqFlLY
	u3l8Cv9oxL0V3rEIsx4baPMVa1xe9ZLzH6CG0BLX7pWzdLnXhbl2kP1m2gvDSlB3G4JdyZ6ow8YeW
	OIkeeYXz9okuGWOifj7ubDbiCnPOnHA0JOoL2yFDpuB4ymu1gfLnTykyubv3p7mGAvZN31lR8f6sJ
	7YDPLjSsJBM1cAL1wLRAoKhgMcr/VcVlvpgEP3qx6f2/2mJO+4CK/WcUeb4oF92GhCGu7t2Ks/FWV
	wwMghc+iYb5ri22Zm/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2NO-00GL8E-K5; Mon, 25 Jul 2022 18:00:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2NL-00GL6m-SM
	for ath11k@lists.infradead.org; Mon, 25 Jul 2022 18:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66C6A61389;
	Mon, 25 Jul 2022 18:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10D9C341C6;
	Mon, 25 Jul 2022 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658772014;
	bh=umOm1cFvLaFJjBTJsRPIlLTUylpQHF2uRLMesgi8PmU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QVeeA1GKVVlstdAGGCckwZr3lMEVA1s+rUQZ3H4h0WaG+1dw9znU7VG0+B0nKWqLv
	 w2nBxCZZ2Ehtyr/3u9wb+G28xcY/wdwgxCWDl0ZenZwU2+llQ6AfkYhNAutiH1+e5a
	 dhABj+Zco8xFqSN40GASQ6LNiiPqAet1bW3exNUDzBtLISlzxli9AfgopZhQSIGKEV
	 UrXBG8fOUyOZwTg02cpqmpPDG/KaDAkgSSDZciMEwQIXBYWkIKNUGxRnHDeJ2pvi/V
	 oCwDaet87QemhqhvJaB2v66p8n5S0YBhSj5WrCIbc0JU3OX0ahwePnlzJ7iasxVO+t
	 xLw3DxJZyLCcQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v4 1/1] bus: mhi: host: Move IRQ allocation to controller registration phase
References: <1655952183-66792-1-git-send-email-quic_qianyu@quicinc.com>
	<20220624072740.GA12171@thinkpad> <87k08an038.fsf@kernel.org>
	<20220720093909.GA5747@thinkpad>
	<063fe6bf-11b1-1724-058f-0fed7247906e@quicinc.com>
	<20220721101914.GC36189@thinkpad>
Date: Mon, 25 Jul 2022 21:00:08 +0300
In-Reply-To: <20220721101914.GC36189@thinkpad> (Manivannan Sadhasivam's
	message of "Thu, 21 Jul 2022 15:49:14 +0530")
Message-ID: <87wnc1qdhz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_110016_013362_D17ED0DF 
X-CRM114-Status: GOOD (  27.20  )
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

TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gV2Vk
LCBKdWwgMjAsIDIwMjIgYXQgMDU6NDc6MzdQTSArMDgwMCwgUWlhbmcgWXUgd3JvdGU6Cj4KPj4g
Cj4+IE9uIDcvMjAvMjAyMiA1OjM5IFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4+
ID4gT24gTW9uLCBKdWwgMTgsIDIwMjIgYXQgMDI6MTU6MjNQTSArMDMwMCwgS2FsbGUgVmFsbyB3
cm90ZToKPj4gPiA+ICsgYXRoMTFrIGxpc3QKPj4gPiA+IAo+PiA+ID4gTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+IHdyaXRlczoKPj4gPiA+IAo+PiA+ID4gPiBPbiBUaHUs
IEp1biAyMywgMjAyMiBhdCAxMDo0MzowM0FNICswODAwLCBRaWFuZyBZdSB3cm90ZToKPj4gPiA+
ID4gPiBEdXJpbmcgcnVudGltZSwgdGhlIE1ISSBlbmRwb2ludCBtYXkgYmUgcG93ZXJlZCB1cC9k
b3duIHNldmVyYWwgdGltZXMuCj4+ID4gPiA+ID4gU28gaW5zdGVhZCBvZiBhbGxvY2F0aW5nIGFu
ZCBkZXN0cm95aW5nIHRoZSBJUlFzIGFsbCB0aGUgdGltZSwgbGV0J3MganVzdAo+PiA+ID4gPiA+
IGVuYWJsZS9kaXNhYmxlIElSUXMgZHVyaW5nIHBvd2VyIHVwL2Rvd24uCj4+ID4gPiA+ID4gCj4+
ID4gPiA+ID4gVGhlIElSUXMgd2lsbCBiZSBhbGxvY2F0ZWQgZHVyaW5nIG1oaV9yZWdpc3Rlcl9j
b250cm9sbGVyKCkgYW5kIGZyZWVkCj4+ID4gPiA+ID4gZHVyaW5nIG1oaV91bnJlZ2lzdGVyX2Nv
bnRyb2xsZXIoKS4gVGhpcyB3b3JrcyB3ZWxsIGZvciB0aGluZ3MgbGlrZSBQQ0kKPj4gPiA+ID4g
PiBob3RwbHVnIGFsc28gYXMgb25jZSB0aGUgUENJIGRldmljZSBnZXRzIHJlbW92ZWQsIHRoZSBj
b250cm9sbGVyIHdpbGwKPj4gPiA+ID4gPiBnZXQgdW5yZWdpc3RlcmVkLiBBbmQgb25jZSBpdCBj
b21lcyBiYWNrLCBpdCB3aWxsIGdldCByZWdpc3RlcmVkIGJhY2sKPj4gPiA+ID4gPiBhbmQgZXZl
biBpZiB0aGUgSVJRIGNvbmZpZ3VyYXRpb24gY2hhbmdlcyAoTVNJKSwgdGhhdCB3aWxsIGdldCBh
Y2NvdW50ZWQuCj4+ID4gPiA+ID4gCj4+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUg
PHF1aWNfcWlhbnl1QHF1aWNpbmMuY29tPgo+PiA+ID4gPiBBcHBsaWVkIHRvIG1oaS1uZXh0IQo+
PiA+ID4gSSBkaWQgYSBiaXNlY3QgYW5kIHRoaXMgcGF0Y2ggYnJlYWtzIGF0aDExayBkdXJpbmcg
cm1tb2QuIEknbSBvbgo+PiA+ID4gdmFjYXRpb24gcmlnaHQgbm93IHNvIEkgY2FuJ3QgaW52ZXN0
aWdhdGUgaW4gZGV0YWlsIGJ1dCBtb3JlIGluZm8gYmVsb3cuCj4+ID4gPiAKPj4gPiBJIGp1c3Qg
dGVzdGVkIGxpbnV4LW5leHQvbWFzdGVyIG5leHQtMjAyMjA3MTggb24gbXkgTlVDIHdpdGggUUNB
NjM5MCwgYnV0IEknbQo+PiA+IG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgZHVyaW5n
IHJtbW9kISBJbnN0ZWFkIEkgY291bGRuJ3QgY29ubmVjdCB0byBBUC4KPj4gCj4+IEkgc3VzcGVj
dCB0aGF0IGluIF9fZnJlZV9pcnEoKSwgaWYgQ09ORklHX0RFQlVHX1NISVJRIGlzIGVuYWJsZWQs
IGlycQo+PiBoYW5kbGVyIGZvciBhIHNoYXJlZCBJUlEgd2lsbCBiZSBpbnZva2VkIGFuZCBudWxs
IHBvaW50ZXIgYWNjZXNzIGhhcHBlbi4KPj4gCj4+ICNpZmRlZiBDT05GSUdfREVCVUdfU0hJUlEK
Pj4gwqDCoCDCoC8qCj4+IMKgwqAgwqAgKiBJdCdzIGEgc2hhcmVkIElSUSAtLSB0aGUgZHJpdmVy
IG91Z2h0IHRvIGJlIHByZXBhcmVkIGZvciBhbiBJUlEKPj4gwqDCoCDCoCAqIGV2ZW50IHRvIGhh
cHBlbiBldmVuIG5vdyBpdCdzIGJlaW5nIGZyZWVkLCBzbyBsZXQncyBtYWtlIHN1cmUgdGhhdAo+
PiDCoMKgIMKgICogaXMgc28gYnkgZG9pbmcgYW4gZXh0cmEgY2FsbCB0byB0aGUgaGFuZGxlciAu
Li4uCj4+IMKgwqAgwqAgKgo+PiDCoMKgIMKgICogKCBXZSBkbyB0aGlzIGFmdGVyIGFjdHVhbGx5
IGRlcmVnaXN0ZXJpbmcgaXQsIHRvIG1ha2Ugc3VyZSB0aGF0IGEKPj4gwqDCoCDCoCAqwqDCoCAn
cmVhbCcgSVJRIGRvZXNuJ3QgcnVuIGluIHBhcmFsbGVsIHdpdGggb3VyIGZha2UuICkKPj4gwqDC
oCDCoCAqLwo+PiDCoMKgIMKgaWYgKGFjdGlvbi0+ZmxhZ3MgJiBJUlFGX1NIQVJFRCkgewo+PiDC
oMKgIMKgwqDCoMKgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPj4gwqDCoCDCoMKgwqDCoCBhY3Rp
b24tPmhhbmRsZXIoaXJxLCBkZXZfaWQpOwo+PiDCoMKgIMKgwqDCoMKgIGxvY2FsX2lycV9yZXN0
b3JlKGZsYWdzKTsKPj4gwqDCoCDCoH0KPj4gI2VuZGlmCj4+IAo+Cj4gQWggeWVzLCBhZnRlciBl
bmFibGluZyBDT05GSUdfREVCVUdfU0hJUlEgSSBjb3VsZCByZXByb2R1Y2UgdGhlIGlzc3VlLgoK
U28gaG93IHRvIGZpeCB0aGlzIHJlZ3Jlc3Npb24/IChJZiB0aGVyZSdzIGFscmVhZHkgYSBmaXgg
SSBtaWdodCBoYXZlCm1pc3NlZCBpdCBhcyBJIGNhbWUgYmFjayBvbmx5IHRvZGF5KQoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
