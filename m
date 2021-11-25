Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41290C433F5
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNZneKT3SEYSto+U+gT9kmaGWM6GehxcziwU6X4WZDU=; b=qqfv/NZTAFJJ/y
	29dtXhgrXwJ0n8ndq+2BGwmYVkVo77w+WBY0HBsQCzEuy9D6SgB+IXHcqib9ThGlPwHlpmFTBhFmj
	6CKFKAkdP/BxpLDn8OYShB2Z0hBjado3ReGZN2x5cOVZWyRLwSNjeM50c8LAtU+UJ1jNfP06w63+s
	kqG4jNXaLtIHSwx8VmUpnL+LR7Ky5Yej0+wlNrSjp5pe7dGbQhSZocfXwPcumDbnhCU7u2PJ7Eicu
	GD6onqrp9WNDKbOkpr3xQ6umTUWFnAxQ8qmvmKikvh2Q+wwmvv758pPXoL/ka7vtB8FpFbdJGM329
	MIXKOBrnveDUO26YXyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqAXQ-006msw-5N; Thu, 25 Nov 2021 08:55:28 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqAXN-006ms0-OA
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 08:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637830525; x=1669366525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z3g1A+B4HFgN1D6D4RhvKdwkVZPZE8FLFY/pG4A5vP0=;
 b=cx0kAu3qlIh5vNMqhDb8dX3N01kupQTaqGtyNFi1WcW7AUq3wMZoXMSi
 YzxcAzJGDatfJoqR7LOUf4EUZt4unvz3rqzp2fP1ZTPpHPj+FANSS5+ub
 7shKmXqPlFY+PCFQPD2iKfDYAUbpTb7ZTav6DQsyIw7aX5pBXKSinj9x8 4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 00:55:25 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 00:55:25 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 00:55:24 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 25 Nov
 2021 00:55:23 -0800
Message-ID: <312f32ac-0b43-df3e-bb0a-316183cffa9d@quicinc.com>
Date: Thu, 25 Nov 2021 16:55:18 +0800
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
 <871r3883q9.fsf@codeaurora.org> <87fsrl6g7q.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87fsrl6g7q.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_005525_876401_A4145E12 
X-CRM114-Status: UNSURE (   8.73  )
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

SGkgS2FsbGUsCgpJIGhhdmUgc2VudCB2MyBvZiAiYXRoMTFrOiBhZGQgcmVhZCB2YXJpYW50IGZy
b20gU01CSU9TIGZvciBkb3dubG9hZCAKYm9hcmQgZGF0YSIsIGl0IGZpeGVkIHRoZSBiYWNrd2Fy
ZHMgY29tcGF0aWJpbGl0eSBpc3N1ZS4KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC13aXJlbGVzcy9saXN0Lz9zZXJpZXM9NTg1Njk3CgpXZW4gR29uZyAoMik6CiDC
oCBhdGgxMWs6IGFkZCBmYWxsYmFjayBib2FyZCBuYW1lIHdpdGhvdXQgdmFyaWFudCB3aGlsZSBz
ZWFyY2hpbmcgCmJvYXJkLTIuYmluCiDCoCBhdGgxMWs6IGFkZCByZWFkIHZhcmlhbnQgZnJvbSBT
TUJJT1MgZm9yIGRvd25sb2FkIGJvYXJkIGRhdGEKCk9uIDExLzI0LzIwMjEgNTo0NCBQTSwgS2Fs
bGUgVmFsbyB3cm90ZToKPiBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4gd3JpdGVz
Ogo+Cj4+IE1hcmsgSGVyYmVydCA8bWFyay5oZXJiZXJ0NDJAZ21haWwuY29tPiB3cml0ZXM6Cj4+
Cj4+PiBUcmllZCB0aGlzIG9uIERlbGwgWFBTIDEzIDkzMTAKPj4+Cj4+PiBNYXliZSB0aGlzIHBh
dGNoIGlzIGdvb2QgZm9yIDY4NTUsIGJ1dCA2MzkwIGluIERlbGwgc2VlbXMgdG8gYmUga2lsbGVk
Cj4+PiBjb21wbGV0ZWx5IHdpdGggaXQuIFJldmVydGluZyBpdCBtYWtlcyB0aGluZ3Mgd29yayBh
Z2Fpbi4KPj4+Cj4+PiBbwqDCoMKgIDUuNTM3MDM0XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDog
Y2hpcF9pZCAweDAgY2hpcF9mYW1pbHkgMHhiCj4+PiBib2FyZF9pZCAweGZmIHNvY19pZCAweGZm
ZmZmZmZmCj4+PiBbwqDCoMKgIDUuNTM3MDM4XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZndf
dmVyc2lvbiAweDEwMWMwNmNjCj4+PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1
MCBmd19idWlsZF9pZAo+Pj4gW8KgwqDCoCA1LjUzNzIzNl0gYXRoMTFrX3BjaSAwMDAwOjcyOjAw
LjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhIGZvcgo+Pj4gYnVzPXBjaSxxbWktY2hpcC1p
ZD0wLHFtaS1ib2FyZC1pZD0yNTUsdmFyaWFudD1ERV8xOTAxIGZyb20KPj4+IGF0aDExay9RQ0E2
MzkwL2h3Mi4wL2JvYXJkLTIuYmluCj4+PiBbwqDCoMKgIDUuNTM3MjU1XSBhdGgxMWtfcGNpIDAw
MDA6NzI6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJvYXJkLTIuYmluIG9yCj4+PiBib2FyZC5iaW4g
ZnJvbSBRQ0E2MzkwL2h3Mi4wCj4+PiBbwqDCoMKgIDUuNTM3MjU3XSBhdGgxMWtfcGNpIDAwMDA6
NzI6MDAuMDogcW1pIGZhaWxlZCB0byBmZXRjaCBib2FyZCBmaWxlOiAtMgo+Pj4gW8KgwqDCoCA1
LjUzNzI1OF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBsb2FkIGJvYXJkIGRh
dGEgZmlsZTogLTIKPj4gRG9oLCBJIGRpZG4ndCByZWFsaXNlIHRoYXQuIEkgb25seSB0ZXN0ZWQg
dGhpcyBvbiBteSBOVUMgdGVzdGJveCwgSQo+PiBzaG91bGQgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiBt
eSBYUFMgMTMgOTMxMCBhcyB3ZWxsLiBUaGFua3MgZm9yIHRoZQo+PiByZXBvcnQhCj4+Cj4+IEkg
dGhpbmsgSSBuZWVkIHRvIHJldmVydCB0aGlzIGFuZCByZXRoaW5rIGhvdyB0byBoYW5kbGUgdGhl
IGJhY2t3YXJkcwo+PiBjb21wYXRpYmlsaXR5Lgo+IFJldmVydCBzZW50Ogo+Cj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjExMTI0
MDk0MzE2LjkwOTYtMS1rdmFsb0Bjb2RlYXVyb3JhLm9yZy8KPgoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
