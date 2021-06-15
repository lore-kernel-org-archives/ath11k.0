Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB04C48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F45613D9
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F45613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9/RubDiYZJ0IwC5t8am64Wfs1bkB76ImTlY95WencE=; b=PLhxMdL7FfLvy/
	iJPLyK2SEJeptJ1vkAq58Yp+2SIezM3xAW/YVS4mnEI/FYqvdLGP61pvFznA0RUe9ok2mKOv9Ywod
	0gz+R47ENdkuQTUAhfHGgRYLbA3Snw13iqtIt3dMY86IYJXxnR/GAPdrUR/MkcEC2KNcpOPkPaJQ5
	1lrUTNSXTWcYszdXIxwAdYp7Fme/bD+/G0Tz1Z1nUqlKs1YovPu8JN09J/ENxhLLCQutOuXFAcR1i
	wD3UsWFPfbeCWVAMxAYY2QjJz1ieeYftaVvlx64b7hk0W54chhBRHhw4g1zZtSI+PsgEFQp9gzm5r
	u8CXFUDk7HO7fYVQaFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnl-003fRV-11; Tue, 15 Jun 2021 22:44:57 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOV-00341Y-Qb
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:14:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791688; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=c3q88Knu7cwzY3xC2USw2Q3EdFztRbY4JrUNMSZZP74=;
 b=B++FTgiFWi7CEbvaO2iMob+mMJcg1hnnRtJcf7poxhJu1opoHoQxAEhwTmtn/aXzbFlqtq0J
 iavtivOaieLc91G/VYxL2LXQTQQvu+xBDz5SBJzJMKAWc5A74xuu8ww53yutwqsF4i3ZJ2gF
 CyxTccpkz3lvPPXZ1SafvSuCy0c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c91844e27c0cc77fe131af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AC61CC43460; Tue, 15 Jun 2021 21:14:43 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F31BCC43460;
 Tue, 15 Jun 2021 21:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F31BCC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 06/12] ath11k: remove usage quota while processing rx packets
Date: Wed, 16 Jun 2021 00:14:01 +0300
Message-Id: <20210615211407.92233-7-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141448_255268_B86BA794 
X-CRM114-Status: GOOD (  13.62  )
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

From: P Praneesh <ppranees@codeaurora.org>

The usage of quota variable inside
ath11k_dp_rx_process_received_packets() is redundant. Since we would
queue only max packets to the list before calling this function so it
would never exceed quota. Hence remove use of the quota variable.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 5810110ff519..3ece90d890e5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2528,7 +2528,7 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 						  struct napi_struct *napi,
 						  struct sk_buff_head *msdu_list,
-						  int *quota, int mac_id)
+						  int mac_id)
 {
 	struct sk_buff *msdu;
 	struct ath11k *ar;
@@ -2562,7 +2562,6 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 		}
 
 		ath11k_dp_rx_deliver_msdu(ar, napi, msdu);
-		(*quota)--;
 	}
 
 	rcu_read_unlock();
@@ -2579,7 +2578,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	int total_msdu_reaped = 0;
 	struct hal_srng *srng;
 	struct sk_buff *msdu;
-	int quota = budget;
 	bool done = false;
 	int buf_id, mac_id;
 	struct ath11k *ar;
@@ -2682,8 +2680,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		if (!num_buffs_reaped[i])
 			continue;
 
-		ath11k_dp_rx_process_received_packets(ab, napi, &msdu_list[i],
-						      &quota, i);
+		ath11k_dp_rx_process_received_packets(ab, napi, &msdu_list[i], i);
 
 		ar = ab->pdevs[i].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
@@ -2692,7 +2689,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 					   HAL_RX_BUF_RBM_SW3_BM);
 	}
 exit:
-	return budget - quota;
+	return total_msdu_reaped;
 }
 
 static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
