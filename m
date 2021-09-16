Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB15C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB63861241
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB63861241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUcVQvxJcl+qpSlxUjA9REIA6JmhZdVBHcFvh0SHDgo=; b=HqjXefsZqLvupI
	9QKAq0KP3uGurTNJJ4tf+DDCXQwm4Am4v+KCZlsrN5Uah9oFcVlEsXTolvMnFz6GL9Fsssx8ImmCJ
	hOEQjSV9vw9+fqpWtAKHr/gmXVSdj4K13YplowmZr9A7/Mm0Y544OMShbVtDxTPxThbh/NprMV1lD
	27jdWiLGUMxwLGcok/5HXrXdfkMuh0rczRoGjEDyjYbrdW7E+kla2kEHoFyHPoK7QiOh9GZJp3zyj
	kmQRsbGfQpRfeyTb/tQtJBEbKac3jT7+j0WN7FL559o1Gq1yEwlalGD0+rpsTm/Jq+EM6Js36tD2W
	czRCgL0D2v5xv8+AaDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQtqD-00BZSg-LE; Thu, 16 Sep 2021 16:02:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQtq9-00BZSC-G2
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 16:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=fSVySNBHzy+tCJVdmsFE9bKP/0IBbKfnrmCay+KMMFI=; 
 t=1631808140; x=1633017740; b=YECA/sf4t+K1mSqrtXPnssgm/ZtaXxUzmZNbzrpDacf9GFf
 KPFsE6eLum1ZndxvPUPj9+l3D1TDzqqW94cgZTpSkC8TdI1SO1KR6LYaklGjZPuj8aG01FRR7HDii
 SykfU5uPE6vbkyigWr7ZqVfaSAA3dvyX3LCFZHlcnXRFy+qlfGRxCeSf2w1czV4MbaaiH03yF5oVE
 E/LhPxmqg0gMaDwatMrobrIjSgK5FRGY/pnEHOBNPWCy3xtMP01G6eSUjOSY4BdG20Rx7VypaFk9o
 tO6YvGyXn0rLZqurZmnsnkdsFDHLA4DxZdl70itKwPSyg1B9/SIs4clULAf5qRFQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mQtq3-007nkC-Mt; Thu, 16 Sep 2021 18:02:15 +0200
Message-ID: <a3df1f072600e79bac0a247b905fec8b946f0729.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] ieee80211: Add new A-MPDU factor macro for HE 6 GHz
 peer caps
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Pradeep
 Kumar Chitrapu <pradeepc@codeaurora.org>, Jouni Malinen
 <jouni@codeaurora.org>
Date: Thu, 16 Sep 2021 18:02:14 +0200
In-Reply-To: <87wnngy2ro.fsf@codeaurora.org>
References: <20210913175510.193005-1-jouni@codeaurora.org>
 <87wnngy2ro.fsf@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_090221_577744_578A47D8 
X-CRM114-Status: GOOD (  13.09  )
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

T24gVGh1LCAyMDIxLTA5LTE2IGF0IDE4OjEwICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOgo+IEpv
dW5pIE1hbGluZW4gPGpvdW5pQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4gCj4gPiBGcm9tOiBQ
cmFkZWVwIEt1bWFyIENoaXRyYXB1IDxwcmFkZWVwY0Bjb2RlYXVyb3JhLm9yZz4KPiA+IAo+ID4g
QWRkIElFRUU4MDIxMV9IRV82R0haX01BWF9BTVBEVV9GQUNUT1IgYXMgcGVyIElFRUUgU3RkIDgw
Mi4xMWF4LTIwMjEsCj4gPiA5LjQuMi4yNjMgdG8gdXNlIGZvciBwZWVyIG1heCBBLU1QRFUgZmFj
dG9yIGluIDYgR0h6IGJhbmQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFByYWRlZXAgS3VtYXIg
Q2hpdHJhcHUgPHByYWRlZXBjQGNvZGVhdXJvcmEub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogSm91
bmkgTWFsaW5lbiA8am91bmlAY29kZWF1cm9yYS5vcmc+Cj4gPiAtLS0KPiA+IMKgaW5jbHVkZS9s
aW51eC9pZWVlODAyMTEuaCB8IDEgKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaWVlZTgwMjExLmggYi9pbmNs
dWRlL2xpbnV4L2llZWU4MDIxMS5oCj4gPiBpbmRleCA2OTQyNjQ1MDMxMTkuLmExYTdlZGEzNWNi
NSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvaWVlZTgwMjExLmgKPiA+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvaWVlZTgwMjExLmgKPiA+IEBAIC0yMDg0LDYgKzIwODQsNyBAQCBpbnQgaWVl
ZTgwMjExX2dldF92aHRfbWF4X25zcyhzdHJ1Y3QgaWVlZTgwMjExX3ZodF9jYXAgKmNhcCwKPiA+
IMKgCj4gPiAKPiA+IAo+ID4gCj4gPiDCoCNkZWZpbmUgSUVFRTgwMjExX0hFX1ZIVF9NQVhfQU1Q
RFVfRkFDVE9SCTIwCj4gPiDCoCNkZWZpbmUgSUVFRTgwMjExX0hFX0hUX01BWF9BTVBEVV9GQUNU
T1IJMTYKPiA+ICsjZGVmaW5lIElFRUU4MDIxMV9IRV82R0haX01BWF9BTVBEVV9GQUNUT1IJMTMK
PiAKPiBKb2hhbm5lcywgY2FuIEkgdGFrZSB0aGlzIHZpYSBteSBhdGggdHJlZT8gSSB0aGluayB0
aGF0J3MgdGhlIGVhc2llc3QgYXMKPiB0aGUgYXRoMTFrIHBhdGNoZXMgZGVwZW5kIG9uIHRoaXMu
Cj4gClN1cmUsIGxvb2tzIGZpbmUuCgpBY2tlZC1ieTogSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNA
c2lwc29sdXRpb25zLm5ldD4KCmpvaGFubmVzCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
