Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BDEC54798
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8PDnHy/+7z0sDz6icCVsb+FrINzU6iAYcCS8mDYRMc=; b=mlfRaMZTfTy1iPwdZU4G/fayiA
	QrksyQL1gkU3WKkorXSKi6XGGSiQh/kMFksiJ58pay0zZDN62UISazGIqLGWVd3E1iHyizlu/0m5s
	Br3keKx9filWw3uqtMelKIWD2i1aSRdy7TlgtTS2KqHUtI4re/kl5F0R6kHZL+BUsqI/WRft5xPHk
	WchL0Dfdw2Z6fqy6qx6IrxfUQrmomGpZoHDF/8fEC8UOCHMbJ9ZIp9chJYATccJzQPSCDMebxxoJ6
	lBBrXEYX34nAN0X1H+5su72bwsqda8he1DHzJEAmGCwikc0L9gzWeuqeO17/4bAhElNW70oKL2v1s
	c+bmuF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyW-0000000CiBB-2vIU;
	Thu, 29 Feb 2024 08:41:08 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyS-0000000Ci7d-47Uo
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 08:41:06 +0000
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:6e01:0:640:627f:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id 2207E608F4;
	Thu, 29 Feb 2024 11:40:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id teVSqmLJiW20-XbXOpn5f;
	Thu, 29 Feb 2024 11:40:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1709196057; bh=Y8PDnHy/+7z0sDz6icCVsb+FrINzU6iAYcCS8mDYRMc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=tKrXytYXXTgBiriEUfIaIKTE08u7e7f7B2KmMrKNrb2l22syKt0nX433X86cjOBJ7
	 qRQKprR8WWG05Im2GIsSlta7h3Xpzc9b+w6sp00Ky1Tb9BeuV4EXKoEcccEYALBYwl
	 6XL+/J0VWmvLuEPCOSJ+4F+PFjEvIBm3fcFqdbJg=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/3] [v2] wifi: ath11k: handle unknown scan state in ath11k_mac_op_remain_on_channel()
Date: Thu, 29 Feb 2024 11:40:30 +0300
Message-ID: <20240229084031.51957-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229084031.51957-1-dmantipov@yandex.ru>
References: <788f1df8-64e1-4b3c-ae8e-00c67be1c3de@quicinc.com>
 <20240229084031.51957-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004105_239460_C116E580 
X-CRM114-Status: UNSURE (   7.96  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In 'ath11k_mac_op_remain_on_channel()', add fallback default to
handle an unknown scan state with -EINVAL. Compile tested only.

Initially found by Linux Verification Center (linuxtesting.org)
with SVACE (and reported as an attempt to use uninitialized
variable).

Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: prefer fallback branch over dummy initializer (Jeff Johnson)
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a6a37d67a50a..47d3d5fd0423 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9224,6 +9224,11 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	case ATH11K_SCAN_ABORTING:
 		ret = -EBUSY;
 		break;
+	default:
+		ath11k_warn(ar->ab, "%s: unexpected scan state: %d\n",
+			    __func__, ar->scan.state);
+		ret = -EINVAL;
+		break;
 	}
 	spin_unlock_bh(&ar->data_lock);
 
-- 
2.44.0


