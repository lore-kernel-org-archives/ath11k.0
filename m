Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC43C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTUhjCl7vTjfFQB6jzIm5ow3imqEsZscywVDmGWu43g=; b=WcvHYE+Qha3qrR
	sLW8UKRNFp/IW2r19JtvuSI7GS390ihgFl5KZRdi6x2DQso1EULOc4myYFkpZWQq7L4M2jhZGIvDy
	dVOM8vQAvyRxVpxi7BXVXwvdpfRuDNL5qtQo816m4Li4DmqShX8HO52cjE3dqQBVade19B4goOO2K
	vgwFJiDnfsQhuQP0tHffZCbV8/aHxkCcgt9XiDJ7EfEFJkx7eeLcJ3kTWp3lLq/hKv9fLL1ei6RdH
	eTFaupP+GkoSUCby4AjjpWi4Cqzf3M0Dxx1W1KMU/ECTxhhKghl7yKHEkSITWHPhNDC1MtWlFq6QL
	aiREEJtmWTcBaGWsioqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoD8-004tWf-SD; Thu, 16 Dec 2021 10:42:06 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoD5-004tVK-KU
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 10:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639651323; x=1671187323;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ce6TWqHLh9socF/wU+/riY2KrQOak3CF37lCpR67frU=;
 b=HhCIO0s9pMsmtj6DurILWD/vsCZVh/R35YTYJ7XTpKWW6oMpfXQsNMEj
 yPbUaN1hnpdG95I0P1fs4xr0CoDCMYU6g4Wh78V1OaPIpjHdlCw/bE2gx
 GOSW/dmO8xy5996bpwPdMARxKUYoDMA90SOc3gcAJMTsDfjOiQcbY98S4 c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Dec 2021 02:42:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 02:41:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 16 Dec 2021 02:41:59 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 16 Dec
 2021 02:41:58 -0800
Message-ID: <2aecb0d6-6710-d460-4505-0594ae7a55a2@quicinc.com>
Date: Thu, 16 Dec 2021 18:41:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] ath11k: report tx bitrate for iw wlan station dump
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211213102723.4857-1-quic_wgong@quicinc.com>
 <87y24ngjaa.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87y24ngjaa.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_024203_725898_80150912 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTIvMTUvMjAyMSAxOjU4IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IFdlbiBHb25nIDxxdWlj
X3dnb25nQHF1aWNpbmMuY29tPiB3cml0ZXM6Ci4uLgo+IEkgYnJpZWZseSB0ZXN0ZWQgdGhpcyBh
bmQgdHggcmF0ZSBkaWRuJ3QgbG9vayBjb3JyZWN0IHRvIG1lOgo+Cj4gJCBpdyB3bGFuMCBsaW5r
Cj4gQ29ubmVjdGVkIHRvIHh4IChvbiB3bGFuMCkKPiAJU1NJRDogPGNlbnNvcmVkPgo+IAlmcmVx
OiAyNDQyCj4gCVJYOiA4ODM4IGJ5dGVzICg4MCBwYWNrZXRzKQo+IAlUWDogMTU1MSBieXRlcyAo
MTUgcGFja2V0cykKPiAJc2lnbmFsOiAtMTA0IGRCbQo+IAlyeCBiaXRyYXRlOiAzOS4wIE1CaXQv
cyBNQ1MgNAo+IAl0eCBiaXRyYXRlOiAodW5rbm93bikgTUNTIDI1MwpZZXMsIEkgcmVwcm9kdWNl
ZCB0aGlzIHN0cmFuZ2UgdHggYml0cmF0ZSB2YWx1ZSBhZnRlciB0cnkgd2l0aCAzIEFQLgpBUDE6
IHR4IGJpdHJhdGU6wqDCoMKgwqAgMTQ0LjQgTUJpdC9zIFZIVC1NQ1MgNyBzaG9ydCBHSSBWSFQt
TlNTIDIKQVAyOiB0eCBiaXRyYXRlOsKgwqDCoMKgIDI4Ni43IE1CaXQvcyBIRS1NQ1MgMTEgSEUt
TlNTIDIgSEUtR0kgMCBIRS1EQ00gMApBUDM6IHR4IGJpdHJhdGU6wqDCoMKgwqAgKHVua25vd24p
IE1DUyAyNTQKSSB3aWxsIGNoZWNrIGl0Lgo+Cj4gSSBndWVzcyB0aGUgc2lnbmFsIGlzbid0IGNv
cnJlY3QgZWl0aGVyLCBhcmUgeW91IHBsYW5uaW5nIHRvIGZpeCBpdCBhbHNvCj4gYXQgc29tZSBw
b2ludD8KSSBoYXZlIHNlbnQgcGF0Y2ggdG8gZml4IHNpZ25hbDoKW3YyXSBhdGgxMWs6IGFkZCBz
aWduYWwgcmVwb3J0IHRvIG1hYzgwMjExIGZvciBRQ0E2MzkwIGFuZCBXQ042ODU1Cmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIxMTIx
NjA3MDUzNS4zMTczMi0xLXF1aWNfd2dvbmdAcXVpY2luYy5jb20vCgpUaGUgbmV3IHNpZ25hbCB2
YWx1ZSBvZiAiaXcgd2xhbiBzdGF0aW9uIGR1bXAiOgogwqDCoMKgwqDCoMKgwqAgc2lnbmFsOsKg
wqDCoMKgwqDCoMKgwqAgLTUwIFstNTEsIC01NV0gZEJtCj4gQWxzbyBJIHNlZSBuZXcgd2Fybmlu
Z3Mgd2l0aCB0aGlzIHBhdGNoOgo+Cj4gWyAgMTc0LjM3MzkwNV0gYXRoMTFrX3BjaSAwMDAwOjA2
OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTc0LjM4NjMwM10g
YXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0
Cj4gWyAgMTc0LjM4ODczM10gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5k
IHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTc0LjQ3MjcyM10gYXRoMTFrX3BjaSAwMDAwOjA2OjAw
LjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTc0LjU3MzMzMV0gYXRo
MTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4g
WyAgMTc0LjgzODIzNF0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRo
ZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTc0Ljg4MTU3N10gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6
IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTc0Ljk4NTY0MF0gYXRoMTFr
X3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAg
MTc1LjA3NjE1NF0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBw
ZWVyIGJ5IGlkIDE0Cj4gWyAgMTc1LjExMzkyMV0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGZh
aWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4gWyAgMTgwLjIwNjM3OF0gYXRoMTFrX3dh
cm46IDM0IGNhbGxiYWNrcyBzdXBwcmVzc2VkCj4gWyAgMTgwLjIwNjM5Nl0gYXRoMTFrX3BjaSAw
MDAwOjA2OjAwLjA6IGZhaWxlZCB0byBmaW5kIHRoZSBwZWVyIGJ5IGlkIDE0Cj4KCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
