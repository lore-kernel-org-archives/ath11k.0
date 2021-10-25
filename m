Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0AFC433F5
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 19:59:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A9B60C4A
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 19:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06A9B60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptjYn9cgnbNwk/U2CoAdEdLfQJQaAQSiuIDf4qM/QR0=; b=HAmnziU5mV6z0W
	ZBJzfYMtu98qZsbTQGtgBzvB1tuYauqvdA/q4PGhlHJpC54wDq/g7oXjk0h5QLqY1o1mYndtOQPfM
	RL1sOSWUIJysEV7Ks4AAdfTGHU5q43iMV+7EjSWtGJEQUW6i5NNGSrdE8m9DZpDeNGvmgK1DeCBUY
	ECVxCuQmzVT/5Bvy2R0rrj5uKKeu6zNy0ghwNp3bwBIXvhr22KlQ2jOdKB7ZaVkkXWnHm0uN8IWTM
	YuL8S/mk8eiiizvdni9F9uTkbrL46EloLOihO00JmsDR/FWMxP0POrb4DhhmdmKJJk1Cs4LN0O+R8
	CfxWa3kVoZcRtwI2/LBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf68C-00HXU2-Mg; Mon, 25 Oct 2021 19:59:40 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf689-00HXRe-DZ
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 19:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=1F87+sikkubQJPygLdQF6HOpYZ2B2TtzpImTpNaIQ6Q=; 
 t=1635191971; x=1636401571; b=fxnw5erjIM6pJm1D4XOPYU6ePgfkqz5Is/ji8sRXHbFUw5d
 c+Rl10GzodNHpJufJ2RoF+XG5UjRac4t3VwqI1wPvPlcT/kt5Hw2cPhX5OuktQg+MVZlWmhKk69kY
 puXsQRgQceNSs3A62p77LHZRIHD2ogQWeZ3TPAPEnIwLL9dB82Dtc2euX3W+WGkN1+yGCKAL97esf
 iYVKw0R1fraouof2QGG1T1yNgPvQOHjnDQjkl4COmRGCK18ojgkZzEgKCehnGbsfmh6op0MoXDkWB
 shJgw6GwJy63qShVpSOfPrxF9tjAXo/5SeseiOOLJt3DwXpmYDhznI6Z1taMXpFg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mf681-006qIl-Ak; Mon, 25 Oct 2021 21:59:29 +0200
Message-ID: <9de7dbefe3cf0682fd28e5f4c42324e6a58ce508.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/3] nl80211: Extended ROC support for 40-80 MHz
 bandwidth
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <ppranees@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sathishkumar Muruganandam
 <murugana@codeaurora.org>
Date: Mon, 25 Oct 2021 21:59:28 +0200
In-Reply-To: <1634906227-22028-2-git-send-email-ppranees@codeaurora.org>
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-2-git-send-email-ppranees@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125937_561778_9194A0AC 
X-CRM114-Status: GOOD (  20.62  )
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

