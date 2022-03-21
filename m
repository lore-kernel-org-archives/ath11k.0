Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFB1C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkigJozyCWohCD+MBBzkrsbLbeA2UFvsmsNPmoRHHMw=; b=2p512kF7n9cKHz
	WZxVlSRp64qalKBeXBOxkjBr+BtKfpxI9by7HmYGKSUeGtA9bPZQ3Y7r3/jSsWEZFtehTFAR01LIn
	Ln+ZXEpdVNtBDJGUYpGUx5RBIp7EqX5b/s380RrQ3fX71Xkm2JNVaEpYiTkwae0kODbmPyutwtnTR
	+SaJOV5Rr7V8UjSnqrogC49jKEsqpLLUL691Vo4R3nmwWC69oDSIkKQepFFVJdSnbf+eG+wohVk6n
	U40qYKf2i4WB+UjMUlP6l9oT8iEot9mF8ZQMpCVGppsMq/vtjhbXbfpjpkP6Ku8WyPRVAv2mRBmYM
	bppwb7Zt+Cki4bj0y8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGDz-007SUH-Fo; Mon, 21 Mar 2022 11:29:23 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGDw-007STZ-63
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 11:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
 t=1647862160; x=1679398160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NXnb72JWJiCVJ57pbHvb/TTT128gNSl3WOttyM7p2KU=;
 b=SEC1sDQ+yICVEQqADarzbnwIg0z/R3dQfPiQAR+FR4vKlXQDTi8o8VhS
 PyyTiQlOxAMySTuIeZaNH8iphUpLhBc/BTy89297GuqNpHTmz5QLpjEfM
 V8DfC9ANjhgsXR4hGVORz/AqiBlRko715MGzbNDsH1JzGSUZ1nbvPuDQo A=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="170224030"
X-IronPort-AV: E=Sophos;i="5.90,198,1643670000"; d="scan'208";a="170224030"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
 by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:29:15 +0100
