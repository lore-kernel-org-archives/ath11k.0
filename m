Return-Path: <SRS0=boUD=GC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7012C433E0
	for <ath11k@archiver.kernel.org>; Wed, 30 Dec 2020 10:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F95F221F8
	for <ath11k@archiver.kernel.org>; Wed, 30 Dec 2020 10:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F95F221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aH+Qe3mDMjwBYP3uxzKMvX3rXDRmfhtf/K18Ws/DN84=; b=mZYTuVs5stNUCWQJo4IP2lf+j
	eKCQRBh+VFbSzqexBRmUHO75uD1nzCqup8j8vay2w8rLOzHcvBSJm1djew3PNzgTVwbB2s/nxJXD7
	CAO/AU2UN5MfTBi6C16mGmFgh/jyJ389+3pzhQLaijv9aAmLkdN87B5exJq52Vxx8GoLPviIWQSNq
	WG5n77F1F/UdWwZVxHCebBJbn0EhIcdYH1RZYRgEkzpXLLpv7wcVV3s2VkVuqMD8fWs6i7g/bCim1
	ti0kuI5XkVPUaU94CMbNRDZN50A6SYHDYNoQtVVcHdy02/X06SJkC4ZCzkr57L1OMCV+n05Z/8wjW
	IwfGay7TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuZAz-0001FX-4K; Wed, 30 Dec 2020 10:57:57 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuZAw-0001F9-DM
 for ath11k@lists.infradead.org; Wed, 30 Dec 2020 10:57:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609325874; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=osdqX7f+Gzj2BYYE5PSLepRpNoJSJdoe2RuEdG6h+08=;
 b=SzZCO/0TfuogsKfp/B7mGfJu+4H51f7s6F/EQVJKWKDwT8chNM6bS1FoE8Yq4Xm39b9Ld1rY
 PG0uNNQbRVF8nV9Xa5h9CW9xW0PRp05FYKZ4Y2LlIGIup6PpC64vW+lBHu+iIV7OGN+UUKut
 sF2Vbb4Qn7aUiYETixvh2yy3xbA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fec5d2efbc85e54c5945268 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Dec 2020 10:57:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5A69C433C6; Wed, 30 Dec 2020 10:57:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 305BBC433CA;
 Wed, 30 Dec 2020 10:57:49 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 30 Dec 2020 18:57:49 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Shay Bar <shay.bar@celeno.com>
