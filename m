Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A06C7EE22
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt5ZEkX4go7eNBHyfH1q9X7YIqAAfeIHzKk1VxJ6kDs=; b=EmdihLazTYPCw9
	EkmIgXwyMNP/U5kibLrqks0T0YQYI8UAFd0epJrwTxXFS7InwvOUJUnvbApWDB0r+rKmEkhxQbdLF
	B3Nhiujd9vpVETvDE+hc2Al+CLWwx4gC6JuzE2UEK0f6iDHeun4w3zAhBG3Env12jaHFRWu9jDSxr
	tBUVyfQFYcFtoZ/n2AvZ/ee4N4kbedr2yuY5JFKzmijwLdF+zub0/sOP7ikTkUoJsCv12g58zDMjH
	jcgghyRbVhjxhKcfV3lvLD30BK6Mnq3fEs9v6lUP+jhP72898u23d37scdq0vZjks6Lig47KsaBoC
	qaZeWHwJ1oyozktUHmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhwC-0061Zh-1R;
	Wed, 10 May 2023 11:24:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhw8-0061XK-2q
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 11:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=w9MxrihC9RXYLubXGMYNsnytf0IQ9XTjJYddmYpxYys=;
	t=1683717886; x=1684927486; b=fZrzY2ewPKYZfet0OorvScGgCFPdoZutXYuoW39cOKmXGYY
	NuM7wpgYAlP5ygp3TG242uyfI/uq/i6J+4xs5QssMy1qtT4iEzrIZqIAfzThe/JxzhRoD8STgLhJz
	iXhknsuVXp9wZjHOoqHssnpd9q7SKU1D1WMOnQ+hFqo+/LghiYyNPWdG4Qx8SfmOcUjH++xLgOc/3
	JO8sJc/t5SzXsRhJA44xmOYa02efvTs4SoElHxIglY4WP/5g44j7G439uxSet44IUV1jXeRJ2Eu2z
	NfreSBYzV2e2GMhk0gvRv74RYfi8EIShi4vUw4cnr3xekE4p+ZzPYu++EYBn44pA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pwhw1-005N3F-0N;
	Wed, 10 May 2023 13:24:41 +0200
Message-ID: <0e7023062f44d0ea68625c27cb13731d17857311.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Wed, 10 May 2023 13:24:40 +0200
In-Reply-To: <5e3ec5f8-1462-5de6-2b5a-4cf62f23deb7@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <5e3ec5f8-1462-5de6-2b5a-4cf62f23deb7@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_042449_397436_3959D764 
X-CRM114-Status: GOOD (  17.98  )
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

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDE5OjA2ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA0
LzExLzIwMjMgMzozOCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyMy0w
NC0wNCBhdCAxMToyOCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+IE1heSBJIGFsc28gYWRk
IGEgZmllbGQgc3VjaCBhcyAidTE2IGFjdGl2ZV9saW5rc19jb3VudCIgaW4gc3RydWN0Cj4gPiA+
IHdpcGh5X2lmdHlwZV9leHRfY2FwYWIsCj4gPiA+IGFuZCBhZGQgbG9naWMgaW4gZnVuY3Rpb24g
aWVlZTgwMjExX3NldF92aWZfbGlua3NfYml0bWFwcygpIGZvciBzdGF0aW9uCj4gPiA+IGxpa2Ug
dGhpcyA/Ogo+ID4gPiBpZiAoYWN0aXZlX2xpbmtzX2NvdW50ICYmIGh3ZWlnaHQxNihsaW5rcykg
PD0gYWN0aXZlX2xpbmtzX2NvdW50KQo+ID4gPiAgIMKgwqDCoCB0aGVuIHNkYXRhLT52aWYuYWN0
aXZlX2xpbmtzID0gbGlua3M7Cj4gPiA+IAo+ID4gQWxzbyBoZXJlLCBub3Qgc3VyZSBpdCBtYWtl
cyBzZW5zZSBpbiBjZmc4MDIxMSBsZXZlbD8KPiA+IAo+ID4gVGhvdWdoIEknbSBub3Qgc3VyZSB3
aGF0IHRoZSBpZGVhIGhlcmUgaXMgYXQgYWxsIC0geW91IGNhbiByZWZ1c2UgdG8KPiA+IGxpbmsg
c3dpdGNoIGV0Yywgd2hhdCB3b3VsZCB5b3UgdXNlIHRoaXMgZm9yPwo+ID4gCj4gPiBUaGVuIGFn
YWluLCB3ZSBoYXZlbid0IHJlYWxseSBkZXNpZ25lZCBvdXQgYWxsIHRoZSBsaW5rIHNlbGVjdGlv
biBzdHVmZiwKPiA+IGRvIHdlIHdhbnQgd3BhX3MgdG8gZG8gaXQsIGRyaXZlciB0byBkbyBpdCwg
ZXRjLj8gSGVuY2UgZGVidWdmcy4gU28KPiA+IGRlcGVuZGluZyBvbiB3aGF0IGVuZCB1cCBkb2lu
ZyB0aGVyZSwgd2Ugd2lsbCBvYnZpb3VzbHkgbmVlZCB0bwo+ID4gYWR2ZXJ0aXNlIHNvbWUgbGV2
ZWwgb2YgbGluay1jb25jdXJyZW5jeSB0byB1c2Vyc3BhY2UuCj4gCj4gU28gd2lsbCB5b3UgcGxh
biB0byBkbyBzb21ldGhpbmcgdG8gbGV0IHdwYV9zL3VzZXJzcGFjZSBhcHAgCj4gYWN0aXZlL2Rl
YWN0aXZlIGxpbmtzPwo+IAo+IE9yIHlvdSBhbHJlYWR5IGhhdmUgaW1wbGVtZW50ZWQgdGhhdD8K
PiAKCk5vIHBsYW5zIHJpZ2h0IG5vdywgYW5kIGhvbmVzdGx5IG5vdCBzdXJlIHdoYXQgdGhlIHJp
Z2h0IHRoaW5nIGV2ZW4gaXMuCgpqb2hhbm5lcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
