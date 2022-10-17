Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB5BC4332F
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5KbxCc/MQ2+r00lOloLgRLHA8ppzPYtgy8wqEtgfBE=; b=KAk23gFVr/TAEd
	0UZlOGRV2YF0gPfoDWChwsnV1PCDizWE1bMaERPV6OzrgdQfDtt+roHtV/B0ji0nQQijYB+5an8q9
	9+BsX6N19spuIhYQbk9GpQx7WBhB9tlHhGdrFpijg+qo0hKGA6GhupTj24zJQPuwMCok7jtzLSxTY
	B9QVgHZwQOQtfdIap4tjztg/eBhj3QUI9sCR7M0eEGkLfit4cjpfndRMmxAf55VDx4/LWj+7gjOfQ
	brqs2EDd+mE/u09Mie7LZiV5dGZ+HmL7oi6CcxbaDyCNQ4LjJKntArUY3rfjH0DQsUp4ae/p4AKxj
	pzwNjiLEt4bJXV8xiZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKsX-008c5F-9h; Mon, 17 Oct 2022 07:49:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKsU-008c4X-KL
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 07:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=m0E61T8C49akwBDi+VEffYu3F6Yg+wN2JpVKxh4v6WU=;
	t=1665992978; x=1667202578; b=HOL1lKqoJAUpKIN6XjniM8iGUBoQWLCNVqcZVerEtpxxS++
	lF+KWlmJHHH2IAWR4WepW0CveJOtG2cmOgZTAb+vtCpGNK6+EX4KKxflOONAOTyL5Wu2tHyuflM3h
	cxeiA9TUPmtrIrJKK9gV2TRGIgru8XhK+ugs87Kgmj0KvYbAJtHsdVgdW0tjyl+VIrhHC3mkO254O
	hiWtQmME+YCOY23O3Yu6aPJCOcTclzeYlEz4cuPYcIAPpoSka/2jLzRARpLoSsBvUQ6/fPc7bOX1Z
	7GRn/Dvl0ffI2yOhx14WMEfjdjmceR36gUzw6g85vADMoVMRJXpCzlmGx7Kp4YVg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okKsP-009BNs-1y;
	Mon, 17 Oct 2022 09:49:33 +0200
Message-ID: <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Mon, 17 Oct 2022 09:49:32 +0200
In-Reply-To: <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
	 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
	 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_004938_684086_732D37AE 
X-CRM114-Status: GOOD (  12.46  )
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

T24gTW9uLCAyMDIyLTEwLTE3IGF0IDA5OjQ4ICswMjAwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+
IEhpLAo+IAo+ID4gPiBDdXJyZW50bHkgZm9yIE1MTyB0ZXN0LCB0aGUgb3RoZXJzIGxpbmtzJ3Mg
cnhfbnNzIG9mIHN0cnVjdAo+ID4gPiBpZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUg
MCBpbiBpZWVlODAyMTFfc2V0X2Fzc29jaWF0ZWQoKSwKPiA+ID4gYmVjYXVlIHRoZXkgYXJlIG5v
dCBwYXNzIGludG8gaWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkgaW4KPiA+ID4gbWFjODAyMTEg
ZXhjZXB0IHRoZSBkZWZsaW5rIHdoaWNoIG1lYW5zIHRoZSBwcmltYXJ5IGxpbmsgaW4KPiA+ID4g
cmF0ZV9jb250cm9sX3JhdGVfaW5pdCgpLiBUaGlzIGxlYWQgZHJpdmVyIGdldCBuc3MgPSAwIGZv
cgo+ID4gPiBvdGhlciBsaW5rcy4gV2lsbCB5b3UgZml4IGl0IG9yIGlzIGl0IGRlc2lnbiBieSBk
ZWZhdWx0Pwo+ID4gPiAKPiA+ID4gT25seSBwcmltYXJ5IGxpbmsgaGFzIHZhbGlkIHJ4X25zcyB2
YWx1ZSB3aGljaCBpcyBub3QgMCBieSBiZWxvdyBjYWxsIAo+ID4gPiBzdGFjay4KPiA+ID4gaWVl
ZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKQo+ID4gPiDCoMKgwqAgLT5yYXRlX2NvbnRyb2xfcmF0ZV9p
bml0KHN0YSk7Cj4gPiA+IMKgwqAgwqDCoMKgwqAgLT5pZWVlODAyMTFfc3RhX3NldF9yeF9uc3Mo
JnN0YS0+ZGVmbGluayk7Cj4gCj4gUmlnaHQsIG5vbmUgb2YgdGhlIHJhdGUgc2NhbGluZyByZWxh
dGVkIHN0dWZmIHdhcyB1cGRhdGVkIHlldC4KPiAKClRob3VnaCBmb3IgdGhpcyBjYXNlIG1heWJl
IHdlIGNhbiBqdXN0IG1vdmUgaWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkKdG8gc29tZSBiZXR0
ZXIgcGxhY2Ugb3V0c2lkZSBvZiByYXRlX2NvbnRyb2xfcmF0ZV9pbml0KCkgYW5kIGhhdmUgaXQK
ZG9uZSB3aXRoIHRoZSByaWdodCBsaW5rLCBhbmQgYWxzbyBvbiBjaGFuZ2VzPwoKam9oYW5uZXMK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
