Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2293EC433F5
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VUu3q6PCLMdVSBD9n+Esc7/0213Bo0fddBpnSJCSJ+8=; b=KusiOOW0tJ/w8i
	5BAokX5fZtwvi/tlJOxMOYrySBBzWwQXex9YVMLCh8j1hmOPdY/dJRAg4S5JVq62kZ8eQQd6+m+tv
	zoYBvZv58GoGNlLbnOz1i+zhQFLIWwh2I3Guxssb8p50qaNzETvcmEX/yAhNlgLpbIpR/b2vTrs45
	KS2D+jVT6dA/Z9GwRJjHd1ySp3QG0pMjckAvaFnSnNuVZlvP4HOzDXIvWXdRsZHPT6jKuzj/0V8qS
	B4IpDFUOeEVeDi5/Z38TbJHyLlW5VtUudbIs87sieKzhcLwjcxYtm+QY0kUHgNN1/gDHFdnwBLc2i
	DG2OaM9g58D2oJLQVr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtRA-001mnw-Qh; Tue, 15 Feb 2022 08:43:52 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtR8-001mlp-1y
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 08:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644914630; x=1676450630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wUfS1QBgvP0sLxhnfiDnevssPUKVFCs+k094FnHVCNY=;
 b=lqzBKcUB9zlWNptz2PwqsTU1v+Oxve+hIPNI6F8vsZAgwRCtNKRGC4Za
 /gruBjlZiLFAPmJkEwpJ4X/fUO7XpS61YYLNrwKuErsON6stcV4uGdEa1
 ics8erV2VUALHbodTLlmcTsNVi2rk/06XwKnXz/h+vjILVNkuaFbOAbF4 M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 00:43:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 00:43:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 00:43:47 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 15 Feb 2022 00:43:45 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH 0/2] Add support to configure 6GHz non-ht duplicate
 transmission
Date: Tue, 15 Feb 2022 14:12:59 +0530
Message-ID: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_004350_179530_B0A45236 
X-CRM114-Status: UNSURE (   5.59  )
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

QSA2R0h6IEFQIGNhbiBkZWNpZGUgdG8gdHJhbnNtaXQgQmVhY29uLCBCcm9hZGNhc3QgcHJvYmUg
cmVzcG9uc2UKYW5kIEZJTFMgZGlzY292ZXJ5IGZyYW1lcyBpbiBhIG5vbi1IVCBkdXBsaWNhdGUg
UFBEVSB3aGVuCm9wZXJhdGluZyBpbiBub24gMjBNSHogQmFuZHdpZHRoIHRvIGVuaGFuY2UgaXRz
IGRpc2NvdmVyYWJpbGl0eS4KKElFRUUgU3RkIDgwMi4xMWF44oCQMjAyMS0yNi4xNy4yLjIpCgpB
ZGQgY2hhbmdlcyB0byBjb25maWd1cmUgNkdIeiBub24tSFQgZHVwbGljYXRlIGJlYWNvbiB0cmFu
c21pc3Npb24KYmFzZWQgb24gRHVwbGljYXRlIEJlYWNvbiBzdWJmaWVsZCBvZiA2R0h6IE9wZXJh
dGlvbiBJbmZvcm1hdGlvbgpmaWVsZCBvZiB0aGUgSEUgT3BlcmF0aW9uIGVsZW1lbnQgaW4gQmVh
Y29uLgoKU2lnbmVkLW9mZi1ieTogUmFtZXNoa3VtYXIgU3VuZGFyYW0gPHF1aWNfcmFtZXNzQHF1
aWNpbmMuY29tPgoKUmFtZXNoa3VtYXIgU3VuZGFyYW0gKDIpOgogIG1hYzgwMjExOiBhZGQgc3Vw
cG9ydCB0byBjb25maWd1cmUgNkcgbm9uLWh0IGR1cGxpY2F0ZSB0cmFuc21pc3Npb24KICBhdGgx
MWs6IGFkZCBzdXBwb3J0IHRvIGNvbmZpZ3VyZSA2RyBub24taHQgZHVwbGljYXRlIHRyYW5zbWlz
c2lvbgoKIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAzOCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay93bWkuaCB8ICA4ICsrKysrKysrCiBpbmNsdWRlL25ldC9tYWM4MDIxMS5oICAgICAgICAg
ICAgICAgIHwgIDEgKwogbmV0L21hYzgwMjExL2NmZy5jICAgICAgICAgICAgICAgICAgICB8IDE3
ICsrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKLS0g
CjIuNy40CgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
