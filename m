Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBB8C433FE
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ax/03qd+lEaZTvOrTiJ0MIekbeZZU8y+/XZd41XRw8=; b=rdtexfxmuKkds/
	sb0GG6qNh4Svh+TZ/FD4U6nMn6yqVPHQDpp0TTyBl6lzONbVmxmUXtT6Af4yCtwCPTmA1ufI9JaWT
	58NVh6xc+2x5QjZnnFros/0qWHhhxpeXgOhStcvRX0PRpzO4WQAWTxbmrIGPOBBehi3qBsr/enDJk
	Dfp0lrM2E5kpfe0Xe3+r59U7CljcSPhIXCzmvEBcJ66pVWL1935DIJWFPolQAlHwIgKD0FJW77bA9
	idimugIQEzpL6n2v/+k431Xa3pZxrgTIaknZ5hAAeSbUhYZi80j1wwpyCiYK1MvOauJFoCEEkfpWb
	sXiV3gkfwGDeUWk6Oj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKrd-008bU8-LG; Mon, 17 Oct 2022 07:48:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKrb-008bSg-9c
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 07:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9a7NNq4YADpNDCpXpx4tyUPrdXcESkXViOGoN7CNADI=;
	t=1665992919; x=1667202519; b=dnkICzxEszVyj+Gg4tUF0mU4VWItvTH7fHDgOojBJl3NsKO
	uarbo/kBdm3cTaTcH8ryhFhxOezqrPvPQmTFX2Glal8vFzrcWbAjZ+O8irsvEeibkO3X72lBk2NdU
	7GQG1rSx9gi4PNQT3yhg7yzqWauxRYQyi8nNr3Za58E4KAH6y6ejS0N8huXanp4ESDxTOE7Z7vCOO
	5/h8hDZvE67p5Fz06uyl6eAKm1MycbaGL7wJebcbKdxIZKmThML8vrWbSDxIxe4RD1+FViMZDGumX
	FSwRF61ug157gU0YDE5ibBI4M1xwiDtpQo1YPSo+tJg8yuVWLC5QQFSH9fykCW0Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okKrS-009BM9-0J;
	Mon, 17 Oct 2022 09:48:34 +0200
Message-ID: <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Mon, 17 Oct 2022 09:48:33 +0200
In-Reply-To: <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
	 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_004843_347987_64C49D4A 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

SGksCgo+ID4gQ3VycmVudGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25z
cyBvZiBzdHJ1Y3QKPiA+IGllZWU4MDIxMV9saW5rX3N0YSBpcyBzdGlsbCB2YWx1ZSAwIGluIGll
ZWU4MDIxMV9zZXRfYXNzb2NpYXRlZCgpLAo+ID4gYmVjYXVlIHRoZXkgYXJlIG5vdCBwYXNzIGlu
dG8gaWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkgaW4KPiA+IG1hYzgwMjExIGV4Y2VwdCB0aGUg
ZGVmbGluayB3aGljaCBtZWFucyB0aGUgcHJpbWFyeSBsaW5rIGluCj4gPiByYXRlX2NvbnRyb2xf
cmF0ZV9pbml0KCkuIFRoaXMgbGVhZCBkcml2ZXIgZ2V0IG5zcyA9IDAgZm9yCj4gPiBvdGhlciBs
aW5rcy4gV2lsbCB5b3UgZml4IGl0IG9yIGlzIGl0IGRlc2lnbiBieSBkZWZhdWx0Pwo+ID4gCj4g
PiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQgcnhfbnNzIHZhbHVlIHdoaWNoIGlzIG5vdCAw
IGJ5IGJlbG93IGNhbGwgCj4gPiBzdGFjay4KPiA+IGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCkK
PiA+IMKgwqDCoCAtPnJhdGVfY29udHJvbF9yYXRlX2luaXQoc3RhKTsKPiA+IMKgwqAgwqDCoMKg
wqAgLT5pZWVlODAyMTFfc3RhX3NldF9yeF9uc3MoJnN0YS0+ZGVmbGluayk7CgpSaWdodCwgbm9u
ZSBvZiB0aGUgcmF0ZSBzY2FsaW5nIHJlbGF0ZWQgc3R1ZmYgd2FzIHVwZGF0ZWQgeWV0LgoKV2Fu
dCB0byB3b3JrIG9uIGl0PyA6KQoKam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0
aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTFrCg==
