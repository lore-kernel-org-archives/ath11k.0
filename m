Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16736C6377D
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6244611C1
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6244611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrMeUXec5MwpDH2idJZBFLEUnw3RbrlpJspBeAO+QOw=; b=cVzHwGlLJpGfPt
	6j3yOYnlby7605BR9owUAQVmYFXTI2w+MLn8OvBVSLLw3wIdIcBmRvjL0Ry59gse/w3YmWC4/kxuT
	AyTZt/4u8mCiw6Mzfpo4BsD3eyg0ngtiufA8IijrTZLjDYI6TLswgl43Bf7+yQ1qAEveQxT84Lxen
	Pg/e2oI2d2gCdF4NCa4JFhbBe5FoMXG8ob7eAv2E4SltuF7+G9Otu8zceDNO8MSY83MkiO1Z9nVbH
	hwZXQ+6cSAysyuAep8DGrrQwkn8+zT6/6/GWS6Et3L1XnJ+6TyksB3WLk0CeVT9xd5V5yJ8IFkSmD
	txRkGjeDhS8i5X8cbZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JeU-00HIaT-V2; Wed, 21 Jul 2021 21:21:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeQ-00HIMr-N4
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902472; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=l7xcrTU8m14XMQJypurQwvT9aOgURPSR0kG022TbR3U=;
 b=m2NilDM4AYwZ2RBX8qXO5yPTkyR7+LopMn3s9ljyZ7qg3Q/+mlanWUWBh1vNDAJPlJuIkt/n
 GT1G6vZXS3YYmy3hISC+PmgJU5bn9A2gUgq3NqG+UJK97sRhmXhpr9dy/OsHRDisrjIRtce3
 HQxE9eTfVIWNmTCQufnDEwKtWA8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f88fc2b653fbdadd8edfa2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:21:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5A06C43144; Wed, 21 Jul 2021 21:21:05 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 98F11C4314A;
 Wed, 21 Jul 2021 21:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98F11C4314A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Rameshkumar Sundaram <ramess@codeaurora.org>,
 Sathishkumar Muruganandam <murugana@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 10/12] ath11k: Send PPDU_STATS_CFG with proper pdev mask to
 firmware
Date: Thu, 22 Jul 2021 00:20:27 +0300
Message-Id: <20210721212029.142388-10-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142112_439067_6D6AA9DD 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Rameshkumar Sundaram <ramess@codeaurora.org>

HTT_PPDU_STATS_CFG_PDEV_ID bit mask for target FW PPDU stats request
message was set as bit 8 to 15. Bit 8 is reserved for soc stats and
pdev id starts from bit 9. Hence change the bitmask as bit 9 to 15
and fill the proper pdev id in the request message.

Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01092-QCAHKSWPL_SILICONZ-1
Tested on: IPQ6018 hw1.0 WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1

Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")

Co-developed-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
Signed-off-by: Rameshkumar Sundaram <ramess@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 3 ++-
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index b2e7621969c5..522d3a6ce253 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -541,7 +541,8 @@ struct htt_ppdu_stats_cfg_cmd {
 } __packed;
 
 #define HTT_PPDU_STATS_CFG_MSG_TYPE		GENMASK(7, 0)
-#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 8)
+#define HTT_PPDU_STATS_CFG_SOC_STATS		BIT(8)
+#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 9)
 #define HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK	GENMASK(31, 16)
 
 enum htt_ppdu_stats_tag_type {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index b00e78de36bc..125a9a8a5b0a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -906,7 +906,7 @@ int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 		cmd->msg = FIELD_PREP(HTT_PPDU_STATS_CFG_MSG_TYPE,
 				      HTT_H2T_MSG_TYPE_PPDU_STATS_CFG);
 
-		pdev_mask = 1 << (i + 1);
+		pdev_mask = 1 << (ar->pdev_idx + i);
 		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_PDEV_ID, pdev_mask);
 		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK, mask);
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
