Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E2AC48BF6
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ttr1Rc6LQgnqCWP+1fX+y357g9rrnweJwnKxC38lcw=; b=BvXGHyKpuh2bEV5nfcUgYGXkiz
	l0m3msUJYhqV8PrSX0+86UFWt2qZ5MkOWQb53x099X9tA3FcaAG/O6xcgmYP3xmFeqiv5T6uZjFR5
	Pnuyw5olIH/pjACwbgRxjYdzGoShiE9aiOj9eS2sNT3aYQ27nnPA1wSGteLjt0ypvXTGkpU9EyenK
	FjjuEGgxSRkwoUgxW5Pp6/Ds5+rV+1vhFYZKYn04H1v6p2xXm4SsfrzSkODnf1qPgkVHtsOvRbJpQ
	uaQTWufqmy/pCPyb9mZzPAqYI5ENeo8ZF3TsSmqwKx1BJBdmZvM9AyO7A1V027tTDhmgxZHANeCuw
	IO4NoyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyV-0000000CiAU-0j3f;
	Thu, 29 Feb 2024 08:41:07 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyR-0000000Ci7D-1Hk0
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 08:41:06 +0000
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:6e01:0:640:627f:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTPS id 129A860B62;
	Thu, 29 Feb 2024 11:40:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id teVSqmLJiW20-6Zz5L67T;
	Thu, 29 Feb 2024 11:40:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1709196056; bh=0Ttr1Rc6LQgnqCWP+1fX+y357g9rrnweJwnKxC38lcw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=fPcJytgmrLEdj4b4RUjGE1QFf2MbLbirXX7ySfLWviSpH9d84PMpWcv4JDZrKDeI/
	 NlE9eu7RmuIm8isWTbIH04HFEcQTM7NKeK4WbMMPmlWIBXqjjbWpNaJK/wvz0efAh+
	 aSaN3+xDLSrJd/2Kr1/STmhI0dLvEVz1fLSM4vfE=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/3] [v2] wifi: ath11k: use ath11k_mac_get_ar_by_pdev_id() consistently
Date: Thu, 29 Feb 2024 11:40:29 +0300
Message-ID: <20240229084031.51957-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <788f1df8-64e1-4b3c-ae8e-00c67be1c3de@quicinc.com>
References: <788f1df8-64e1-4b3c-ae8e-00c67be1c3de@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004103_965010_FDBAFC17 
X-CRM114-Status: UNSURE (   9.93  )
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

Since 'ath11k_mac_get_ar_by_pdev_id()' can return NULL, check
the return value in 'ath11k_wmi_tlv_rssi_chain_parse()' as well
as in 'ath11k_wmi_tlv_fw_stats_data_parse()', and return -EINVAL
in case of error. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: aggregate to the series
---
 drivers/net/wireless/ath/ath11k/wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 34ab9631ff36..2d93e4e78a37 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6498,6 +6498,12 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
 	rcu_read_lock();
 
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "%s: invalid pdev_id %d\n",
+			    __func__, ev->pdev_id);
+		ret = -EINVAL;
+		goto exit;
+	}
 	stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
@@ -6570,6 +6576,12 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 	rcu_read_lock();
 
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "%s: invalid pdev_id %d\n",
+			    __func__, ev->pdev_id);
+		ret = -EINVAL;
+		goto exit;
+	}
 
 	for (i = 0; i < ev->num_pdev_stats; i++) {
 		const struct wmi_pdev_stats *src;
-- 
2.44.0


