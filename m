Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CEC433FE
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qiF2EvEeCyeVx7ClCARsiVUvd5tBexxtwsjU5D7VAU=; b=Cvd+Z1Ao2VqTkr
	TkyHzHBwtKr9SK7B+MkqICqC/ZhdNyU0EJszVjTxd57pkutnl6DDCZu8EJ2cNlvsVnpvQUobK1HUr
	ERJXOCqnztNosFkuykonqA14708Bq1DG0YAfMxmDyBF4ggvtxuMTGKVD/6glZerGr5Qr2W/d9LCpI
	5OftDsNBnxUk3bhMWncBZuXctoE0fo5wqygZUCvFuRPmWHm3lsHjZ89PtfTcyv9r/QB3UUZZw75D3
	05JAzkH8Zr3RqLc8dB38uFBXGWmt8TphidStR6hOQf/jj6lYsEOV79IxD3S2gbhm9MN8EwBOHUmGJ
	PX5evsC79XntvzTE9GuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mppC2-004SSR-Pa; Wed, 24 Nov 2021 10:07:58 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mppBz-004SRW-Q6
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 10:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637748475; x=1669284475;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=arpLo52aBKnSZk5rRWGwLa11R/6I5OAxKmc9Jdo0OIc=;
 b=SFcfnEyYeDTqcOx24k65hebtoJjNg1nOoK9gyTu5BJaT/olYX0o3VPnq
 Pf5Vx8whWPiM63YdHPwl9Al7QILpDxecQ+yh4fzDJf+KMJ0Dv5DakDXKQ
 VGJjHxV8pqlnRvssEjUex3vlmim1hMVgiWfL8O+ta4na+WK8b8new8SAn g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Nov 2021 02:07:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 02:07:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 24 Nov 2021 02:07:51 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 24 Nov
 2021 02:07:50 -0800
Message-ID: <11bd794a-a888-82ee-b933-e54ca4ab9e8e@quicinc.com>
Date: Wed, 24 Nov 2021 18:07:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] ath11k: add read variant from SMBIOS for download
 board data
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>, Mark Herbert <mark.herbert42@gmail.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211118100033.8384-1-quic_wgong@quicinc.com>
 <163759171706.17469.3004620526954131593.kvalo@codeaurora.org>
 <f237c04d-6574-ec9a-ebca-65d2d9ff9edd@gmail.com>
 <871r3883q9.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <871r3883q9.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_020755_893994_2357FFB0 
X-CRM114-Status: GOOD (  10.14  )
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

T24gMTEvMjMvMjAyMSAyOjA2IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IE1hcmsgSGVyYmVydCA8
bWFyay5oZXJiZXJ0NDJAZ21haWwuY29tPiB3cml0ZXM6Cj4KPj4gVHJpZWQgdGhpcyBvbiBEZWxs
IFhQUyAxMyA5MzEwCj4+Cj4+IE1heWJlIHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3IgNjg1NSwgYnV0
IDYzOTAgaW4gRGVsbCBzZWVtcyB0byBiZSBraWxsZWQKPj4gY29tcGxldGVseSB3aXRoIGl0LiBS
ZXZlcnRpbmcgaXQgbWFrZXMgdGhpbmdzIHdvcmsgYWdhaW4uCj4+Cj4+IFvCoMKgwqAgNS41Mzcw
MzRdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIK
Pj4gYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgo+PiBbwqDCoMKgIDUuNTM3MDM4XSBh
dGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZndfdmVyc2lvbiAweDEwMWMwNmNjCj4+IGZ3X2J1aWxk
X3RpbWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkCj4+IFvCoMKgwqAgNS41Mzcy
MzZdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQgZGF0YSBm
b3IKPj4gYnVzPXBjaSxxbWktY2hpcC1pZD0wLHFtaS1ib2FyZC1pZD0yNTUsdmFyaWFudD1ERV8x
OTAxIGZyb20KPj4gYXRoMTFrL1FDQTYzOTAvaHcyLjAvYm9hcmQtMi5iaW4KPj4gW8KgwqDCoCA1
LjUzNzI1NV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZC0y
LmJpbiBvcgo+PiBib2FyZC5iaW4gZnJvbSBRQ0E2MzkwL2h3Mi4wCj4+IFvCoMKgwqAgNS41Mzcy
NTddIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBxbWkgZmFpbGVkIHRvIGZldGNoIGJvYXJkIGZp
bGU6IC0yCj4+IFvCoMKgwqAgNS41MzcyNThdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWls
ZWQgdG8gbG9hZCBib2FyZCBkYXRhIGZpbGU6IC0yCj4gRG9oLCBJIGRpZG4ndCByZWFsaXNlIHRo
YXQuIEkgb25seSB0ZXN0ZWQgdGhpcyBvbiBteSBOVUMgdGVzdGJveCwgSQo+IHNob3VsZCBoYXZl
IHRlc3RlZCB0aGlzIG9uIG15IFhQUyAxMyA5MzEwIGFzIHdlbGwuIFRoYW5rcyBmb3IgdGhlCj4g
cmVwb3J0IQo+Cj4gSSB0aGluayBJIG5lZWQgdG8gcmV2ZXJ0IHRoaXMgYW5kIHJldGhpbmsgaG93
IHRvIGhhbmRsZSB0aGUgYmFja3dhcmRzCj4gY29tcGF0aWJpbGl0eS4KYXRoMTBrIGhhcyBwYXRj
aGVzIHRvIGhhbmRsZSBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBmb3IgdGhpcyBpc3N1ZSwgSSAK
dGhpbmsgYXRoMTFrIGNhbiBhbHNvIGZvbGxvdyBpdC4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2t2YWxvL2F0aC5naXQvY29tbWl0L2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aD9pZD1jODQ4OTY2ODA2NWEyODNkMzAyN2U4NmU4NzdiMTAzYTg3Zjk5ZDIy
CmF0aDEwazogc2VhcmNoIGFsbCBJRXMgZm9yIHZhcmlhbnQgYmVmb3JlIGZhbGxpbmcgYmFjawoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva3ZhbG8vYXRo
LmdpdC9jb21taXQvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoP2lkPTJiYzJiODdiYjM1YTRkN2Iw
MjIwMTY4MTlmYzI4Y2U5ZTJiMTNhZGMKYXRoMTBrOiBhZGQgb3B0aW9uIGZvciBjaGlwLWlkIGJh
c2VkIEJERiBzZWxlY3Rpb24KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
