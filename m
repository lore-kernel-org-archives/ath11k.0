Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E8CC04AA5
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+28ms9Ntn9JmWwAh2ebIWRkLhfoiLq3UptbAVQq4sFc=; b=EfbpcyC2EvPAh6
	U3aEu+wVNLjWjDmQN1lh78o65NhNa3G1ndIPogsfw55yqe7rwyQlBaEVHqhMeq+1g1EdttH2uvQM9
	9s4dktxxMphrbgjyUAgdyTEuoqz8uMh3clylOL0IWEvhB0xNGacArpVsKesTpuf9jLJ2JtZ1S8Ui4
	ezQMJYF0w3zTR/BQkb2XaG74Dap5ofnR3Bl8c9CKpxIFRxjTKl65FR2nuCQAvxCJAPpb81ICnQSG/
	YacfQYn/Mnk8eEQSM84DMhmpVPSBmYHlnspHgiFjw0fVA3H88ZWaVcUaBG5bnx6MvVKPW/krq2ogA
	P5x8OQ/CgEPalp2I54iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBh0-00DSjl-WD; Thu, 25 Aug 2022 12:10:39 +0000
Received: from mg01.zyxel.in ([219.87.158.119] helo=mg.unizyx.com.tw)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBgx-00DSUw-3i
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 12:10:36 +0000
X-MailGates: (flag:3,DYNAMIC,RELAY,NOHOST:PASS)(compute_score:DELIVER,40
	,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xsquareiot.com;
	s=tw; t=1661429354; bh=5JwQgb85qqYdnANkRG7rsyfqjZREU9iwU9TbIXwxrKs=;
	l=1290; h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fcB7fWhzYrZ0/YsuSM+ZrOxoI/uMZVDtJZKTsH59caidBWZQRwIdnWarXpEWRQFhe
	 BpBtvL+h016FyB2TeyDr4wze2rZoLkThneZKADciOyrGP+sOQb4/RiFWitwqcQxENw
	 PPPpzfd0d3ljbCIowBNwzkwquQMb0pYABlDuBS4g=
Received: from 172.23.5.6
	by mg01.unizyx.com.tw with MailGates ESMTP Server V5.0(15422:0:AUTH_RELAY)
	(envelope-from <Andy.Huang@xsquareiot.com>); Thu, 25 Aug 2022 20:09:12 +0800 (CST)
Received: from MSTWMBX02.mitrastar.com (172.23.5.6) by MSTWMBX02.mitrastar.com
 (172.23.5.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.2242.4; Thu, 25
 Aug 2022 20:10:29 +0800
Received: from MSTWMBX02.mitrastar.com ([fe80::898d:e8a3:7993:537]) by
 MSTWMBX02.mitrastar.com ([fe80::898d:e8a3:7993:537%16]) with mapi id
 15.01.2242.008; Thu, 25 Aug 2022 20:10:29 +0800
From: =?utf-8?B?QW5keSBIdWFuZy3pu4Pkv4rmrL0=?= <Andy.Huang@xsquareiot.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: About the hostapd support DBDC chip in openwrt router
Thread-Topic: About the hostapd support DBDC chip in openwrt router
Thread-Index: Adi4e2Unsrw5dU0nQueDYUBURxOBAQ==
Date: Thu, 25 Aug 2022 12:10:29 +0000
Message-ID: <947f5ea0373c4e4386d6108605c940a2@xsquareiot.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.5.35]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_051035_464425_ECE8A48B 
X-CRM114-Status: GOOD (  10.65  )
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

SGksDQogICAgUmVjZW50bHkgd2Ugd2FudCB0byB1c2UgV0NONjg1NiBvbiBNVEsgcm91dGVyIHBs
YXRmb3JtIChrZXJuZWwgNS40KSB3aXRoIGF0aDExayBiYWNrcG9ydCAuMTUuOC0xIC4NCkJ1dCB3
ZSBjYW7igJl0IGJyaW5nIHVwIDIgcmFkaW8gaW50ZXJmYWNlcyBjb25jdXJyZW50bHksICBvbmNl
IHdlIGJyaW5nIHVwIHRoZSA1RyBpbnRlcmZhY2UgYXQgZmlyc3QgdGhlbiBnZXQgdGhlIOKAnGRl
dmljZSBidXN54oCdIGVycm9yIG1lc3NhZ2Ugd2hlbiBicmluZyB1cCAyLjRHIHJhZGlvLg0KICAg
ICBCdXQgV0NONjg1NiBpcyBhIERCREMgY2hpcCwgc3VwcG9zZSBJIGNhbiBicmluZyB1cCB0d28g
cmFkaW9zIGluIHRoZSBzYW1lIHRpbWUgZm9yIEFQIG1vZGUuDQogICAgICBJcyBpdCB0aGUgbGlt
aXRhdGlvbiBvZiBkcml2ZXIgb3IgSFcgPyAgVGhhbmtzIGZvciB5b3VyIHRpbWUuDQoNCg0KQmVz
dCwNCkFuZHkNCg0KVGhpcyBlbWFpbCBhbmQgYW55IGZpbGVzIHRyYW5zbWl0dGVkIHdpdGggaXQg
bWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gb2YgWFNxdWFyZSBDb21tdW5pY2F0aW9ucyBDb3Jwb3Jh
dGlvbiB0aGF0IGFyZSBwcml2aWxlZ2VkIC8gY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBzb2xl
bHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gdGhleSBh
cmUgYWRkcmVzc2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgbmFtZWQgYWRkcmVzc2VlIHlvdSBzaG91
bGQgbm90IGRpc3NlbWluYXRlLCBkaXNjbG9zZSwgZGlzdHJpYnV0ZSwgY29weSwgb3IgdXNlIHRo
aXMgZS1tYWlsLiBQbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgZS1tYWls
IGlmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGJ5IG1pc3Rha2UgYW5kIGRlbGV0ZSB0
aGlzIGUtbWFpbCBmcm9tIHlvdXIgc3lzdGVtLg0KLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
