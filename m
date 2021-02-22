Return-Path: <SRS0=2HMb=HY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8707CC433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F7B64DEC
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39F7B64DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6q2fdjiJw4L0fyXo2CLjBDZpU/Esccb6TczVmq+Mq7s=; b=Wj0II2ASj8qs54nwDJzxMXgpij
	0aEEY4EECsbHazUZRvwjdKFCFzPl0OK1qW5wovJty7IcN41eAhT2cSmo2s4NTr70rzczV9BORbx5k
	u0dt+fJQZjQruSMy6nEpT3WTRibaKH21A+Ev3IfLRa4MKYSmuupRmGZTIkCAfYQINL1rEBK1ABuvY
	TAIA04tCjmjXQlcMxd5+/Dzz/zjKr1Anc5oRK8KiHMKTsiqzZlTRoyp4QOp5y1p/D66Vz/vrgh88p
	pLFW5rXrfzQdsNVrLX65KKakYjucFLnQ1pCkB3OxiwSq/w17YvX5frNNSkj9cq2iade6eE2maqB11
	En2DhvmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE8AO-0005I5-Df; Mon, 22 Feb 2021 10:10:12 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE8AJ-0005Ag-1a
 for ath11k@lists.infradead.org; Mon, 22 Feb 2021 10:10:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613988609; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QeThCgQqPa6HbWJQokbkefJAUSQg1jKYIIaZj1q3QnE=;
 b=C3EoqrHYvqwkgNYrBxY2h4f4l/oTEIgtxFCU3lwvQcgU+lNS1w02TGFW/CgDcf8eLgWEJVU3
 i1aejwyFLy7EufEnDnFcWAkv6szMNtcA8dy9r6QYR8E4OSi+zLRa5JlFiIqqBdpcuty+HMCl
 AYooKwZ6RrLt/VsAjaleAyxb87Q=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 603382eaba08663830b1cd00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 10:09:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0907C43465; Mon, 22 Feb 2021 10:09:46 +0000 (UTC)
Received: from ssreeela-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E25EC43461;
 Mon, 22 Feb 2021 10:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E25EC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 3/3] ath11k: Add support for beacon tx mode
Date: Mon, 22 Feb 2021 15:39:33 +0530
Message-Id: <1613988573-10839-4-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org>
References: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_051009_558758_2218E708 
X-CRM114-Status: GOOD (  14.52  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add support to configure the beacon tx mode in
the driver.

Use the below configuration in the hostapd/wpa_supplicant
for AP/MESH mode to configure the beacon tx mode.

"beacon_tx_mode=N", where N = 1 for STAGGERED beacon mode
and N = 2 for BURST beacon mode.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00480-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b391169..94239cf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2062,7 +2062,10 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
-		param_value = WMI_BEACON_STAGGERED_MODE;
+		if (info->beacon_tx_mode == NL80211_BEACON_BURST_MODE)
+			param_value = WMI_BEACON_BURST_MODE;
+		else
+			param_value = WMI_BEACON_STAGGERED_MODE;
 		ret = ath11k_wmi_pdev_set_param(ar, param_id,
 						param_value, ar->pdev->pdev_id);
 		if (ret)
@@ -2070,8 +2073,9 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id);
 		else
 			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
-				   "Set staggered beacon mode for VDEV: %d\n",
-				   arvif->vdev_id);
+				   "Set %s beacon mode for VDEV: %d mode: %d\n",
+				   param_value ? "burst" : "staggered",
+				   arvif->vdev_id, param_value);
 
 		ret = ath11k_mac_setup_bcn_tmpl(arvif);
 		if (ret)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
