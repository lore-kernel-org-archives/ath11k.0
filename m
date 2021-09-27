Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45842C433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1320160F0F
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 11:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1320160F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJvUoeHoQfWCHsmAKgAZD4ncgsBzz0XZmWG9b1S01+M=; b=gVPNrk9sjBAC0/
	PlgeVqG9YqjXu7VnwYDFgftJTL29TgJyyqDfVEHtco7rxK+Yt5RSjg/o8X71Qv/ZEYk5zAr1V++jy
	BkmK8oVWUgMJpM9bClFgcyVnXpahQs5QvHMsvra6Fca4KxLOSRsBaUqvOK9k5dinjcH9xZWgEpLhz
	Flbq7tHBn3NQJ/p2iHhhS6ad7ja/JTIBhh2KspQ5T2K0uUsZb/w/fdWHZ8kd+E/csOz4mQ/a88afQ
	BW3XrhxGMchRRRwtYPUiRR8z4wUJJ3/IlNmWNGlSZE+uMscQ+5+XVRTzcrRLybJHI08/pMaWBeodi
	1QqoB6H7ppF6LCEl5ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoiM-002QLH-QT; Mon, 27 Sep 2021 11:22:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoiJ-002QJH-T7
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 11:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=XphSQu6FESh2+jPkNi26+VZIRyCQpAwTinsGOYiLBDc=; 
 t=1632741744; x=1633951344; b=M2KVsnqxMVKfnbPkj1fo1EjmXzOs0zp5BNYzz5G4TY9P5tC
 uqsDnXUgOOpIvibhGM1T6ynKPy9I0gLGijJ3UmkeOp1WT5nwOzvHLoqRtgKKHzpMK5UFLhaB3qRVQ
 xWI3tFl4H8hzbdui1LvmR1Vvxz3lBd6ccIuOf35QRrCfNiMhDicyLMAW9V6wGHDsmB91ZEYsGAI8U
 ciyaPymTRJkREVwYh8aBuUqwERZDWkKeb3U3y/YhbpagalXPnU9nlF5RyVSAzl7RK15s+Pi4KWsCt
 PaDqNgbVv+QvAfM2b+UiP50QgsI6uHielRvxKtZLhxMPFcmFve4gwo/OBR6aOrhg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mUoiE-00COWa-Gl; Mon, 27 Sep 2021 13:22:22 +0200
Message-ID: <1b1174270c05786228d3059b0f0664268f689204.camel@sipsolutions.net>
Subject: Re: [PATCH v4 2/6] mac80211: add parse regulatory info in 6 GHz
 operation information
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 27 Sep 2021 13:22:20 +0200
In-Reply-To: <20210924100052.32029-3-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-3-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_042227_964658_2B2D746C 
X-CRM114-Status: GOOD (  14.86  )
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

T24gRnJpLCAyMDIxLTA5LTI0IGF0IDA2OjAwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiBUaGlz
IHBhdGNoIGlzIHRvIGNvbnZlcnQgdGhlIHJlZ3VsYXRvcnkgaW5mbyBzdWJmaWVsZCBpbiBIRSBv
cGVyYXRpb24KPiBlbGVtZW50IHRvIHBvd2VyIHR5cGUgYW5kIHNhdmUgaW4gc3RydWN0IGNmZzgw
MjExX2NoYW5fZGVmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVy
b3JhLm9yZz4KPiAtLS0KPiDCoG5ldC9tYWM4MDIxMS91dGlsLmMgfCAxMyArKysrKysrKysrKysr
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9u
ZXQvbWFjODAyMTEvdXRpbC5jIGIvbmV0L21hYzgwMjExL3V0aWwuYwo+IGluZGV4IGNhODAwOGJh
OWIxZi4uNjZlNDhmMjk0OTVhIDEwMDY0NAo+IC0tLSBhL25ldC9tYWM4MDIxMS91dGlsLmMKPiAr
KysgYi9uZXQvbWFjODAyMTEvdXRpbC5jCj4gQEAgLTMzODUsNiArMzM4NSw3IEBAIGJvb2wgaWVl
ZTgwMjExX2NoYW5kZWZfaGVfNmdoel9vcGVyKHN0cnVjdCBpZWVlODAyMTFfc3ViX2lmX2RhdGEg
KnNkYXRhLAo+IMKgCWNvbnN0IHN0cnVjdCBpZWVlODAyMTFfc3RhX2hlX2NhcCAqaGVfY2FwOwo+
IMKgCXN0cnVjdCBjZmc4MDIxMV9jaGFuX2RlZiBoZV9jaGFuZGVmID0gKmNoYW5kZWY7Cj4gwqAJ
Y29uc3Qgc3RydWN0IGllZWU4MDIxMV9oZV82Z2h6X29wZXIgKmhlXzZnaHpfb3BlcjsKPiArCXN0
cnVjdCBpZWVlODAyMTFfYnNzX2NvbmYgKmJzc19jb25mOwo+IMKgCWJvb2wgc3VwcG9ydF84MF84
MCwgc3VwcG9ydF8xNjA7Cj4gwqAJdTggaGVfcGh5X2NhcDsKPiDCoAl1MzIgZnJlcTsKPiBAQCAt
MzQyOCw2ICszNDI5LDE4IEBAIGJvb2wgaWVlZTgwMjExX2NoYW5kZWZfaGVfNmdoel9vcGVyKHN0
cnVjdCBpZWVlODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAo+IMKgCQkJCQkgICAgICBOTDgwMjEx
X0JBTkRfNkdIWik7Cj4gwqAJaGVfY2hhbmRlZi5jaGFuID0gaWVlZTgwMjExX2dldF9jaGFubmVs
KHNkYXRhLT5sb2NhbC0+aHcud2lwaHksIGZyZXEpOwo+IMKgCj4gCj4gCj4gCj4gKwlic3NfY29u
ZiA9ICZzZGF0YS0+dmlmLmJzc19jb25mOwo+ICsKPiArCXN3aXRjaCAodThfZ2V0X2JpdHMoaGVf
Nmdoel9vcGVyLT5jb250cm9sLAo+ICsJCQkgICAgSUVFRTgwMjExX0hFXzZHSFpfT1BFUl9DVFJM
X1JFR19JTkZPKSkgewo+ICsJY2FzZSBJRUVFODAyMTFfNkdIWl9DVFJMX1JFR19MUElfQVA6Cj4g
KwkJYnNzX2NvbmYtPnBvd2VyX3R5cGUgPSBJRUVFODAyMTFfUkVHX0xQSV9BUDsKPiArCQlicmVh
azsKPiArCWNhc2UgSUVFRTgwMjExXzZHSFpfQ1RSTF9SRUdfU1BfQVA6Cj4gKwkJYnNzX2NvbmYt
PnBvd2VyX3R5cGUgPSBJRUVFODAyMTFfUkVHX1NQX0FQOwo+ICsJCWJyZWFrOwo+ICsJfQoKSSBh
ZGRlZCBhIGRlZmF1bHQgY2FzZSBoZXJlIHRvIHNldCBpdCB0byBVTlNFVCwgc28gdGhhdCBpZiB5
b3UKZGlzY29ubmVjdCBhbmQgcmVjb25uZWN0IGV0Yy4geW91IGRvbid0IGdldCBzdGFsZSBkYXRh
LgoKam9oYW5uZXMKCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MWsK