T24gRnJpLCAyMDIxLTEwLTIyIGF0IDE4OjA3ICswNTMwLCBQIFByYW5lZXNoIHdyb3RlOgo+IAo+
IC0tLSBhL2luY2x1ZGUvbmV0L2NmZzgwMjExLmgKPiArKysgYi9pbmNsdWRlL25ldC9jZmc4MDIx
MS5oCj4gQEAgLTQxODEsNyArNDE4MSw3IEBAIHN0cnVjdCBjZmc4MDIxMV9vcHMgewo+IMKgCj4g
Cj4gCj4gCj4gwqAJaW50CSgqcmVtYWluX29uX2NoYW5uZWwpKHN0cnVjdCB3aXBoeSAqd2lwaHks
Cj4gwqAJCQkJICAgICBzdHJ1Y3Qgd2lyZWxlc3NfZGV2ICp3ZGV2LAo+IC0JCQkJICAgICBzdHJ1
Y3QgaWVlZTgwMjExX2NoYW5uZWwgKmNoYW4sCj4gKwkJCQkgICAgIHN0cnVjdCBjZmc4MDIxMV9j
aGFuX2RlZiAqY2hhbmRlZiwKPiDCoAkJCQkgICAgIHVuc2lnbmVkIGludCBkdXJhdGlvbiwKPiDC
oAkJCQkgICAgIHU2NCAqY29va2llKTsKCkkgZmluZCBpdCdzIG9kZCB5b3UgdXBkYXRlIHRoaXMs
IGJ1dAo+IAo+IMKgCWlmICghcm9jLT5tZ210X3R4X2Nvb2tpZSkKPiDCoAkJY2ZnODAyMTFfcmVt
YWluX29uX2NoYW5uZWxfZXhwaXJlZCgmcm9jLT5zZGF0YS0+d2RldiwKPiAtCQkJCQkJICAgcm9j
LT5jb29raWUsIHJvYy0+Y2hhbiwKPiArCQkJCQkJICAgcm9jLT5jb29raWUsCj4gKwkJCQkJCSAg
IHJvYy0+Y2hhbmRlZi5jaGFuLAo+IMKgCQkJCQkJICAgR0ZQX0tFUk5FTCk7Cgpub3QgdGhlIHJl
cG9ydGluZyBBUEk/IFdvdWxkIHNlZW0gYmV0dGVyIHRvIHBhc3MgYmFjayB0aGUgd2hvbGUgdGhp
bmc/Cgo+IEBAIC0yMTEsNiArMjEyLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaWVlZTgwMjEx
X2VuZF9maW5pc2hlZF9yb2NzKHN0cnVjdCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsLAo+IMKgCQkg
KiBST0Mgc2Vzc2lvbiBiZWZvcmUgdGhlIGFjdHVhbCByZXF1ZXN0ZWQgdGltZS4gSW4gc3VjaCBh
IGNhc2UKPiDCoAkJICogZW5kIHRoZSBST0Mgc2Vzc2lvbiAoZGlzcmVnYXJkaW5nIHRoZSByZW1h
aW5pbmcgdGltZSkuCj4gwqAJCSAqLwo+ICsKPiDCoAkJaWYgKHJvYy0+YWJvcnQgfHwgcm9jLT5o
d19iZWd1biB8fCByZW1haW5pbmcgPD0gMCkKPiDCoAkJCWllZWU4MDIxMV9yb2Nfbm90aWZ5X2Rl
c3Ryb3kocm9jKTsKCgpzcHVyaW91cyBjaGFuZ2U/Cgo+IEBAIC0zMTEsNyArMzE2LDcgQEAgc3Rh
dGljIHZvaWQgX2llZWU4MDIxMV9zdGFydF9uZXh0X3JvYyhzdHJ1Y3QgaWVlZTgwMjExX2xvY2Fs
ICpsb2NhbCkKPiDCoAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcCwgJmxvY2FsLT5yb2NfbGlzdCwg
bGlzdCkgewo+IMKgCQlpZiAodG1wID09IHJvYykKPiDCoAkJCWNvbnRpbnVlOwo+IC0JCWlmICh0
bXAtPnNkYXRhICE9IHJvYy0+c2RhdGEgfHwgdG1wLT5jaGFuICE9IHJvYy0+Y2hhbikKPiArCQlp
ZiAodG1wLT5zZGF0YSAhPSByb2MtPnNkYXRhIHx8IHRtcC0+Y2hhbmRlZi5jaGFuICE9IHJvYy0+
Y2hhbmRlZi5jaGFuKQo+IMKgCQkJYnJlYWs7CgpUaGlzIHJlYWxseSBkb2Vzbid0IHdvcmsgLSB5
b3UgbmVlZCB0byBhY3R1YWxseSBjb21wYXJlIHRoZSBjaGFuZGVmcyBmb3IKYmVpbmcgaWRlbnRp
Y2FsIG9yIGF0IGxlYXN0IGNvbXBhdGlibGUgd2hlbiBtZXJnaW5nIGV0Yy4gaGFwcGVucyBoZXJl
LgoKQXQgbGVhc3QgaWYgd2Ugd2FudCBtYWM4MDIxMSB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZSAo
bW9yZSBvbiB0aGF0CmxhdGVyKQoKPiBAQCAtMzMxLDcgKzMzNyw3IEBAIHN0YXRpYyB2b2lkIF9p
ZWVlODAyMTFfc3RhcnRfbmV4dF9yb2Moc3RydWN0IGllZWU4MDIxMV9sb2NhbCAqbG9jYWwpCj4g
wqAJCQkgKi8KPiDCoAkJCWxpc3RfZm9yX2VhY2hfZW50cnkodG1wLCAmbG9jYWwtPnJvY19saXN0
LCBsaXN0KSB7Cj4gwqAJCQkJaWYgKHRtcC0+c2RhdGEgIT0gcm9jLT5zZGF0YSB8fAo+IC0JCQkJ
ICAgIHRtcC0+Y2hhbiAhPSByb2MtPmNoYW4pCj4gKwkJCQkgICAgdG1wLT5jaGFuZGVmLmNoYW4g
IT0gcm9jLT5jaGFuZGVmLmNoYW4pCj4gwqAJCQkJCWJyZWFrOwoKbGlrZXdpc2UKCj4gKwlyb2Mt
PmNoYW5kZWYuY2hhbiA9IGNoYW5kZWYtPmNoYW47Cj4gKwlyb2MtPmNoYW5kZWYud2lkdGggPSBj
aGFuZGVmLT53aWR0aDsKPiArCXJvYy0+Y2hhbmRlZi5jZW50ZXJfZnJlcTEgPSBjaGFuZGVmLT5j
ZW50ZXJfZnJlcTE7Cj4gKwlyb2MtPmNoYW5kZWYuY2VudGVyX2ZyZXEyID0gY2hhbmRlZi0+Y2Vu
dGVyX2ZyZXEyOwoKVGhhdCBwcm9iYWJseSBzaG91bGQgdXNlIGEgc3RydWN0IGFzc2lnbm1lbnQg
LSB0aGVyZSBhcmUgc29tZSBtb3JlCnN0cnVjdCBtZW1iZXJzIHlvdSdyZSBub3cgbm90IHNldHRp
bmcuCj4gCj4gwqAJbXV0ZXhfbG9jaygmbG9jYWwtPm10eCk7Cj4gLQlyZXQgPSBpZWVlODAyMTFf
c3RhcnRfcm9jX3dvcmsobG9jYWwsIHNkYXRhLCBjaGFuLAo+IC0JCQkJICAgICAgIGR1cmF0aW9u
LCBjb29raWUsIE5VTEwsCj4gLQkJCQkgICAgICAgSUVFRTgwMjExX1JPQ19UWVBFX05PUk1BTCk7
Cj4gKwlpZiAoY2hhbmRlZikgewo+ICsJCXJldCA9IGllZWU4MDIxMV9zdGFydF9yb2Nfd29yayhs
b2NhbCwgc2RhdGEsIGNoYW5kZWYsCj4gKwkJCQkJICAgICAgIGR1cmF0aW9uLCBjb29raWUsIE5V
TEwsCj4gKwkJCQkJICAgICAgIElFRUU4MDIxMV9ST0NfVFlQRV9OT1JNQUwpOwo+ICsJfQoKTm8g
bmVlZCBmb3IgYnJhY2VzLCBidXQgaG93IHdvdWxkIHRoYXQgYWN0dWFsbHkgYmUgTlVMTD8hCj4g
Cj4gKwljaGFuZGVmLmNoYW4gPSBwYXJhbXMtPmNoYW47CgpVaCwgd2VsbCwgdGhlIG90aGVyIGZp
ZWxkcyBvZiBhIHN0YWNrIHN0cnVjdCByZWFsbHkgd2FudCB0byBiZQppbml0aWFsaXplZCB0b28g
OikKCgo+IEBAIC0xMjQ0LDggKzEyNDQsOSBAQCBUUkFDRV9FVkVOVChkcnZfcmVtYWluX29uX2No
YW5uZWwsCj4gwqAJVFBfZmFzdF9hc3NpZ24oCj4gwqAJCUxPQ0FMX0FTU0lHTjsKPiDCoAkJVklG
X0FTU0lHTjsKPiAtCQlfX2VudHJ5LT5jZW50ZXJfZnJlcSA9IGNoYW4tPmNlbnRlcl9mcmVxOwo+
IC0JCV9fZW50cnktPmZyZXFfb2Zmc2V0ID0gY2hhbi0+ZnJlcV9vZmZzZXQ7Cj4gKwkJQ0hBTkRF
Rl9BU1NJR04oY2hhbmRlZik7Cj4gKwkJX19lbnRyeS0+Y2VudGVyX2ZyZXEgPSBjaGFuZGVmLT5j
aGFuLT5jZW50ZXJfZnJlcTsKPiArCQlfX2VudHJ5LT5mcmVxX29mZnNldCA9IGNoYW5kZWYtPmNo
YW4tPmZyZXFfb2Zmc2V0OwoKV2h5IHdvdWxkIHdlIG5lZWQgY2VudGVyX2ZyZXEvZnJlcV9vZmZz
ZXQgaWYgd2UgaGF2ZSBhIHdob2xlIGNoYW5kZWY/CgpXZSdyZSBub3QgdXN1YWxseSB0YWtpbmcg
bXVjaCBjYXJlIHdpdGggY29tcGF0aWJpbGl0eSBoZXJlIHdpdGggdHJhY2luZy4KCj4gLS0tIGEv
bmV0L3dpcmVsZXNzL25sODAyMTEuYwo+ICsrKyBiL25ldC93aXJlbGVzcy9ubDgwMjExLmMKPiBA
QCAtMTEyODIsNyArMTEyODIsNyBAQCBzdGF0aWMgaW50IG5sODAyMTFfcmVtYWluX29uX2NoYW5u
ZWwoc3RydWN0Cj4gc2tfYnVmZiAqc2tiLAo+ICAJCWdvdG8gZnJlZV9tc2c7Cj4gIAl9Cj4gIAo+
IC0JZXJyID0gcmRldl9yZW1haW5fb25fY2hhbm5lbChyZGV2LCB3ZGV2LCBjaGFuZGVmLmNoYW4s
Cj4gKwllcnIgPSByZGV2X3JlbWFpbl9vbl9jaGFubmVsKHJkZXYsIHdkZXYsICZjaGFuZGVmLAo+
ICAJCQkJICAgICBkdXJhdGlvbiwgJmNvb2tpZSk7Cj4gIAo+ICAJaWYgKGVycikKPiAKClJlYWxs
eSB0aG91Z2gsIHRoZSBiaWdnZXN0IGlzc3VlIEkgc2VlIHdpdGggdGhpcyB0aGF0IHlvdSBhZGRl
ZCBubwpmZWF0dXJlIGFkdmVydGlzZW1lbnQsIG5vIGNoZWNrcyBmb3IgdGhlIGNoYW5uZWwgZXZl
biBiZWluZyB2YWxpZCwKbm90aGluZz8KClNlZW1zIGxpa2Ugd2Ugc2hvdWxkIGhhdmUgc29tZSBr
aW5kIG9mIGZlYXR1cmUgY2hlY2ssIGF0IGxlYXN0IHRvIHJlamVjdAo0MC84MC8xNjAvd2hhdGV2
ZXIgYmFuZHdpZHRocyB3aXRoIGFsbCB0aGUgZXhpc3RpbmcgZHJpdmVycyB5b3Ugb25seQp1cGRh
dGVkIHRoZSBBUEkgb24sIGJ1dCBkaWRuJ3QgYWN0dWFsbHkgaW1wbGVtZW50IHRoZSBuZXcgY2hh
bmdlcz8gSS5lLgp0aGlzIHJlYWxseSBuZWVkcyB0byBiZSBvcHQtaW4gc29tZWhvdy4KCkFuZCBm
b3IgbWFjODAyMTEgd2UgbmVlZCB0byBpbXBsZW1lbnQgc29tZSBkaWZmZXJlbnQgbWVyZ2UgbG9n
aWMsIGV0Yy4sCml0IHNlZW1zLgoKam9oYW5uZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