Subject: Re: [PATCH] wireless: fix wrong 160/80+80 MHz setting
In-Reply-To: <20200826143139.25976-1-shay.bar@celeno.com>
References: <20200826143139.25976-1-shay.bar@celeno.com>
Message-ID: <34893f267fa37b43d21c19d4c08c090e@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_055754_568490_E04EBA2D 
X-CRM114-Status: GOOD (  18.39  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org,
 aviad.brikman@celeno.com, Johannes Berg <johannes@sipsolutions.net>,
 eliav.farber@celeno.com, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wOC0yNiAyMjozMSwgU2hheSBCYXIgd3JvdGU6Cj4gRml4IGNmZzgwMjExX2NoYW5k
ZWZfdXNhYmxlKCk6Cj4gY29uc2lkZXIgSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CVyB3aGVu
IHZlcmlmeWluZyAxNjAvODArODAgTUh6Lgo+IApXaGVuIHN0YXRpb24gd2l0aCBiZWxvdyAyIGJp
dCBhbmQgY29ubmVjdCB0byBhIDE2ME1IWiAxMWFjIG1vZGUgQVAsIGl0IAp3aWxsIHRyeSB0byB1
c2UgMTYwTWh6IHdpZHRoIGFmdGVyIHRoaXMgcGF0Y2gsCmJ1dCBpdCBkb2VzIG5vdCBzdXBwb3J0
IDE2ME0gaW4gZmFjdCBhY2NvcmRpbmcgc3BlYyBvZiBJRUVFIDgwMi4xMQouLi4uIC4uLi4gLi4u
LiAuLi4uIC4uLi4gLi4uLiAuLi4uIDAwLi4gPSBTdXBwb3J0ZWQgQ2hhbm5lbCBXaWR0aCBTZXQ6
IApOZWl0aGVyIDE2ME1IeiBub3IgODArODAgc3VwcG9ydGVkICgweDApCjAxLi4gLi4uLiAuLi4u
IC4uLi4gLi4uLiAuLi4uIC4uLi4gLi4uLiA9IEV4dGVuZGVkIE5TUyBCVyBTdXBwb3J0OiAweDEK
CnJlZmVyIHRvIHNwZWMgb2YgSUVFRSA4MDIuMTEuClRhYmxlIDktMjUw4oCUU2V0dGluZyBvZiB0
aGUgU3VwcG9ydGVkIENoYW5uZWwgV2lkdGggU2V0IHN1YmZpZWxkIGFuZCAKRXh0ZW5kZWQgTlNT
IEJXIFN1cHBvcnQgc3ViZmllbGQgYXQgYSBTVEEgdHJhbnNtaXR0aW5nIHRoZSBWSFQgCkNhcGFi
aWxpdGllcyBJbmZvcm1hdGlvbiBmaWVsZAp2YWx1ZSBvZiB0aGUgMTYwTWh6IGlzIDEvMiBpbiB0
aGUgdGFibGUgZm9yIHVwcGVyIGNvbmZpZ3VyZS4KTk9URSAy4oCUMS8yw5cgb3IgMy80w5cgTWF4
IFZIVCBOU1Mgc3VwcG9ydCBtaWdodCBlbmQgdXAgYmVpbmcgMCwgaW5kaWNhdGluZyAKbm8gc3Vw
cG9ydC4KCj4gQmFzZWQgb246Cj4gIlRhYmxlIDktMjcyIOKAlCBTZXR0aW5nIG9mIHRoZSBTdXBw
b3J0ZWQgQ2hhbm5lbCBXaWR0aCBTZXQgc3ViZmllbGQgYW5kCj4gRXh0ZW5kZWQgTlNTIEJXCj4g
U3VwcG9ydCBzdWJmaWVsZCBhdCBhIFNUQSB0cmFuc21pdHRpbmcgdGhlIFZIVCBDYXBhYmlsaXRp
ZXMgSW5mb3JtYXRpb24gCj4gZmllbGQiCj4gRnJvbSAiRHJhZnQgUDgwMi4xMVJFVm1kX0QzLjAu
cGRmIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF2aWFkIEJyaWttYW4gPGF2aWFkLmJyaWttYW5AY2Vs
ZW5vLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTaGF5IEJhciA8c2hheS5iYXJAY2VsZW5vLmNvbT4K
PiAtLS0KPiAgbmV0L3dpcmVsZXNzL2NoYW4uYyB8IDE1ICsrKysrKysrKysrKy0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvbmV0L3dpcmVsZXNzL2NoYW4uYyBiL25ldC93aXJlbGVzcy9jaGFuLmMKPiBpbmRleCA5
MGYwZjgyY2Q5Y2EuLmE1MWQxMWQzYmUzMyAxMDA2NDQKPiAtLS0gYS9uZXQvd2lyZWxlc3MvY2hh
bi5jCj4gKysrIGIvbmV0L3dpcmVsZXNzL2NoYW4uYwo+IEBAIC05MTIsNiArOTEyLDcgQEAgYm9v
bCBjZmc4MDIxMV9jaGFuZGVmX3VzYWJsZShzdHJ1Y3Qgd2lwaHkgKndpcGh5LAo+ICAgICAgICAg
c3RydWN0IGllZWU4MDIxMV9zdGFfdmh0X2NhcCAqdmh0X2NhcDsKPiAgICAgICAgIHN0cnVjdCBp
ZWVlODAyMTFfZWRtZyAqZWRtZ19jYXA7Cj4gICAgICAgICB1MzIgd2lkdGgsIGNvbnRyb2xfZnJl
cSwgY2FwOwo+ICsgICAgICAgYm9vbCBzdXBwb3J0XzgwXzgwID0gZmFsc2U7Cj4gCj4gICAgICAg
ICBpZiAoV0FSTl9PTighY2ZnODAyMTFfY2hhbmRlZl92YWxpZChjaGFuZGVmKSkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsKPiBAQCAtOTc5LDkgKzk4MCwxNiBAQCBib29sIGNmZzgw
MjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBoeSAqd2lwaHksCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAg
IGNhc2UgTkw4MDIxMV9DSEFOX1dJRFRIXzgwUDgwOgo+IC0gICAgICAgICAgICAgICBjYXAgPSB2
aHRfY2FwLT5jYXAgJiAKPiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfTUFTSzsK
PiArICAgICAgICAgICAgICAgY2FwID0gdmh0X2NhcC0+Y2FwOwo+ICsgICAgICAgICAgICAgICBz
dXBwb3J0XzgwXzgwID0KPiArICAgICAgICAgICAgICAgICAgICAgICAoKGNhcCAmCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAKPiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhf
MTYwXzgwUExVUzgwTUhaKSB8fAo+ICsgICAgICAgICAgICAgICAgICAgICAgIChjYXAgJiBJRUVF
ODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwTUhaIAo+ICYmCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykgfHwK
PiArICAgICAgICAgICAgICAgICAgICAgICAoKGNhcCAmIElFRUU4MDIxMV9WSFRfQ0FQX0VYVF9O
U1NfQldfTUFTSykgPj4KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRUVF
ODAyMTFfVkhUX0NBUF9FWFRfTlNTX0JXX1NISUZUIAo+ID4gMSkpOwo+ICAgICAgICAgICAgICAg
ICBpZiAoY2hhbmRlZi0+Y2hhbi0+YmFuZCAhPSBOTDgwMjExX0JBTkRfNkdIWiAmJgo+IC0gICAg
ICAgICAgICAgICAgICAgY2FwICE9IAo+IElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURU
SF8xNjBfODBQTFVTODBNSFopCj4gKyAgICAgICAgICAgICAgICAgICAhc3VwcG9ydF84MF84MCkK
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICAgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+ICAgICAgICAgY2FzZSBOTDgwMjExX0NIQU5fV0lEVEhfODA6
Cj4gQEAgLTEwMDEsNyArMTAwOSw4IEBAIGJvb2wgY2ZnODAyMTFfY2hhbmRlZl91c2FibGUoc3Ry
dWN0IHdpcGh5ICp3aXBoeSwKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gICAgICAgICAgICAgICAgIGNhcCA9IHZodF9jYXAtPmNhcCAmIAo+IElFRUU4MDIxMV9WSFRf
Q0FQX1NVUFBfQ0hBTl9XSURUSF9NQVNLOwo+ICAgICAgICAgICAgICAgICBpZiAoY2FwICE9IElF
RUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFogJiYKPiAtICAgICAgICAgICAg
ICAgICAgIGNhcCAhPSAKPiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgw
UExVUzgwTUhaKQo+ICsgICAgICAgICAgICAgICAgICAgY2FwICE9IAo+IElFRUU4MDIxMV9WSFRf
Q0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBfODBQTFVTODBNSFogJiYKPiArICAgICAgICAgICAgICAg
ICAgICEodmh0X2NhcC0+Y2FwICYgCj4gSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CV19NQVNL
KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAtLQo+IDIuMTcuMQo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gVGhlIGluZm9ybWF0aW9uIHRyYW5zbWl0dGVkIGlz
IGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5Cj4gdG8gd2hpY2ggaXQgaXMg
YWRkcmVzc2VkIGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kL29yCj4gcHJpdmlsZWdl
ZCBtYXRlcmlhbC4gQW55IHJldHJhbnNtaXNzaW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nIG9y
Cj4gb3RoZXIgdXNlIG9mLCBvciB0YWtpbmcgb2YgYW55IGFjdGlvbiBpbiByZWxpYW5jZSB1cG9u
IHRoaXMKPiBpbmZvcm1hdGlvbiBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBp
biBlcnJvciwgcGxlYXNlCj4gY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhlIG1hdGVy
aWFsIGZyb20gYW55IGNvbXB1dGVyLiBOb3RoaW5nCj4gY29udGFpbmVkIGhlcmVpbiBzaGFsbCBi
ZSBkZWVtZWQgYXMgYSByZXByZXNlbnRhdGlvbiwgd2FycmFudHkgb3IgYQo+IGNvbW1pdG1lbnQg
YnkgQ2VsZW5vLiBObyB3YXJyYW50aWVzIGFyZSBleHByZXNzZWQgb3IgaW1wbGllZCwKPiBpbmNs
dWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgYW55IGltcGxpZWQgd2FycmFudGllcyBvZgo+IG5v
bi1pbmZyaW5nZW1lbnQsIG1lcmNoYW50YWJpbGl0eSBhbmQgZml0bmVzcyBmb3IgYSBwYXJ0aWN1
bGFyCj4gcHVycG9zZS4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKLS0gCmF0
aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
