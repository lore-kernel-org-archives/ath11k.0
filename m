Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299DAC00144
	for <ath11k@archiver.kernel.org>; Fri, 29 Jul 2022 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfgmgGnZS5IXQv5sH+cwaJSJVuhSnb3REbQJomradLM=; b=MFLuAEqdXOx/sw
	Jsz587TVK/9WjvBv/sXhmMWfRw9wh9zrZba63na5u5kP8/ae+iQtN7lSAxlpk6Neir4FFcaJXASd9
	tvhD+FWsSsO0Wtk5uMph4Do2sVjQnbbmx+r6qIOU3nJrlFyMpIAM7OW1upi/Sf5sA8DZyEhoNMEM6
	dFdbPVaKTKIqN7PrGPZu4CS9v6tj/aHJKsrov+A1FLBKm+8iqgRcXzW+qSbGKS1fHcSJJJNJKzfsO
	oWrPSyePosyMWcwktIuPS2k2zDAW70pRxDYW7Y/7x6ESEd7N9NAS37CT3fjm3GAjwYrtVl51ZjEw0
	qBIRli2dqhxuEic+QflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHQst-005Th8-Bq; Fri, 29 Jul 2022 14:22:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHQsq-005TfA-NP
	for ath11k@lists.infradead.org; Fri, 29 Jul 2022 14:22:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 81A63B82795;
	Fri, 29 Jul 2022 14:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624B8C433C1;
	Fri, 29 Jul 2022 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659104549;
	bh=FYp7dxRuDa2TzbtLpfE1k1l6o7hR4ycZLxQgQwCsplA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gI52e6Jn7VE10U5yCiJqdCtJ8vq4VD1COs74rMHOXEDNUAB313zvt0660JPDJ89vL
	 uRPByAcorrzRsXtzw4UHnEJYFgnZ0epF0+cuXPtDnI7WiYrbh8tDpLbH5ehEusMPBg
	 eNhTd/WKCWFGW0aqvwRSSQZedj1nbkhf51FcitmIv3mV+5IihAseMfE30NzpLOZ+yz
	 Vbrkd030U5POnTAx7Z0DMhjniNQpxIMtQyv4s34uHp67VcwJhg0wPbvzzST6nu9tlq
	 e55lT7qkLZFj0rAWah49KRFUemdcWzLi8jfIAxIEaMFW92wBqgfG7GfQR8uG/sz0BC
	 dVxKcR7Sz1vGw==
Date: Fri, 29 Jul 2022 19:52:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, quic_hemantk@quicinc.com,
	loic.poulain@linaro.org, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in
 mhi_irq_handler
Message-ID: <20220729142221.GA9937@thinkpad>
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
 <20220726080636.GE5522@workstation>
 <87czdrrc95.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czdrrc95.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_072232_952995_C990109B 
X-CRM114-Status: GOOD (  18.90  )
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

T24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMDg6NTM6NThQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4gd3JpdGVzOgo+IAo+
ID4gK2F0aDExaywgS2FsbGUKPiA+Cj4gPiBPbiBGcmksIEp1bCAyMiwgMjAyMiBhdCAxMToxNzox
OEFNICswODAwLCBRaWFuZyBZdSB3cm90ZToKPiA+PiBUaGUgaXJxIGhhbmRsZXIgZm9yIGEgc2hh
cmVkIElSUSBvdWdodCB0byBiZSBwcmVwYXJlZCBmb3IgcnVubmluZwo+ID4+IGV2ZW4gbm93IGl0
J3MgYmVpbmcgZnJlZWQuIFNvIGxldCdzIGNoZWNrIHRoZSBwb2ludGVyIHVzZWQgYnkKPiA+PiBt
aGlfaXJxX2hhbmRsZXIgdG8gYXZvaWQgbnVsbCBwb2ludGVyIGFjY2VzcyBzaW5jZSBpdCBpcyBw
cm9iYWJseQo+ID4+IHJlbGVhc2VkIGJlZm9yZSBmcmVlaW5nIElSUS4KPiA+PiAKPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8cXVpY19xaWFueXVAcXVpY2luYy5jb20+Cj4gPgo+ID4gUmV2
aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+IAo+IFRo
aXMgZml4ZXMgdGhlIGNyYXNoIGFuZCBteSByZWdyZXNzaW9uIHRlc3RzIHBhc3Mgbm93LCB0aGFu
a3MuIEJ1dAo+IHBsZWFzZSBzZWUgbXkgcXVlc3Rpb24gYmVsb3cuCj4gCj4gVGVzdGVkLWJ5OiBL
YWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgo+IAoKVGhhbmtzIEthbGxlIQoKPiA+PiArCS8q
Cj4gPj4gKwkgKiBJZiBDT05GSUdfREVCVUdfU0hJUlEgaXMgc2V0LCB0aGUgSVJRIGhhbmRsZXIg
d2lsbCBnZXQgaW52b2tlZCBkdXJpbmcgX19mcmVlX2lycSgpCj4gPj4gKwkgKiBhbmQgYnkgdGhh
dCB0aW1lIG1oaV9jdHh0KCkgd291bGQndmUgZnJlZWQuIFNvIGNoZWNrIGZvciB0aGUgZXhpc3Rl
bmNlIG9mIG1oaV9jdHh0Cj4gPj4gKwkgKiBiZWZvcmUgaGFuZGxpbmcgdGhlIElSUXMuCj4gPj4g
KwkgKi8KPiA+PiArCWlmICghbWhpX2NudHJsLT5taGlfY3R4dCkgewo+ID4+ICsJCWRldl9kYmco
Jm1oaV9jbnRybC0+bWhpX2Rldi0+ZGV2LAo+ID4+ICsJCQkibWhpX2N0eHQgaGFzIGJlZW4gZnJl
ZWRcbiIpOwo+ID4+ICsJCXJldHVybiBJUlFfSEFORExFRDsKPiA+PiArCX0KPiAKPiBJIGRvbid0
IHNlZSBhbnkgcHJvdGVjdGlvbiBhY2Nlc3NpbmcgbWhpX2NudHJsLT5taGlfY3R4dCwgaXMgdGhp
cyByZWFsbHkKPiBmcmVlIG9mIHJhY2UgY29uZGl0aW9ucz8KPiAKCkFzIFFpYW5nIHNhaWQsIGl0
IGlzIHNhZmUgdG8gYWNjZXNzIG1oaV9jdHh0IGhlcmUuCgpUaGFua3MsCk1hbmkKCj4gLS0gCj4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3Qv
Cj4gCj4gaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1
bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p
4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
