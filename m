Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34605C4320A
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBBA060FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBBA060FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQM15dMad1vzCgbJipKStyTnehwtImw2iaI+8J6biX8=; b=AxTHkJHKAMGBfO
	KK8wH5zmXOonBMK/dUkzuANDpz8XxD2+vNzReUrQypHq2/U6cCEtivqWmOH7MWMGGvBK+L/7a+sRR
	ul1T3qn3pf0Qg81j/nSruMRguHAqsRPTU5A0ej8bAMDU42CCLPiiZ9Td6CZktRYSJep+hwn4Fbro/
	m6DD7NrNmqgd55NS6G7tfG2oN89KCrfsDpzYoNAJm4vp0hUdC77JDe3VXSqp03CX/OTwU009fN9lV
	oNZTztTFrWr55HeGYsiKZVys587+vSIBJjqhc0c0TMKMYVtNDtI4yxmuz9dTVBoVEeouCwAxrjYxq
	EftfhqezugHqO7gdT/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNN-008Yz9-Vt; Thu, 02 Sep 2021 05:35:01 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfNJ-008YwE-5J
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:35:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560897; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bsGMbyWywydWGJhRTYNtR6DN+KlBZGWOkqhwezkLGG8=;
 b=PW/ZGfilQWtkSKp1faSWqyX31HPG3bruHGJzU9tB/Zcb6daBldmhKWjY8SEm7zJTx065uA9d
 el6A07cxw3AX6c5SABoqj1adDJzOT/PODa1e4VrpLuwnthIBaVrT8P4yAnfTxfZ9QpsJFuCX
 sD1XSpuw+iFrYc1cxnLd4oTTA9Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6130628040d2129ac13af82c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:34:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36B5EC43617; Thu,  2 Sep 2021 05:34:56 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 642EEC4360C;
 Thu,  2 Sep 2021 05:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 642EEC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v3 06/12] ath11k: remove usage quota while processing rx
 packets
Date: Thu,  2 Sep 2021 11:03:34 +0530
Message-Id: <1630560820-21905-7-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223457_304895_9EA706C9 
X-CRM114-Status: GOOD (  12.75  )
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

The usage of quota variable inside ath11k_dp_rx_process_received_packets()
is redundant. Since we would queue only max packets to the list before
calling this function so it would never exceed quota. Hence removing
usage of quota variable.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1d85e10..e105bdc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2523,7 +2523,7 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 						  struct napi_struct *napi,
 						  struct sk_buff_head *msdu_list,
-						  int *quota, int mac_id)
+						  int mac_id)
 {
 	struct sk_buff *msdu;
 	struct ath11k *ar;
@@ -2557,7 +2557,6 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 		}
 
 		ath11k_dp_rx_deliver_msdu(ar, napi, msdu);
-		(*quota)--;
 	}
 
 	rcu_read_unlock();
@@ -2574,7 +2573,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	int total_msdu_reaped = 0;
 	struct hal_srng *srng;
 	struct sk_buff *msdu;
-	int quota = budget;
 	bool done = false;
 	int buf_id, mac_id;
 	struct ath11k *ar;
@@ -2677,8 +2675,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		if (!num_buffs_reaped[i])
 			continue;
 
-		ath11k_dp_rx_process_received_packets(ab, napi, &msdu_list[i],
-						      &quota, i);
+		ath11k_dp_rx_process_received_packets(ab, napi, &msdu_list[i], i);
 
 		ar = ab->pdevs[i].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
@@ -2687,7 +2684,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 exit:
-	return budget - quota;
+	return total_msdu_reaped;
 }
 
 static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
