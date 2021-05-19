Return-Path: <SRS0=TiPo=KO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83FAC433ED
	for <ath11k@archiver.kernel.org>; Wed, 19 May 2021 07:23:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6236460725
	for <ath11k@archiver.kernel.org>; Wed, 19 May 2021 07:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6236460725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SVYKQ+2Wxmk1W28Yti45/CaxBvX+vBoCKHYmIh4/nM=; b=GiQ38QYAVFCdjO6rGUBHl8eXk
	jLgb2P+leaW/l9oxIKRJkL/WHC6y4yw8IHXZwaf8e+OwDFfnIStXIXWKc4fKaQ2Ia7TWs7xYovrQK
	pRaNkClD+5Vf8KMBelxD6Iq2TaC7243Bq10X0mHJAfx+U4hA1VajMONaywF0x3rqIwWNW6hhi9yqW
	3U24eFYpRb9d0eSGuNNFMma08vG24PP/YJDdwa/qCi8VdBPQyo+q+ZLRT+p80Zih/HLY209HhSb5F
	00eJS08Mym85vdwZCL4ymlBag5HIxzTJGOQl7Uw2N75VM8tfaY4sQcwQFjnmmWTQ/66Zpi6v0uLrq
	TX1/ZgDVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljGYO-0039a9-CF; Wed, 19 May 2021 07:23:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGYL-0039ZH-KB
 for ath11k@desiato.infradead.org; Wed, 19 May 2021 07:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Xi6rm+02wfE8iimkDrJVtwRuysvJH7sJ44vjdfKzLeY=; b=H+Sl+dNhjW0zxrKA9dZlytKLvY
 wYYA5K0lHD4gLJq16YfVswwzog1bMshG977POLYC7FEJnoUx4sig/a0/rInhb+j7DHp89KrsTgLHU
 smXKjNSP6FZxb4kqZWstbNKfG2S5tIAaYqeeAjy3yJ6Xx9ciE1d7kj9rubHyDKGZGwqXMjAcyJhpb
 7F8t2SZiT9XQaGuure1cnky68dGcTzf0MN1zKzdcTB5WVvNnP85GAhoC80JPhvDsFeZsCVniojcPp
 xZ/LilSs0tpz0GRDtv+MFkgDwquP50el5edSjSEuwctrX8iXAI894yzrWwkDZsyNlyH31GgK/ydG1
 4rOyuyyw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljGYE-00FDUE-HN
 for ath11k@lists.infradead.org; Wed, 19 May 2021 07:23:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621409014; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xi6rm+02wfE8iimkDrJVtwRuysvJH7sJ44vjdfKzLeY=;
 b=SKpioW/E9IRiDbuRfRL+rLBdQ6Zy2jMI8/QF7A7mEWmnNarBLAnqqvURKfK5pilDCWCUPyOB
 JawgMKMEYs+MgxeLZVkZdj0Y0ufsMtMYuYT5MM3fb4+c0PjxGTRS267B9yHm08t8MaEN/x9B
 j3M5AXEOBYtlSOPzWNLGX3vGfO0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a4bcdd2bff04e53be67923 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 07:23:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57441C433F1; Wed, 19 May 2021 07:23:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DDCC9C4338A;
 Wed, 19 May 2021 07:23:08 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 19 May 2021 15:23:08 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Shay Bar <shay.bar@celeno.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, aviad.brikman@celeno.com,
 eliav.farber@celeno.com, linux-wireless-owner@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: [PATCH] wireless: fix wrong 160/80+80 MHz setting
