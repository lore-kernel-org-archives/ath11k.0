Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D4BC77B76
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ru6o6tnVsCcTo3kHikedYySL+glmpiA0/Lh6F6wY4HA=; b=oAg75wvWcF3YKV
	WTswwCRaJpOf5K670MlLARF7Erk3NIRSl3M8+BejbFr0b7lepbAV8H+UAirYZhZN1CAni8WqrgC14
	8RxGGd+xH2UWWprTsUHJs5KfTSrJzXS4ImbcB+TmEsjTfkoAmWFIt02r2ebzPMZDdBbfYIaP6qa4L
	QfsoZQWJ4pmyznhI32O4aM3tKgxRG5bLeTWI2I/+2psYw1tXypufxHQSo2hPD8mjDad6I4kDJkY2e
	fbYQPHy86UFv04nDNBs33uPGm+47mI3V7HfVqMuXGR88tEe7SC910diywZ4p4SzLaxwQnfNelEorL
	Kh+NDUmUV1zQJGO5SMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohjQ-001UjT-1x;
	Tue, 18 Apr 2023 09:34:36 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohjO-001Ui8-16
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=RzCgGYfROrvIQhr2HcmBHV9WvQ0SlwHJfX0zaCj22AQ=;
	t=1681810474; x=1683020074; b=FTnw2G5BDm2UFbQO3Fld2hXNBrhzYXCABTD2xz0prmjyn6J
	go3KMtKoxMUrB8foobYygCQc/jUEe+WEDP6mwtIcW9TiOS2JQWHXk3g9CSvobmzVLdc90JWhvcGMd
	uEzjpIMszvfvSdcFjJ24NQl1TIKDjZQoj1NCXyoh7PZekGGyD/b+qMYn+bdDqNGwBRUTLdTERol5V
	gd5iwJKSIJrllRKiz8WwBTxB3svdDr+QjNm8Q6K/3ryfUSoMZfcJklFOK8aQgKCYJw+fTgTuckcWN
	FN4b4pt2lyGmvpymkkPg13I2OIy9D4PGTmpmNtQIOYytBwSQn3kVQvTmsGcF1c1g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pohjJ-001Z9e-2d;
	Tue, 18 Apr 2023 11:34:29 +0200
Message-ID: <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 11:34:28 +0200
In-Reply-To: <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
	 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
	 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023434_373725_ABE9A06E 
X-CRM114-Status: GOOD (  11.72  )
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

T24gVHVlLCAyMDIzLTA0LTE4IGF0IDE3OjI3ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiAKPiBO
b3cgbG93ZXIgZHJpdmVyIEkgdXNlZCBkbyBub3Qgc3RvcmUgdGhlIGtlecKgCj4gCgpTdXJlLCB0
aGF0J3MgZmluZS4KCj4gYW5kIGRvIG5vdCB0cmlnZ2VyCj4gQlNTX0NIQU5HRURfQVNTT0MgZm9y
IG5ldyBsaW5rcyBhZnRlciBhc3NvYy4KCkkgdGhpbmsgeW91IG5lZWQgdG8gdGhpbmsgaGFyZCBh
Ym91dCB0aGlzIC4uLiB3aGF0ZXZlciBCU1NfQ0hBTkdFRF9BU1NPQwpjYXVzZXMgaXMgbGlrZWx5
IG5vIGxvbmdlciBjb3JyZWN0IGluIE1MTy4gQWdhaW4sIHRoZSBhc3NvYyBzdGF0ZQoqaXRzZWxm
KiBpcyBvbmx5IGNoYW5nZWQgb25jZSwgd2hlbiB0aGUgd2hvbGUgTUxEIGFzc29jaWF0ZWQuCgo+
IFNvIG15IHN1Z2dlc3Rpb24gaXMgYSB3YXkgdG8gYWN0aXZlIGFsbCBsaW5rcyB3aGlsZSBhc3Nv
YywgdGhpcyB3YXkgaXMgCj4gc2ltcGxlIGZvciBsb3dlciBkcml2ZXIgSSB1c2VkLgoKU3VyZSwg
YW5kIHdlIGRvIHRoYXQuCgpCdXQgdGhhdCdzIG5vdCB3aGF0IHlvdSdyZSBhc2tpbmcgLSB5b3Un
cmUgYXNraW5nIHRvIHJlLWRvIHNvbWUgKk1MRCoKc3RhdGUgd2hlbiBhIG5ldyBsaW5rIGlzIGFk
ZGVkLCBhbmQgSSdtIHNheWluZyB0aGF0IGl0IGRvZXNuJ3QgbWFrZQpzZW5zZSB0byAiYWRkIiAo
YWdhaW4pIGEga2V5IHRvIHRoZSBNTEQgdGhhdCB3YXMgYWxyZWFkeSBhZGRlZCwgbm9yCmNhbGxp
bmcgYSB2aWYgKE1MRCEpIGxldmVsIG1ldGhvZCBzYXlpbmcgdGhlIE1MRCBjaGFuZ2VkIHN0YXRl
IHRvCmFzc29jaWF0ZWQgKGFnYWluKS4KCkkgcmVhbGx5IHRoaW5rIHlvdSBzaG91bGQgc29sdmUg
dGhpcyBpbiB0aGUgZHJpdmVyLCB0aGF0IGRvZXNuJ3QgbWVhbgp5b3UgaGF2ZSB0byBfc3RvcmVf
IGhlIGtleSwgeW91IGNhbiB1c2Ugb25lIG9mIHRoZSBpdGVyYXRpb24gZnVuY3Rpb25zCmFzIHdl
bGwuCgo+IEFsc28gaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3MoKSBpcyBhbm90aGVyIHdheSB0
byBhY3RpdmUgYWxsIGxpbmtzIAo+IGFmdGVyIGFzc29jLgo+IAoKU3VyZS4KCmpvaGFubmVzCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
