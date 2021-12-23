Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E92C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pzGVYiXdUesQcfbR5ronGMg5aUH4mpaY2Equd5kuaFE=; b=3Yi9PF8jGHk4CO
	N8HnzmUt4O1RFRtXkYLnhDuzOFUTJdm3vQuaoN8NXeUykKivbl42udnprCUv2fIbbuuhUOInqFmuB
	9zeJgMUXQY/u+gCW5AwjAvHqbbvBbZcWfFbTZn2S9Ke4+UoQZZOZPOg5VkOyI25trbsWPJHxwdKbJ
	/y7y1KFTi2scMEkt26VQ/yLbn3LO45axTBseKbMQUXAI+vlbHqJKvvAh9yX03F1/GDTt7lXPKcHhB
	SCna1v25fUJTAsZqyF4ONOLY6PIm+lJHvKb9LyUs+A4Rse1IUijj3tGmH7XBeAm2pEyzune/fj014
	8jz+85Ieon7027dUIbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Ic2-00ByRG-PZ; Thu, 23 Dec 2021 07:34:06 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Ibz-00ByQk-Rd
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 07:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640244843; x=1671780843;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=IPgXqOrbVpxh2yy4NDqLsleSLik0IPZuiQ4C/w3cgu4=;
 b=tO56nalUb1Cb81kLT4j0V1VjeCVzIM6LD8OgJpfNvw3MttqIs4TG2CbI
 scrr44BnKgOQ7bqpWwoZEqcOzary0Rqoo3nAP4S1RzijV8ZfyAaJO4Kzi
 SmQxim5UJJNw38oQZIxk8rLX60eHnfCci4RZ85zv2/oNDW9K2uKb5NQpl 4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Dec 2021 23:34:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 23:34:00 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 22 Dec 2021 23:33:59 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 22 Dec 2021 23:33:58 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Refactor the fallback routine when peer create fails
Date: Thu, 23 Dec 2021 13:03:39 +0530
Message-ID: <1640244819-21183-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_233403_953137_283578AB 
X-CRM114-Status: GOOD (  11.68  )
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

When there is an error in peer create process from
ath11k_peer_find(), the code attempts to handle a fallback
for peer create. When this fallback fails, the driver returns
the fallback return code rather than actual error code
(-ENOENT). So refactor the fallback routine to return
the actual error code.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/peer.c | 40 +++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 85471f8..332886b 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -252,7 +252,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 {
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
-	int ret;
+	int ret, fbret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -291,22 +291,8 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
 			    param->peer_addr, param->vdev_id);
 
-		reinit_completion(&ar->peer_delete_done);
-
-		ret = ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
-						      param->vdev_id);
-		if (ret) {
-			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
-				    param->vdev_id, param->peer_addr);
-			return ret;
-		}
-
-		ret = ath11k_wait_for_peer_delete_done(ar, param->vdev_id,
-						       param->peer_addr);
-		if (ret)
-			return ret;
-
-		return -ENOENT;
+		ret = -ENOENT;
+		goto cleanup;
 	}
 
 	peer->pdev_idx = ar->pdev_idx;
@@ -335,4 +321,24 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&ar->ab->base_lock);
 
 	return 0;
+
+cleanup:
+	reinit_completion(&ar->peer_delete_done);
+
+	fbret = ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
+						param->vdev_id);
+	if (fbret) {
+		ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
+			    param->vdev_id, param->peer_addr);
+		goto exit;
+	}
+
+	fbret = ath11k_wait_for_peer_delete_done(ar, param->vdev_id,
+						 param->peer_addr);
+	if (fbret)
+		ath11k_warn(ar->ab, "failed wait for peer %pM delete done id %d fallback ret %d\n",
+			    param->peer_addr, param->vdev_id, fbret);
+
+exit:
+	return ret;
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