In-Reply-To: <20200826143139.25976-1-shay.bar@celeno.com>
References: <20200826143139.25976-1-shay.bar@celeno.com>
Message-ID: <dbf4ca6dc2b49b55d7272e4d8eba94db@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_002334_989926_5C7817BB 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wOC0yNiAyMjozMSwgU2hheSBCYXIgd3JvdGU6Cj4gRml4IGNmZzgwMjExX2NoYW5k
ZWZfdXNhYmxlKCk6Cj4gY29uc2lkZXIgSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CVyB3aGVu
IHZlcmlmeWluZyAxNjAvODArODAgTUh6Lgo+IAo+IEJhc2VkIG9uOgo+ICJUYWJsZSA5LTI3MiDi
gJQgU2V0dGluZyBvZiB0aGUgU3VwcG9ydGVkIENoYW5uZWwgV2lkdGggU2V0IHN1YmZpZWxkIGFu
ZAo+IEV4dGVuZGVkIE5TUyBCVwo+IFN1cHBvcnQgc3ViZmllbGQgYXQgYSBTVEEgdHJhbnNtaXR0
aW5nIHRoZSBWSFQgQ2FwYWJpbGl0aWVzIEluZm9ybWF0aW9uIAo+IGZpZWxkIgo+IEZyb20gIkRy
YWZ0IFA4MDIuMTFSRVZtZF9EMy4wLnBkZiIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBdmlhZCBCcmlr
bWFuIDxhdmlhZC5icmlrbWFuQGNlbGVuby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2hheSBCYXIg
PHNoYXkuYmFyQGNlbGVuby5jb20+Cj4gLS0tCj4gIG5ldC93aXJlbGVzcy9jaGFuLmMgfCAxNSAr
KysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL25ldC93aXJlbGVzcy9jaGFuLmMgYi9uZXQvd2ly
ZWxlc3MvY2hhbi5jCj4gaW5kZXggOTBmMGY4MmNkOWNhLi5hNTFkMTFkM2JlMzMgMTAwNjQ0Cj4g
LS0tIGEvbmV0L3dpcmVsZXNzL2NoYW4uYwo+ICsrKyBiL25ldC93aXJlbGVzcy9jaGFuLmMKPiBA
QCAtOTEyLDYgKzkxMiw3IEBAIGJvb2wgY2ZnODAyMTFfY2hhbmRlZl91c2FibGUoc3RydWN0IHdp
cGh5ICp3aXBoeSwKPiAgICAgICAgIHN0cnVjdCBpZWVlODAyMTFfc3RhX3ZodF9jYXAgKnZodF9j
YXA7Cj4gICAgICAgICBzdHJ1Y3QgaWVlZTgwMjExX2VkbWcgKmVkbWdfY2FwOwo+ICAgICAgICAg
dTMyIHdpZHRoLCBjb250cm9sX2ZyZXEsIGNhcDsKPiArICAgICAgIGJvb2wgc3VwcG9ydF84MF84
MCA9IGZhbHNlOwo+IAo+ICAgICAgICAgaWYgKFdBUk5fT04oIWNmZzgwMjExX2NoYW5kZWZfdmFs
aWQoY2hhbmRlZikpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gQEAgLTk3OSw5
ICs5ODAsMTYgQEAgYm9vbCBjZmc4MDIxMV9jaGFuZGVmX3VzYWJsZShzdHJ1Y3Qgd2lwaHkgKndp
cGh5LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIE5MODAyMTFfQ0hBTl9XSURUSF84MFA4MDoKPiAt
ICAgICAgICAgICAgICAgY2FwID0gdmh0X2NhcC0+Y2FwICYgCj4gSUVFRTgwMjExX1ZIVF9DQVBf
U1VQUF9DSEFOX1dJRFRIX01BU0s7Cj4gKyAgICAgICAgICAgICAgIGNhcCA9IHZodF9jYXAtPmNh
cDsKPiArICAgICAgICAgICAgICAgc3VwcG9ydF84MF84MCA9Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgKChjYXAgJgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgCj4gSUVFRTgwMjExX1ZI
VF9DQVBfU1VQUF9DSEFOX1dJRFRIXzE2MF84MFBMVVM4ME1IWikgfHwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAoY2FwICYgSUVFRTgwMjExX1ZIVF9DQVBfU1VQUF9DSEFOX1dJRFRIXzE2ME1I
WiAKPiAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgICBjYXAgJiBJRUVFODAyMTFfVkhUX0NB
UF9FWFRfTlNTX0JXX01BU0spIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgKChjYXAgJiBJ
RUVFODAyMTFfVkhUX0NBUF9FWFRfTlNTX0JXX01BU0spID4+Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CV19TSElGVCAKPiA+
IDEpKTsKPiAgICAgICAgICAgICAgICAgaWYgKGNoYW5kZWYtPmNoYW4tPmJhbmQgIT0gTkw4MDIx
MV9CQU5EXzZHSFogJiYKPiAtICAgICAgICAgICAgICAgICAgIGNhcCAhPSAKPiBJRUVFODAyMTFf
VkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgwTUhaKQo+ICsgICAgICAgICAgICAg
ICAgICAgIXN1cHBvcnRfODBfODApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICAgICAgICAgICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPiAgICAgICAgIGNhc2Ug
Tkw4MDIxMV9DSEFOX1dJRFRIXzgwOgo+IEBAIC0xMDAxLDcgKzEwMDksOCBAQCBib29sIGNmZzgw
MjExX2NoYW5kZWZfdXNhYmxlKHN0cnVjdCB3aXBoeSAqd2lwaHksCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgICAgICAgICBjYXAgPSB2aHRfY2FwLT5j
YXAgJiAKPiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfTUFTSzsKPiAgICAgICAg
ICAgICAgICAgaWYgKGNhcCAhPSBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYw
TUhaICYmCj4gLSAgICAgICAgICAgICAgICAgICBjYXAgIT0gCj4gSUVFRTgwMjExX1ZIVF9DQVBf
U1VQUF9DSEFOX1dJRFRIXzE2MF84MFBMVVM4ME1IWikKPiArICAgICAgICAgICAgICAgICAgIGNh
cCAhPSAKPiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgwTUha
ICYmCj4gKyAgICAgICAgICAgICAgICAgICAhKHZodF9jYXAtPmNhcCAmIAo+IElFRUU4MDIxMV9W
SFRfQ0FQX0VYVF9OU1NfQldfTUFTSykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwppbiBUYWJsZSA5LTI1MeKAlFN1cHBvcnRlZCBWSFQtTUNTIGFuZCBOU1MgU2V0IHN1
YmZpZWxkcywgaXQgaGFzIFN1YmZpZWxkIApWSFQgRXh0ZW5kZWQKTlNTIEJXIENhcGFibGUsIGl0
cyBEZWZpbml0aW9uIGlzOgpJbmRpY2F0ZXMgd2hldGhlciB0aGUgU1RBIGlzIGNhcGFibGUgb2YK
aW50ZXJwcmV0aW5nIHRoZSBFeHRlbmRlZCBOU1MgQlcKU3VwcG9ydCBzdWJmaWVsZCBvZiB0aGUg
VkhUIENhcGFiaWxpdGllcwpJbmZvcm1hdGlvbiBmaWVsZAoKc28gaXQgc2hvdWxkIGNoZWNrIHRo
ZSBTdWJmaWVsZCBWSFQgRXh0ZW5kZWQgTlNTIEJXIENhcGFibGUgaW4gCnZodF9jYXAtPnZodF9t
Y3MgZmlyc3RseSwgaWYKaXQgaXMgMCwgdGhlbiBub3QgYWxsb3dlZCB0byBjaGVjayBJRUVFODAy
MTFfVkhUX0NBUF9FWFRfTlNTX0JXX01BU0sgb2YgCnZodF9jYXAtPmNhcC4KcGxlYXNlIGNvcnJl
Y3QgbWUgaWYgd3JvbmcuCgo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1
bHQ6Cj4gLS0KPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IFRoZSBpbmZvcm1hdGlvbiB0cmFuc21pdHRlZCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVy
c29uIG9yIGVudGl0eQo+IHRvIHdoaWNoIGl0IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4g
Y29uZmlkZW50aWFsIGFuZC9vcgo+IHByaXZpbGVnZWQgbWF0ZXJpYWwuIEFueSByZXRyYW5zbWlz
c2lvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZyBvcgo+IG90aGVyIHVzZSBvZiwgb3IgdGFraW5n
IG9mIGFueSBhY3Rpb24gaW4gcmVsaWFuY2UgdXBvbiB0aGlzCj4gaW5mb3JtYXRpb24gaXMgcHJv
aGliaXRlZC4gSWYgeW91IHJlY2VpdmVkIHRoaXMgaW4gZXJyb3IsIHBsZWFzZQo+IGNvbnRhY3Qg
dGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoZSBtYXRlcmlhbCBmcm9tIGFueSBjb21wdXRlci4gTm90
aGluZwo+IGNvbnRhaW5lZCBoZXJlaW4gc2hhbGwgYmUgZGVlbWVkIGFzIGEgcmVwcmVzZW50YXRp
b24sIHdhcnJhbnR5IG9yIGEKPiBjb21taXRtZW50IGJ5IENlbGVuby4gTm8gd2FycmFudGllcyBh
cmUgZXhwcmVzc2VkIG9yIGltcGxpZWQsCj4gaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8s
IGFueSBpbXBsaWVkIHdhcnJhbnRpZXMgb2YKPiBub24taW5mcmluZ2VtZW50LCBtZXJjaGFudGFi
aWxpdHkgYW5kIGZpdG5lc3MgZm9yIGEgcGFydGljdWxhcgo+IHB1cnBvc2UuCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
