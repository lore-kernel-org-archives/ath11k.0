Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7FC43219
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2r54vJs+trP5j2Oqsx2OdoPHyu0ICI9UCdwD5uQlSE=; b=QN+xyJPPX2dpmI
	0A+03xthmTYldW5KRYtJ6LmcFjGwUiJc4L5LBazePyDUoArSSxxfBobmW+8q3V3f7bp2Ox/Yll5CP
	TCzAAFs9Cd8F24/bRI/Kn5DnrIkLPQU8EC33FZT7PAu1kxB4wK7nPUYyvc+473GlyTbtFs1XAKAwa
	MyqQNGT3zPSor4a+IkV81ellIQH+UlnBAXETdBaJNPEeY1e35xcqPWbt5UlNT4X1kaCnGl33FMbTH
	FJxbuNzJUvxS/IolPPgXayrNnfngK63xe2Pom3ChaDKlUlycKIcdqnBFXJbreM8usWMs/Tdt7E/2w
	QDmHXY9NtzMXdzqjEZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL5I-008q8Q-Up; Mon, 17 Oct 2022 08:02:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL5G-008q4c-Pt
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 08:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4/93+lNqyYfJFAeyAUGmmcGLmRKHmLzUqwLyD1FbYAA=;
	t=1665993770; x=1667203370; b=TzS12G3Ru3mq0dLAX5bejLI3/u2VxQGRzjioZKm1vdeX/w3
	EFRoHyMsNfAunlE4l3LKz/i7q0xIEAi0wWMVzgzaSKR7D3KAl9L11DeG5UBDB0YwKSoTlgG084/so
	oON2Q4UQfLVdnfTCveP6kWGSR7G2w0KOkeVL/aPWpj8SoqVYfIKSAwSVqarb7iI682DHubPQI9ttr
	WJzFu4dxDXwDIJU4RmAEaPj8LAJaAp29iI3b6VToLfZXDpQThAxMex+QSuV/ovWiJkG3rU4SqewOm
	Lu3v4/rGyfLwRWSX06Rt+YGbRj8cdPD4i/FxLVQ4vGJOtOz+DQl8tVJMjMqOIg8Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okL5C-009BmL-09;
	Mon, 17 Oct 2022 10:02:46 +0200
Message-ID: <ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net>
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Mon, 17 Oct 2022 10:02:45 +0200
In-Reply-To: <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
	 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
	 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
	 <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
	 <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_010250_859209_1D10DDE8 
X-CRM114-Status: GOOD (  18.42  )
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

T24gTW9uLCAyMDIyLTEwLTE3IGF0IDE2OjAwICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiAx
MC8xNy8yMDIyIDM6NDkgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiBPbiBNb24sIDIwMjIt
MTAtMTcgYXQgMDk6NDggKzAyMDAsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiA+IEhpLAo+ID4g
PiAKPiA+ID4gPiA+IEN1cnJlbnRseSBmb3IgTUxPIHRlc3QsIHRoZSBvdGhlcnMgbGlua3MncyBy
eF9uc3Mgb2Ygc3RydWN0Cj4gPiA+ID4gPiBpZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFs
dWUgMCBpbiBpZWVlODAyMTFfc2V0X2Fzc29jaWF0ZWQoKSwKPiA+ID4gPiA+IGJlY2F1ZSB0aGV5
IGFyZSBub3QgcGFzcyBpbnRvIGllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygpIGluCj4gPiA+ID4g
PiBtYWM4MDIxMSBleGNlcHQgdGhlIGRlZmxpbmsgd2hpY2ggbWVhbnMgdGhlIHByaW1hcnkgbGlu
ayBpbgo+ID4gPiA+ID4gcmF0ZV9jb250cm9sX3JhdGVfaW5pdCgpLiBUaGlzIGxlYWQgZHJpdmVy
IGdldCBuc3MgPSAwIGZvcgo+ID4gPiA+ID4gb3RoZXIgbGlua3MuIFdpbGwgeW91IGZpeCBpdCBv
ciBpcyBpdCBkZXNpZ24gYnkgZGVmYXVsdD8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gT25seSBwcmlt
YXJ5IGxpbmsgaGFzIHZhbGlkIHJ4X25zcyB2YWx1ZSB3aGljaCBpcyBub3QgMCBieSBiZWxvdyBj
YWxsCj4gPiA+ID4gPiBzdGFjay4KPiA+ID4gPiA+IGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCkK
PiA+ID4gPiA+ICDCoMKgwqAgLT5yYXRlX2NvbnRyb2xfcmF0ZV9pbml0KHN0YSk7Cj4gPiA+ID4g
PiAgwqDCoCDCoMKgwqDCoCAtPmllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygmc3RhLT5kZWZsaW5r
KTsKPiA+ID4gUmlnaHQsIG5vbmUgb2YgdGhlIHJhdGUgc2NhbGluZyByZWxhdGVkIHN0dWZmIHdh
cyB1cGRhdGVkIHlldC4KPiA+ID4gCj4gPiBUaG91Z2ggZm9yIHRoaXMgY2FzZSBtYXliZSB3ZSBj
YW4ganVzdCBtb3ZlIGllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygpCj4gPiB0byBzb21lIGJldHRl
ciBwbGFjZSBvdXRzaWRlIG9mIHJhdGVfY29udHJvbF9yYXRlX2luaXQoKSBhbmQgaGF2ZSBpdAo+
ID4gZG9uZSB3aXRoIHRoZSByaWdodCBsaW5rLCBhbmQgYWxzbyBvbiBjaGFuZ2VzPwo+ID4gCj4g
PiBqb2hhbm5lcwo+IAo+IEkgZGlkIGJlbG93IGNoYW5nZSBpbiBteSBpbnRlcm5hbCB0ZXN0LCBh
bmQgbm90IGZvdW5kIHRoZSBOU1M9MCBpc3N1ZSAKPiBhZ2FpbiBmb3IgMiBsaW5rIE1MTy4KPiAK
PiB3aWZpOiBtYWM4MDIxMTogdXBkYXRlIGFsbCBsaW5rcyByeCBuc3MgYnkgaWVlZTgwMjExX3N0
YV9zZXRfcnhfbnNzKCkgaW4gCj4gaWVlZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKQo+IAoKSSBndWVz
cyB2YWxpZCBsaW5rcyB3YXNuJ3Qgc2V0IGF0IHRoYXQgcG9pbnQgeWV0PwoKQW55d2F5IHNob3Vs
ZCBhbHNvIG1vdmUgb3V0IG9mIHJhdGVfY29udHJvbF9yYXRlX2luaXQoKSBhbmQgcHJvYmFibHkK
aW50byBzb21ldGhpbmcgbGlrZSBpZWVlODAyMTFfYXNzb2NfY29uZmlnX2xpbmsoKT8gVGhhdCBh
bHJlYWR5IGRvZXMKc29tZSByeF9uc3MgY2FsY3VsYXRpb25zIHdoaWNoIGlzIHByb2JhYmx5IG5v
dCBncmVhdCAuLi4KCmpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
