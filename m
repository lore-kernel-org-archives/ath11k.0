Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA9C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Apr 2022 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vr6c/4PQeXZd52YvIVCn+4bxJPhW2yvg/7D1KYUSoNI=; b=3fIF1HZx0/CIxR
	JQodUiFceU4vcXyNT+fQ35lnEPugC5+18/5V06UhSBPyb4D9upIbHwLt1K25bMTLC6EI70QBMTZSP
	9j6/yxQ+NfXKvhqiBe9TRYn4rwIt82YgYaRZ4qGyuoOhcSbdpjEubnGMuLGZoVj90FJ6ZyilnIvUd
	X9uKNsLUxpXXPuI7ihzMW9ZDC26Gay/sxqDfrh2VwUh0tSU5I2vzlJn8jzm8Lkb4MSBlOTxt2/Ua6
	rkeVRhRmXm1uOh7A20J7crykaOvWPAWpfYXp1EhjZx0kqTqwy+J564dm1xcWLq33P9s6Zymf6qmdf
	Dd0A9/xBbmn4OmgFcD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndjUL-006ALi-Kb; Mon, 11 Apr 2022 02:09:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndjUI-006AJU-At
 for ath11k@lists.infradead.org; Mon, 11 Apr 2022 02:09:07 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KcC0W6PZwzgYZ2;
 Mon, 11 Apr 2022 10:07:07 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 10:08:55 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <quic_cjhuang@quicinc.com>, <quic_bqiang@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, YueHaibing
 <yuehaibing@huawei.com>
Subject: [PATCH] ath11k: Fix build warning without CONFIG_IPV6
Date: Mon, 11 Apr 2022 10:08:43 +0800
Message-ID: <20220411020843.10284-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_190906_579562_FB0310A3 
X-CRM114-Status: UNSURE (   5.14  )
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

ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYzo4MTc1OjEzOiBlcnJvcjog4oCY
YXRoMTFrX21hY19vcF9pcHY2X2NoYW5nZWTigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJy
b3I9dW51c2VkLWZ1bmN0aW9uXQogc3RhdGljIHZvaWQgYXRoMTFrX21hY19vcF9pcHY2X2NoYW5n
ZWQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCiAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgoKV3JhcCBpdCB3aXRoICNpZmRlZiBibG9jayB0byBmaXggdGhpcy4KCkZpeGVz
OiBjM2MzNmJmZTk5OGIgKCJhdGgxMWs6IHN1cHBvcnQgQVJQIGFuZCBOUyBvZmZsb2FkIikKU2ln
bmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKaW5kZXgg
Y2E5OThmYjEzYjYyLi4xOGEyOTk0YjZkODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMWsvbWFjLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9tYWMuYwpAQCAtODE1MSw2ICs4MTUxLDcgQEAgc3RhdGljIHZvaWQgYXRoMTFrX21hY19vcF9z
dGFfc3RhdGlzdGljcyhzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKIAl9CiB9CiAKKyNpZiBJU19F
TkFCTEVEKENPTkZJR19JUFY2KQogc3RhdGljIHZvaWQgYXRoMTFrX2dlbmVyYXRlX25zX21jX2Fk
ZHIoc3RydWN0IGF0aDExayAqYXIsCiAJCQkJICAgICAgIHN0cnVjdCBhdGgxMWtfYXJwX25zX29m
ZmxvYWQgKm9mZmxvYWQpCiB7CkBAIC04MjQ1LDYgKzgyNDYsNyBAQCBzdGF0aWMgdm9pZCBhdGgx
MWtfbWFjX29wX2lwdjZfY2hhbmdlZChzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKIAkvKiBnZW5l
cmF0ZSBucyBtdWx0aWNhc3QgYWRkcmVzcyAqLwogCWF0aDExa19nZW5lcmF0ZV9uc19tY19hZGRy
KGFyLCBvZmZsb2FkKTsKIH0KKyNlbmRpZgogCiBzdGF0aWMgdm9pZCBhdGgxMWtfbWFjX29wX3Nl
dF9yZWtleV9kYXRhKHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LAogCQkJCQkgc3RydWN0IGllZWU4
MDIxMV92aWYgKnZpZiwKLS0gCjIuMTcuMQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
