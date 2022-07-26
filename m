Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26444C00140
	for <ath11k@archiver.kernel.org>; Tue, 26 Jul 2022 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nXkb2d/B6bquVF8O48uqMaUJdulOHGyZkU4xotn3To=; b=RdpXrCyefJzM96
	UaVpMSe7Zq278lmCuoNyq5GgRrpbBOtZg4QIQ9b6YMHnOOk8GQUgfErkr0eF1zMtoMS0WgnYB8kS+
	3DwvHMRXP63BLrkNNfiP8vUIndWg0RKeAUH1D+YwFXauLZqNCzBbNDhRY81RBer1ihXecnMdKGJ48
	TK/fS5dG8OhwCsACPbpepynXJSyN9ruXTzFvWc2NeLM3aQYMkD4/FcZCVaD4Kgb/8W93XpC+k/UyU
	3BXGpFSMY2BezjR0nn0kfp0gjCUr/6NKWbSPtQfwCWfX5w1AFfLNpM5tmnO1vB0VkPSna8IAN+dSI
	yojIWXcR1oxpiI1rAA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOfN-001jxm-Vg; Tue, 26 Jul 2022 17:48:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOfK-001jf7-H6
	for ath11k@lists.infradead.org; Tue, 26 Jul 2022 17:48:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5A6BBCE11DB;
	Tue, 26 Jul 2022 17:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B45C433D6;
	Tue, 26 Jul 2022 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658857691;
	bh=jBQWWYLAlwhQocmCejiAludOWzxiwJJG/jaLDBo9abU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JaLKe/taM87sXwV5wgYLDJmRHMRotMw71eAuOWV5JPQFtC9dbG8P98j0vQaf7tELA
	 UhiiM6Qsjg7oz2zdNzGn4Wvr91JKJ9f4F99MdtQlwXdArtoBlxHf2/94oNO5nUSp7I
	 9413FCmNn8X5AKozZJWEGdfel/SDI/yZqdsNF3/sgLteCKjlEcXe1CSoetGZATQc+Q
	 ph06HgBlXIGdUVYUtP5BgQNbIfwSadrIAr0CDC4mkd2C2Mb8pKqqfVIB8TQkA1+xnz
	 S4QIkjDTMmgXPo2J7uThrqx3Y4fJgYm7QbPEH9D0dLeNdhTQ220KSPebSpSpt1mSuE
	 KbgK2TGJNgxUA==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v4 1/1] bus: mhi: host: Move IRQ allocation to controller registration phase
References: <1655952183-66792-1-git-send-email-quic_qianyu@quicinc.com>
	<20220624072740.GA12171@thinkpad> <87k08an038.fsf@kernel.org>
	<20220720093909.GA5747@thinkpad>
	<063fe6bf-11b1-1724-058f-0fed7247906e@quicinc.com>
	<20220721101914.GC36189@thinkpad> <87wnc1qdhz.fsf@kernel.org>
	<20220726080913.GF5522@workstation>
Date: Tue, 26 Jul 2022 20:48:05 +0300
In-Reply-To: <20220726080913.GF5522@workstation> (Manivannan Sadhasivam's
	message of "Tue, 26 Jul 2022 13:39:13 +0530")
Message-ID: <87h733rciy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_104818_981245_706E2AC2 
X-CRM114-Status: GOOD (  28.35  )
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

TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gTW9u
LCBKdWwgMjUsIDIwMjIgYXQgMDk6MDA6MDhQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90ZToKPgo+
PiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3JpdGVzOgo+PiAKPj4g
PiBPbiBXZWQsIEp1bCAyMCwgMjAyMiBhdCAwNTo0NzozN1BNICswODAwLCBRaWFuZyBZdSB3cm90
ZToKPj4gPgo+PiA+PiAKPj4gPj4gT24gNy8yMC8yMDIyIDU6MzkgUE0sIE1hbml2YW5uYW4gU2Fk
aGFzaXZhbSB3cm90ZToKPj4gPj4gPiBPbiBNb24sIEp1bCAxOCwgMjAyMiBhdCAwMjoxNToyM1BN
ICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiA+PiA+ID4gKyBhdGgxMWsgbGlzdAo+PiA+PiA+
ID4gCj4+ID4+ID4gPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3Jp
dGVzOgo+PiA+PiA+ID4gCj4+ID4+ID4gPiA+IE9uIFRodSwgSnVuIDIzLCAyMDIyIGF0IDEwOjQz
OjAzQU0gKzA4MDAsIFFpYW5nIFl1IHdyb3RlOgo+PiA+PiA+ID4gPiA+IER1cmluZyBydW50aW1l
LCB0aGUgTUhJIGVuZHBvaW50IG1heSBiZSBwb3dlcmVkIHVwL2Rvd24gc2V2ZXJhbCB0aW1lcy4K
Pj4gPj4gPiA+ID4gPiBTbyBpbnN0ZWFkIG9mIGFsbG9jYXRpbmcgYW5kIGRlc3Ryb3lpbmcgdGhl
IElSUXMgYWxsIHRoZSB0aW1lLCBsZXQncyBqdXN0Cj4+ID4+ID4gPiA+ID4gZW5hYmxlL2Rpc2Fi
bGUgSVJRcyBkdXJpbmcgcG93ZXIgdXAvZG93bi4KPj4gPj4gPiA+ID4gPiAKPj4gPj4gPiA+ID4g
PiBUaGUgSVJRcyB3aWxsIGJlIGFsbG9jYXRlZCBkdXJpbmcgbWhpX3JlZ2lzdGVyX2NvbnRyb2xs
ZXIoKSBhbmQgZnJlZWQKPj4gPj4gPiA+ID4gPiBkdXJpbmcgbWhpX3VucmVnaXN0ZXJfY29udHJv
bGxlcigpLiBUaGlzIHdvcmtzIHdlbGwgZm9yIHRoaW5ncyBsaWtlIFBDSQo+PiA+PiA+ID4gPiA+
IGhvdHBsdWcgYWxzbyBhcyBvbmNlIHRoZSBQQ0kgZGV2aWNlIGdldHMgcmVtb3ZlZCwgdGhlIGNv
bnRyb2xsZXIgd2lsbAo+PiA+PiA+ID4gPiA+IGdldCB1bnJlZ2lzdGVyZWQuIEFuZCBvbmNlIGl0
IGNvbWVzIGJhY2ssIGl0IHdpbGwgZ2V0IHJlZ2lzdGVyZWQgYmFjawo+PiA+PiA+ID4gPiA+IGFu
ZCBldmVuIGlmIHRoZSBJUlEgY29uZmlndXJhdGlvbiBjaGFuZ2VzIChNU0kpLCB0aGF0IHdpbGwg
Z2V0IGFjY291bnRlZC4KPj4gPj4gPiA+ID4gPiAKPj4gPj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBRaWFuZyBZdSA8cXVpY19xaWFueXVAcXVpY2luYy5jb20+Cj4+ID4+ID4gPiA+IEFwcGxpZWQg
dG8gbWhpLW5leHQhCj4+ID4+ID4gPiBJIGRpZCBhIGJpc2VjdCBhbmQgdGhpcyBwYXRjaCBicmVh
a3MgYXRoMTFrIGR1cmluZyBybW1vZC4gSSdtIG9uCj4+ID4+ID4gPiB2YWNhdGlvbiByaWdodCBu
b3cgc28gSSBjYW4ndCBpbnZlc3RpZ2F0ZSBpbiBkZXRhaWwgYnV0IG1vcmUgaW5mbyBiZWxvdy4K
Pj4gPj4gPiA+IAo+PiA+PiA+IEkganVzdCB0ZXN0ZWQgbGludXgtbmV4dC9tYXN0ZXIgbmV4dC0y
MDIyMDcxOCBvbiBteSBOVUMgd2l0aCBRQ0E2MzkwLCBidXQgSSdtCj4+ID4+ID4gbm90IGFibGUg
dG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBkdXJpbmcgcm1tb2QhIEluc3RlYWQgSSBjb3VsZG4ndCBj
b25uZWN0IHRvIEFQLgo+PiA+PiAKPj4gPj4gSSBzdXNwZWN0IHRoYXQgaW4gX19mcmVlX2lycSgp
LCBpZiBDT05GSUdfREVCVUdfU0hJUlEgaXMgZW5hYmxlZCwgaXJxCj4+ID4+IGhhbmRsZXIgZm9y
IGEgc2hhcmVkIElSUSB3aWxsIGJlIGludm9rZWQgYW5kIG51bGwgcG9pbnRlciBhY2Nlc3MgaGFw
cGVuLgo+PiA+PiAKPj4gPj4gI2lmZGVmIENPTkZJR19ERUJVR19TSElSUQo+PiA+PiDCoMKgIMKg
LyoKPj4gPj4gwqDCoCDCoCAqIEl0J3MgYSBzaGFyZWQgSVJRIC0tIHRoZSBkcml2ZXIgb3VnaHQg
dG8gYmUgcHJlcGFyZWQgZm9yIGFuIElSUQo+PiA+PiDCoMKgIMKgICogZXZlbnQgdG8gaGFwcGVu
IGV2ZW4gbm93IGl0J3MgYmVpbmcgZnJlZWQsIHNvIGxldCdzIG1ha2Ugc3VyZSB0aGF0Cj4+ID4+
IMKgwqAgwqAgKiBpcyBzbyBieSBkb2luZyBhbiBleHRyYSBjYWxsIHRvIHRoZSBoYW5kbGVyIC4u
Li4KPj4gPj4gwqDCoCDCoCAqCj4+ID4+IMKgwqAgwqAgKiAoIFdlIGRvIHRoaXMgYWZ0ZXIgYWN0
dWFsbHkgZGVyZWdpc3RlcmluZyBpdCwgdG8gbWFrZSBzdXJlIHRoYXQgYQo+PiA+PiDCoMKgIMKg
ICrCoMKgICdyZWFsJyBJUlEgZG9lc24ndCBydW4gaW4gcGFyYWxsZWwgd2l0aCBvdXIgZmFrZS4g
KQo+PiA+PiDCoMKgIMKgICovCj4+ID4+IMKgwqAgwqBpZiAoYWN0aW9uLT5mbGFncyAmIElSUUZf
U0hBUkVEKSB7Cj4+ID4+IMKgwqAgwqDCoMKgwqAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwo+PiA+
PiDCoMKgIMKgwqDCoMKgIGFjdGlvbi0+aGFuZGxlcihpcnEsIGRldl9pZCk7Cj4+ID4+IMKgwqAg
wqDCoMKgwqAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwo+PiA+PiDCoMKgIMKgfQo+PiA+PiAj
ZW5kaWYKPj4gPj4gCj4+ID4KPj4gPiBBaCB5ZXMsIGFmdGVyIGVuYWJsaW5nIENPTkZJR19ERUJV
R19TSElSUSBJIGNvdWxkIHJlcHJvZHVjZSB0aGUgaXNzdWUuCj4+IAo+PiBTbyBob3cgdG8gZml4
IHRoaXMgcmVncmVzc2lvbj8gKElmIHRoZXJlJ3MgYWxyZWFkeSBhIGZpeCBJIG1pZ2h0IGhhdmUK
Pj4gbWlzc2VkIGl0IGFzIEkgY2FtZSBiYWNrIG9ubHkgdG9kYXkpCj4+IAo+Cj4gQ29waWVkIHlv
dSBvbiB0aGUgZml4IHBhdGNoLiBQbGVhc2UgdGVzdCBhbmQgbGV0IHVzIGtub3chCgpUaGFua3Ms
IHRlc3RpbmcgaXQgcmlnaHQgbm93LiBXaWxsIGxldCB5b3Uga25vdyB0aGUgcmVzdWx0IGFzIGEg
cmVwbHkgdG8KdGhlIHBhdGNoLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5v
cmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRo
MTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
