Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131B7C4167B
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lxx2s8ff1ppwHNR4qHLLx5NpakxO5j6MgReyI6fFFY=; b=DhE9QWraindODK
	BgYNwQdT0ESZn5V1A2NY2IhEJGt4aYMeRnygFyi2E2J2/ROY1NYYQXSGVaGXVQpGei5edy+ZlvTJW
	jrMp7veR/uPnv5msuUIdEgMcy/BNtJTKi7i0JWhFwzP+ht5kL+PfpvtBDkWdDVp7opGZk6QLi4K2V
	NZrxRjeieUH4TLdd7mO5aDLHtgBKNaJkFn7PKp3Jwf5YuFXMh4YerVQ6wL3cgcYsUfFj/FqF4fiBN
	LJZG39F2VnDsgmI587OQ3dVAx0M8Go3WwT+VkpnMT1RXGBXwf8JhSc/BO03YInSGy01T5eLOYP+1B
	K+F+LACqWcnXehyH8Xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xij-00E7PH-2Y;
	Mon, 13 Nov 2023 14:15:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xif-00E7OR-2c
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 14:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B35ECE14E4;
	Mon, 13 Nov 2023 14:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F321EC433C8;
	Mon, 13 Nov 2023 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884906;
	bh=y1OMZ6z7efDhKj1vsokZwE/dfo0DW7No+kNt4zr/hMA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W6ijUz7t8wqqkvA4nNp8oJE1agaJUXkRQBBsP8k1HL8FXbHJAT7DbjYYosBg2Rj+r
	 wsOed5P5VP1NobrIAd32YKDp77ZwSdWv0qtg1IeBcOy6Est+KeI9qIGxoXkQd+lqSe
	 Rhhy8QboGRBOzxmeVy103L8BEVNmMkEzKw0JeB1ZYXZNrplw3b2jvv7wKlnR5ccr3d
	 l8/CK0E34OOiH57X7Wjz/q/OpLq+a3Z9TP42z27CSnHuculfzcEgTVGyXq6VjKoTVl
	 JtVRKkWMyIFmHqaOYxrGmM3Wz40d3l3vzseWNI1lou0aFZS1u93HDZV6g6ukXYOalr
	 12WXmxxiowGHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <mhi@lists.linux.dev>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
References: <20231110102202.3168243-1-kvalo@kernel.org>
	<20231110102202.3168243-5-kvalo@kernel.org>
	<f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
	<e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
	<818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
Date: Mon, 13 Nov 2023 16:15:02 +0200
In-Reply-To: <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com> (Jeffrey
	Hugo's message of "Sun, 12 Nov 2023 09:15:40 -0700")
Message-ID: <87msvhu4d5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_061519_272914_D3721FCA 
X-CRM114-Status: GOOD (  13.97  )
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

SmVmZnJleSBIdWdvIDxxdWljX2podWdvQHF1aWNpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIDExLzEx
LzIwMjMgOToyNCBQTSwgQmFvY2hlbiBRaWFuZyB3cm90ZToKPgo+PiBPbiAxMS8xMS8yMDIzIDEy
OjU0IEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4+PiBPbiAxMS8xMC8yMDIzIDM6MjEgQU0sIEth
bGxlIFZhbG8gd3JvdGU6Cj4+Pj4gRnJvbTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVp
Y2luYy5jb20+Cj4+Pj4KPj4+PiBUaGVyZSBpcyBubyBkcml2ZXIgdG8gbWF0Y2ggdGhlc2UgdHdv
IGNoYW5uZWxzLCBzbwo+Pj4+IHJlbW92ZSB0aGVtLiBUaGlzIGZpeGVzIHdhcm5pbmdzIGZyb20g
TUhJIHN1YnN5c3RlbSBkdXJpbmcgc3VzcGVuZDoKPj4+Pgo+Pj4+IG1oaSBtaGkwX0xPT1BCQUNL
OiAxOiBGYWlsZWQgdG8gcmVzZXQgY2hhbm5lbCwgc3RpbGwgcmVzZXR0aW5nCj4+Pj4gbWhpIG1o
aTBfTE9PUEJBQ0s6IDA6IEZhaWxlZCB0byByZXNldCBjaGFubmVsLCBzdGlsbCByZXNldHRpbmcK
Pj4+Cj4+PiBUaGlzIGZlZWxzIGxpa2UganVzdCBtYXNraW5nIGEgcmVhbCBpc3N1ZS4KPj4+Cj4+
PiBJZiBMT09QQkFDSyBpcyBub3QgYmVpbmcgY29uc3VtZWQsIHRoZW4gdGhlIGNoYW5uZWwgc2hv
dWxkIG5ldmVyIGdvCj4+PiBpbnRvIHRoZSBzdGFydCBzdGF0ZS7CoCBXaHkgd291bGQgd2UgYmUg
dHJ5aW5nIHRvIHRyYW5zaXRpb24gdG8gdGhlCj4+PiByZXNldCBzdGF0ZSB0aGVuPwo+Pj4KPj4+
IC1KZWZmCj4+IFRoYXQgaXMgYmVjYXVzZSwgd2l0aCBwYXRjaCAnYnVzOiBtaGk6IGhvc3Q6IGFk
ZCBuZXcgaW50ZXJmYWNlcyB0bwo+PiBoYW5kbGUgTUhJIGNoYW5uZWxzIGRpcmVjdGx5JyBpbiB0
aGlzIHBhdGNoIHNldCwgYXRoMTFrIGlzIGFibGUgdG8KPj4gY2FsbCBtaGlfdW5wcmVwYXJlX2Fs
bF9mcm9tX3RyYW5zZmVyKCksIHdoaWNoIHdpbGwgcmVzZXQgYWxsCj4+IGNoYW5uZWxzLgo+Cj4g
dGhhdCBpbXBsZW1lbnRhdGlvbiBpcyBmbGF3ZWQgaWYgaXQgaXMgY2F1c2luZyB0aGlzLiAgTG9v
a3MgbGlrZSB5b3UKPiBuZXZlciBjaGVjayB0byBzZWUgaWYgdGhlIGNoYW5uZWwgd2FzIHByZXBh
cmVkIGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IElmIHlvdSBnbyBmaXggdGhhdCwgdGhlbiBpdCBs
b29rcyBsaWtlIHRoaXMgY2hhbmdlIGlzIG5vdCBuZWVkZWQuCgpCVFcgd2hhdCBkbyB0aGVzZSBs
b29wYmFjayBjaGFubmVscyBkbz8gSSBkaWRuJ3Qgbm90aWNlIGFueSBkaWZmZXJlbmNlCmluIHRo
ZSBmdW5jdGlvbmFsaXR5IHNvIEknbSB3b25kZXJpbmcgdGhlIHJlYXNvbiBmb3IgdGhlc2UuCgot
LSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xp
c3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3Vt
ZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
