Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649EDC433FE
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 15:01:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B4660EE2
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 15:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B4660EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvTOPCIiZf3Xnm4F//bBaso8d6PqjrgqUpnyUzJIgkg=; b=znP2BoaBPZR0zO
	cUXQ73N2JGDfrfyOGymGqLoaed/82oqnfboNYwp9Q6A1sUKiKe6cfpPYqj/vvkWqhNOkfumbHQS7I
	cD8RFBQACheUuoZZTFe+DY+Qg7/1uAn9XC5zyQ6uEmyqVgm/+vNhph1mvggwDWIdyPk22EDEkuNJl
	at3mr0PeiI1212Vis/fHRq4QG4wXIDqNwtU3h/vFRCtM32DDXzZFsJTcq/z2MwcG9eCC5bC7v7qxv
	jZrsrk5GmE6myc1AtxM5CrMickmfSapQ5siNC2CZjuC7aQNDAIgWKTNZtVEHnifJxFkIkmtEcN0jq
	jrNqnFi6rx7yrWyCy9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUs8R-00306D-4Z; Mon, 27 Sep 2021 15:01:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUs8O-00304J-Py
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 15:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=AmafM7oTsaSvRec3LgbJaU361CT7WRh5EiFpJgFNI7I=; 
 t=1632754896; x=1633964496; b=E9d5k2CH5EjJRwBDV3pKdQSzF/FtUMsN0YM2Oues6jb2Deb
 7HKz1glb8NmirZhpWvWkCzBk8BQBKu1twVJmMLMqnsEcM7PC/VWMN8pQgvokKoLkEqimml6f9Ol0N
 d58kSB1yTx+9ILQIU1lrK821yykFkzU2JUSckT8oyO9zOooLdvSwkOdwIffGyPrEgj/RQc0EjggY4
 5ZJUVfT3qJ/n7URBYh4zqNgv3FA2AJClh93WA+Tciq/WW9itCq6CIdXe4ZKpCes5LuQaybKPS9y5u
 KsZDHOV/510ZpcEIWVbwBYk1gj1JFf3xDDtb4ZFHijo1+czfBn9qvVTm1/wMulrQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mUs8L-00CTDL-PA; Mon, 27 Sep 2021 17:01:33 +0200
Message-ID: <f300c9d2aae4b9b0e654f8a1e26c6e64beef7132.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix incorrect nss config
From: Johannes Berg <johannes@sipsolutions.net>
To: Thiraviyam Mariyappan <tmariyap@codeaurora.org>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 27 Sep 2021 17:01:32 +0200
In-Reply-To: <1632750104-1722-1-git-send-email-tmariyap@codeaurora.org>
References: <1632750104-1722-1-git-send-email-tmariyap@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_080136_861409_AA13B8E3 
X-CRM114-Status: GOOD (  14.80  )
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

T24gTW9uLCAyMDIxLTA5LTI3IGF0IDE5OjExICswNTMwLCBUaGlyYXZpeWFtIE1hcml5YXBwYW4g
d3JvdGU6Cj4gSW4gSEUgY2FwYWJpbGl0aWVzLCBIRS1NQ1MgUnggbWFwIGZpZWxkIGZpbGxlZCB3
aXRoIHZhbHVlIDB4MyBmb3IgYWxsIGVpZ2h0Cj4gc3BhdGlhbCBzdHJlYW1zIGlmIHR4cnggY2hh
aW5zIGNvbmZpZ3VyZWQgYXMgaW5jb3JyZWN0IHZhbHVlLgo+IFRoaXMgcGF0Y2ggY2hhbmdlcyBj
b25maWd1cmUgYXQgbGVhc3Qgc2luZ2xlIHNwYXRpYWwgc3RyZWFtIGZvciBIRS1NQ1MKPiAwIHRv
IDcgaW4gYWxsIHN1cHBvcnRlZCBjaGFubmVsIHdpZHRocyBpZiBuc3MgY29uZmlndXJlZCBhcyBp
bmNvcnJlY3QKPiB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGlyYXZpeWFtIE1hcml5YXBw
YW4gPHRtYXJpeWFwQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+IMKgbmV0L21hYzgwMjExL2hlLmMg
fCA3ICsrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvbmV0L21hYzgwMjExL2hlLmMgYi9uZXQvbWFjODAyMTEvaGUuYwo+IGluZGV4IGMw
NWFmNzAuLmVlMTEzZmY1IDEwMDY0NAo+IC0tLSBhL25ldC9tYWM4MDIxMS9oZS5jCj4gKysrIGIv
bmV0L21hYzgwMjExL2hlLmMKPiBAQCAtMTUxLDYgKzE1MSwxMyBAQCBpZWVlODAyMTFfaGVfY2Fw
X2llX3RvX3N0YV9oZV9jYXAoc3RydWN0IGllZWU4MDIxMV9zdWJfaWZfZGF0YSAqc2RhdGEsCj4g
wqAJCSAgICAgICAmaGVfY2FwX2llW3NpemVvZihoZV9jYXAtPmhlX2NhcF9lbGVtKSArIG1jc19u
c3Nfc2l6ZV0sCj4gwqAJCSAgICAgICBoZV9wcGVfc2l6ZSk7Cj4gwqAKPiAKPiArCWlmIChoZV9j
YXAtPmhlX21jc19uc3Nfc3VwcC5yeF9tY3NfODAgPT0gY3B1X3RvX2xlMTYoMHhGRkZGKSkgewo+
ICsJCWhlX2NhcC0+aGFzX2hlID0gZmFsc2U7Cj4gKwkJc2RhdGFfaW5mbyhzZGF0YSwgIklnbm9y
aW5nIEhFIElFIGZyb20gJXBNIGR1ZSB0byBpbmNvcnJlY3QgcnhfbWNzXzgwXG4iLAo+ICsJCQkg
ICBzdGEtPmFkZHIpOwo+ICsJCXJldHVybjsKPiArCX0KCkxpa2Ugc28gbWFueSBvdGhlciB3b3Jr
YXJvdW5kcywgdGhpcyBzaG91bGQgcHJvYmFibHkgY29tZSB3aXRoIGEgY29tbWVudAphcyB0byBf
d2h5XyB3ZSdyZSBkb2luZyB0aGlzLCBpZGVhbGx5IGluY2x1ZGluZyB0aGUgbW9kZWwvZmlybXdh
cmUKdmVyc2lvbiAuLi4KCmpvaGFubmVzCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMWsK
