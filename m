Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017C4C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 09:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1A6610A1
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 09:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE1A6610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rn4qSp997tLjPnSUd8hNSwnsSLWg4PH3MbQW9cUsfJY=; b=CXc/3GHh34wiIR
	RW0CeSyhwgibf06PVIjbIY0IMPHdZWXvRgLbl12MoWbvc2tu4z877YtIXxLOUzKVK0B6s0sfNTZsN
	Daj1hP9HT6KyuWRcpWbefBaGl81m9ydWChitYiJVG4UL5r7UaAs2884rm7f2fQABLDgUgwdy0F3f0
	pFAcRJLZrnTtXfzFpg6eUrvDrVe9p3xf6YgMf2TKo5nU/umq92bLVD47ZTExNJQI9gnMc83QTXOmz
	tPv4v6LQqLSWNjqoY8Jyrnsow8dYfD/0tK7xy29fOFU/kJNbE4j8jpZ7oZ8vzDNurVoN0sPkW6c7g
	b9cFJe3AyUI+uYc5VQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maa7e-00FglJ-M8; Wed, 13 Oct 2021 09:00:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYpG-00FP28-Es
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 07:37:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634110644; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=T331kv8nfpiDWeOBK5CAYEwPOwygOjpffPfUOKTozSE=;
 b=jJhD5r4sM+/1jWx3RWp4Hdc7vXpXUaYUwSrX+US6zJ8lSnOgEsRBjbBpVS4yyyoN0FF/ekgg
 8mqJB6zeldAdZilKYOZtKAUyBHDnn//Guxp9IEeeWDQM+X6o71G+7mSSCdrBzo5Y9wnNWJTz
 CI5AKQDigGiMlb0B/oqghlkFQkQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61668ca74ccc4cf2c790d87c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 07:37:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 482BAC43617; Wed, 13 Oct 2021 07:37:11 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7ACBC4360D;
 Wed, 13 Oct 2021 07:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B7ACBC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2] ath11k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE if NSS
 ratio enabled
Date: Wed, 13 Oct 2021 03:37:04 -0400
Message-Id: <20211013073704.15888-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_003724_480705_FD8C3527 
X-CRM114-Status: GOOD (  10.21  )
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
bGlkIGJlY2F1c2Ugc3BlYyBpbiBJRUVFIFN0ZAo4MDIuMTHihKLigJAyMDIwIGFzIGJlbG93LgoK
VGFibGUgOS0yNzMtU3VwcG9ydGVkIFZIVC1NQ1MgYW5kIE5TUyBTZXQgc3ViZmllbGRzLCBpdCBo
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
dXJvcmEub3JnPgotLS0KdjI6IGNoYW5nZSBjb21taXQgbG9nCiAgICAxLiAiSUVFRSBTdGQgODAy
LjEx4oSiLTIwMTYiIC0+ICJJRUVFIFN0ZCA4MDIuMTHihKLigJAyMDIwIgogICAgMi4gIlRhYmxl
IDktMjUxIiAtPiAiVGFibGUgOS0yNzMiCgogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9tYWMuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCmluZGV4IGM3M2IyZGUxMWFlMy4uNGM1OWNlYTM0
MTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCisr
KyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKQEAgLTQxMjMsNiArNDEy
MywxMCBAQCBhdGgxMWtfY3JlYXRlX3ZodF9jYXAoc3RydWN0IGF0aDExayAqYXIsIHUzMiByYXRl
X2NhcF90eF9jaGFpbm1hc2ssCiAJdmh0X2NhcC52aHRfc3VwcG9ydGVkID0gMTsKIAl2aHRfY2Fw
LmNhcCA9IGFyLT5wZGV2LT5jYXAudmh0X2NhcDsKIAorCWlmIChhci0+cGRldi0+Y2FwLm5zc19y
YXRpb19lbmFibGVkKQorCQl2aHRfY2FwLnZodF9tY3MudHhfaGlnaGVzdCB8PQorCQkJY3B1X3Rv
X2xlMTYoSUVFRTgwMjExX1ZIVF9FWFRfTlNTX0JXX0NBUEFCTEUpOworCiAJYXRoMTFrX3NldF92
aHRfdHhiZl9jYXAoYXIsICZ2aHRfY2FwLmNhcCk7CiAKIAlyeG1jc19tYXAgPSAwOwotLSAKMi4z
MS4xCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
