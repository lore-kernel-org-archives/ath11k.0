Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108A9C43214
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47E360FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D47E360FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEiYKX78rb9gM6EofGsLyoIxPg4sfDchoMn7d4Bvfec=; b=l8dE+gFVcD8c6t
	qmNi+P7g3lsJkC+RNjJJOESyKQQIsyqiuad3qLetWiqw+K54ilHYHYCwMSR9K+HbBehjSaszD9l0v
	YcUvxORlrkdnTZ3ObrJ4CabKdWBx1vvbQZr23FuzXBN6Iq4W6V1Cmh+pEXA3KjH8jyAMh9VTN0fBj
	UaaKL2Usi9cuOnFDC/RD+1N+nUn7j0ZMSaZp+6dZrKsm5xM6HODSNoUyCAJJscYO1MNaPJRlsfQMX
	BH8+g3q9UTtrR9ziHq+7hYtOxhbwHTPmWx4XNfkuC3csnLjCN6T2YTLJ2D7BPKAFb7ADmtTZOZYi7
	k+8d3KkSIu7lmc3ekj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNK-008Yx8-PA; Thu, 02 Sep 2021 05:34:58 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfNF-008Ytm-GU
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:34:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560893; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cSjpKxnMW2nVzM98G6vYq2CvXAbSsJtK4DM8yThjHEU=;
 b=VL1fcewTCLVo7miyzG+uXz/LqGTgIe74I2hz84qI0tdgZIKDL6jws1Z9Q6eanUHjvWvIZzsZ
 g1hJkV+qSQ4xCOvz86ap5i0aEdsxiedrRj/0XpTLiJ+TgGrwLhaL0JnhObxYz4sNhMynwUbb
 f2vCDfQtV2EGfrq6iL2/Ji9+8vk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6130627a40d2129ac13aebb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:34:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3B4FAC4338F; Thu,  2 Sep 2021 05:34:50 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B70EBC43617;
 Thu,  2 Sep 2021 05:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B70EBC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v3 04/12] ath11k: avoid additional access to
 ath11k_hal_srng_dst_num_free
Date: Thu,  2 Sep 2021 11:03:32 +0530
Message-Id: <1630560820-21905-5-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223453_643006_BBC5A854 
X-CRM114-Status: GOOD (  12.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In ath11k_dp_process_rx(), after processing rx_desc from
ath11k_hal_srng_dst_get_next_entry(), ath11k_hal_srng_dst_num_free()
is accessed everytime because of done flag is not set.

To avoid this additional access to ath11k_hal_srng_dst_num_free(),
increment total_msdu_reaped only when continuation is not set and
update done flag correspondingly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b84c2db..994959b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2623,7 +2623,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				 DMA_FROM_DEVICE);
 
 		num_buffs_reaped[mac_id]++;
-		total_msdu_reaped++;
 
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
 					desc.info0);
@@ -2646,10 +2645,15 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		__skb_queue_tail(&msdu_list, msdu);
 
-		if (total_msdu_reaped >= quota && !rxcb->is_continuation) {
+		if (rxcb->is_continuation) {
+			done = false;
+		} else {
+			total_msdu_reaped++;
 			done = true;
-			break;
 		}
+
+		if (total_msdu_reaped >= budget)
+			break;
 	}
 
 	/* Hw might have updated the head pointer after we cached it.
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
