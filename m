Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A04DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1680560EE2
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1680560EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s0ueaObhswABYUuTMIvGGBHT/ooXzfxzvTxRSAuo5jg=; b=afkJYxWHK6FlbX
	sDLmlOR/ryP80RCU8mkkaWKxJTieZLNg7JCV46HK1B/88WRsiwSKSgA2GPZuGBzjCpddZ8Rj2tLMX
	tylxab84xrEOxytawuMO96WNECIZ/ntg9tf4EvDRrQqKsojjOXaH4/DxRGymFaI4RSdAyonZBzbqk
	x68ljfh5b5DpxAG3ywcmeTLrPnx14Q6vcld8/7sF7t5DnWa6nJMM0DJFR65R4QWZiVhb3jxCYROYb
	m0P4/ef42leIoocioSiC8vg2Ef2xVPXiy21fKOeKjFrcomVGxVtMdJ2ypla+Nxy/cYDWtKnqnci0B
	AvkmlZOmoXzZDc63mwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqkI-008Lkh-As; Mon, 11 Oct 2021 08:33:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqht-008Krv-Ue
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:30:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633941051; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=blLrJgUbz/d2t6DrdFAzGfqMpSyl8BbuJZHTAM6xJOw=;
 b=F0HpvIVrMsmeBn8eVhFe2mMq5q8wW/cTsPv2kH8ySWjHV72TJLicfKRvMhnMveMa0xFor0Hk
 XtZ3IKRR7kluBacPPIKXRsv4SKBmfsIkT+dbtdyHzjJ5WIcZt/d0VwwsBxRWAD7fvDd7sj7V
 IYhCBGkmnTNnUG2YdWYKyOzPEks=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6163f62303355859c8841f41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:30:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 898D0C43460; Mon, 11 Oct 2021 08:30:27 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3534AC4360D;
 Mon, 11 Oct 2021 08:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3534AC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] ath11k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE if NSS ratio
 enabled
Date: Mon, 11 Oct 2021 04:30:20 -0400
Message-Id: <20211011083020.30536-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_013051_782030_C34F8860 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

V2hlbiBOU1MgcmF0aW8gZW5hYmxlZCByZXBvcnRlZCBieSBmaXJtd2FyZSwgU1VQUE9SVFNfVkhU
X0VYVF9OU1NfQlcKaXMgc2V0IGluIGF0aDExaywgbWVhbndoaWxlIElFRUU4MDIxMV9WSFRfRVhU
X05TU19CV19DQVBBQkxFIGFsc28KbmVlZCB0byBiZSBzZXQsIG90aGVyd2lzZSBpdCBpcyBpbnZh
bGlkIGJlY2F1c2Ugc3BlYyBpbiBJRUVFIFN0ZAo4MDIuMTHihKItMjAxNiBhcyBiZWxvdy4KClRh
YmxlIDktMjUx4oCUU3VwcG9ydGVkIFZIVC1NQ1MgYW5kIE5TUyBTZXQgc3ViZmllbGRzLCBpdCBo
YXMgc3ViZmllbGQKVkhUIEV4dGVuZGVkIE5TUyBCVyBDYXBhYmxlLCBpdHMgZGVmaW5pdGlvbiBp
czoKSW5kaWNhdGVzIHdoZXRoZXIgdGhlIFNUQSBpcyBjYXBhYmxlIG9mIGludGVycHJldGluZyB0
aGUgRXh0ZW5kZWQgTlNTCkJXIFN1cHBvcnQgc3ViZmllbGQgb2YgdGhlIFZIVCBDYXBhYmlsaXRp
ZXMgSW5mb3JtYXRpb24gZmllbGQuCgpkbWVzZyBoYXZlIGEgbWVzc2FnZSB3aXRob3V0IHRoaXMg
cGF0Y2g6ClsgMzE0My4xNzc4MTBdIFs1MjA0XSBtYWM4MDIxMTppZWVlODAyMTFfcmVnaXN0ZXJf
aHc6MTI1ODogaWVlZTgwMjExIHBoeTA6IGNvcHlpbmcgc2JhbmQgKGJhbmQgMSkgZHVlIHRvIFZI
VCBFWFQgTlNTIEJXIGZsYWcKSXQgbWVhbnMgbWFjODAyMTEgd2lsbCBzZXQgSUVFRTgwMjExX1ZI
VF9FWFRfTlNTX0JXX0NBUEFCTEUgaWYgYXRoMTFrIG5vdApzZXQgaXQgaW4gaWVlZTgwMjExX3Jl
Z2lzdGVyX2h3KCkuIFNvIGl0IGlzIGJldHRlciB0byBzZXQgaXQgaW4gYXRoMTFrLgoKVGVzdGVk
LW9uOiBXQ042ODU1IGh3Mi4wIFBDSSBXTEFOLkhTUC4xLjEtMDE3MjAuMS1RQ0FIU1BTV1BMX1Yx
X1YyX1NJTElDT05aX0xJVEUtMQoKU2lnbmVkLW9mZi1ieTogV2VuIEdvbmcgPHdnb25nQGNvZGVh
dXJvcmEub3JnPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDExay9tYWMuYwppbmRleCBjNzNiMmRlMTFhZTMuLjRjNTljZWEzNDE3NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYworKysgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCkBAIC00MTIzLDYgKzQxMjMsMTAgQEAgYXRo
MTFrX2NyZWF0ZV92aHRfY2FwKHN0cnVjdCBhdGgxMWsgKmFyLCB1MzIgcmF0ZV9jYXBfdHhfY2hh
aW5tYXNrLAogCXZodF9jYXAudmh0X3N1cHBvcnRlZCA9IDE7CiAJdmh0X2NhcC5jYXAgPSBhci0+
cGRldi0+Y2FwLnZodF9jYXA7CiAKKwlpZiAoYXItPnBkZXYtPmNhcC5uc3NfcmF0aW9fZW5hYmxl
ZCkKKwkJdmh0X2NhcC52aHRfbWNzLnR4X2hpZ2hlc3QgfD0KKwkJCWNwdV90b19sZTE2KElFRUU4
MDIxMV9WSFRfRVhUX05TU19CV19DQVBBQkxFKTsKKwogCWF0aDExa19zZXRfdmh0X3R4YmZfY2Fw
KGFyLCAmdmh0X2NhcC5jYXApOwogCiAJcnhtY3NfbWFwID0gMDsKLS0gCjIuMzEuMQoKCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