Received: from MUCSE812.infineon.com (MUCSE812.infineon.com [172.23.29.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mucxv002.muc.infineon.com (Postfix) with ESMTPS;
 Mon, 21 Mar 2022 12:29:15 +0100 (CET)
Received: from MUCSE804.infineon.com (172.23.29.30) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 21 Mar
 2022 12:29:14 +0100
Received: from MUCSE804.infineon.com (172.23.29.30) by MUCSE804.infineon.com
 (172.23.29.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 21 Mar
 2022 12:29:14 +0100
Received: from MUCSE804.infineon.com ([172.23.29.30]) by MUCSE804.infineon.com
 ([172.23.29.30]) with mapi id 15.02.0986.022;
 Mon, 21 Mar 2022 12:29:14 +0100
From: <Daniel.Shen@infineon.com>
To: <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v2] ath11k: Add support for SAR
Thread-Topic: [PATCH v2] ath11k: Add support for SAR
Thread-Index: AQHYPMqW5EZqF7C2VkGr/W1nvCsgnazJig6AgAAV4yA=
Date: Mon, 21 Mar 2022 11:29:14 +0000
Message-ID: <af9924aaa82b4622bee872c47fdf88a8@infineon.com>
References: <20220321022231.268197-1-quic_bqiang@quicinc.com>
 <164785670143.6138.10862194405307750688.kvalo@kernel.org>
In-Reply-To: <164785670143.6138.10862194405307750688.kvalo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.8.247]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_042920_570967_75C98B0D 
X-CRM114-Status: GOOD (  12.81  )
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

SGkgS2FsbGUsDQoNCkkgdGhpbmsgSSBhbSBub3QgdGhlIHJpZ2h0IHBlcnNvbiB5b3Ugd291bGQg
bGlrZSB0byBzZW5kIHRoaXMgZW1haWwuDQpQbGVhc2UgY2hlY2sgaXQsIEkgcmVjZWl2ZWQgYSBn
cmVhdCBtYW55IG9mIGVtYWlscy4gDQoNClRoYW5rcyBhbmQgYmVzdCB3aXNoZXMNCkRhbmllbCBT
aGVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYWxsZSBWYWxvIDxrdmFs
b0BrZXJuZWwub3JnPiANClNlbnQ6IDIwMjLlubQz5pyIMjHml6UgMTc6NTgNClRvOiBCYW9jaGVu
IFFpYW5nIDxxdWljX2JxaWFuZ0BxdWljaW5jLmNvbT4NCkNjOiBhdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSBhdGgxMWs6IEFkZCBzdXBwb3J0IGZvciBTQVINCg0KQ2F1dGlvbjogVGhpcyBlLW1h
aWwgb3JpZ2luYXRlZCBvdXRzaWRlIEluZmluZW9uIFRlY2hub2xvZ2llcy4gRG8gbm90IGNsaWNr
IG9uIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSB2YWxpZGF0ZSBpdCBpcyBz
YWZlPGh0dHBzOi8vaW50cmFuZXQtY29udGVudC5pbmZpbmVvbi5jb20vZXhwbG9yZS9hYm91dGlu
ZmluZW9uL3J1bGVzL2luZm9ybWF0aW9uc2VjdXJpdHkvdWcvU29jaWFsRW5naW5lZXJpbmcvUGFn
ZXMvU29jaWFsRW5naW5lZXJpbmdFbGVtZW50c19lbi5hc3B4Pi4NCg0KDQoNCkNhdXRpb246IFRo
aXMgZS1tYWlsIG9yaWdpbmF0ZWQgb3V0c2lkZSBJbmZpbmVvbiBUZWNobm9sb2dpZXMuIERvIG5v
dCBjbGljayBvbiBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgdmFsaWRhdGUg
aXQgaXMgc2FmZTxodHRwczovL2ludHJhbmV0LWNvbnRlbnQuaW5maW5lb24uY29tL2V4cGxvcmUv
YWJvdXRpbmZpbmVvbi9ydWxlcy9pbmZvcm1hdGlvbnNlY3VyaXR5L3VnL1NvY2lhbEVuZ2luZWVy
aW5nL1BhZ2VzL1NvY2lhbEVuZ2luZWVyaW5nRWxlbWVudHNfZW4uYXNweD4uDQoNCg0KDQpCYW9j
aGVuIFFpYW5nIDxxdWljX2JxaWFuZ0BxdWljaW5jLmNvbT4gd3JvdGU6DQoNCj4gYXRoMTFrIGFz
c2lnbnMgYXRoMTFrX21hY19vcF9zZXRfYmlvc19zYXJfc3BlY3MgdG8gYXRoMTFrX29wcywgYW5k
IA0KPiB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aGVuIHVzZXIgc3BhY2UgYXBwbGljYXRpb24g
Y2FsbHMgDQo+IE5MODAyMTFfQ01EX1NFVF9TQVJfU1BFQ1MuIGF0aDExayBhbHNvIHJlZ2lzdGVy
cyBTQVIgdHlwZSBhbmQgDQo+IGZyZXF1ZW5jeSByYW5nZXMgdG8gd2lwaHkgc28gdXNlciBzcGFj
ZSBjYW4gcXVlcnkgU0FSIGNhcGFiaWxpdGllcy4NCj4NCj4gVGhpcyBmZWF0dXJlIGlzIGN1cnJl
bnRseSBlbmFibGVkIGZvciBXQ042ODU1Lg0KPg0KPiBUZXN0ZWQtb246IFdDTjY4NTUgaHcyLjAg
UENJIA0KPiBXTEFOLkhTUC4xLjEtMDI0MzEtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRF
LTENCj4NCj4gU2lnbmVkLW9mZi1ieTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVpY2lu
Yy5jb20+DQoNCkJhb2NoZW4gdG9sZCBtZSB0aGlzIGRlcGVuZHMgb24gdGhpcyBwYXRjaDoNCg0K
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNo
LzIwMjExMjI0MDg1MjM2LjkwNjQtMi1xdWljX3dnb25nQHF1aWNpbmMuY29tLw0KDQpCdXQgdGhh
dCBwYXRjaCBpcyBhbHJlYWR5IGRyb3BwZWQgc28gZHJvcHBpbmcgdGhpcyBvbmUgYXMgd2VsbC4N
Cg0KUGF0Y2ggc2V0IHRvIENoYW5nZXMgUmVxdWVzdGVkLg0KDQotLQ0KaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjIwMzIxMDIyMjMx
LjI2ODE5Ny0xLXF1aWNfYnFpYW5nQHF1aWNpbmMuY29tLw0KDQpodHRwczovL3dpcmVsZXNzLndp
a2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNo
ZXMNCg0KLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
