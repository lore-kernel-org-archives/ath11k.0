Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653E2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKkiGDA1uGl02y204ajo//XbsBCyLNbwFnak8meH5YU=; b=f6gWPD0w/v0vz7
	8KorZGWXmd4AE/bDApstiIfTzNTjJrCQXhtMvsfX3usXzKlieikkGMG7gsmjDbgy3FKJ+AZMtE6sJ
	h3imuLGutd5v2K/aPf/7zM+K5BrM31TDX6Hv1IRwsHz3+3g3rm+0+ooM5ZjQYm5D1q015VJHbfTFO
	cGKBXxuAkSl46cLiifrloeEAjtrNbxQhwarv6IQACrylg4w4hKs33791GXT28ypgLAhG327VmC/Cq
	RTC40gX0+7hGI4RDtKOGKvcO/nsxrnuolho/GWO/YENvqGZIrK/AZISCXwdt2XCrn5tSzbouh+PZ3
	7e/EqsncLTnXTt+FxVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA5x-006Hvy-RG; Wed, 20 Jul 2022 13:50:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA5m-006Hji-Q8
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658325022; x=1689861022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmilRMPhLJ3rPLS23qj2er0z3QNu3azRUL1YV2weMiw=;
  b=PUBfaOXkwkw8Nc4SYC6k9dV4hKGj+6Pu0mqJETQ3qkRmq5LvnB5D9GB5
   kXn29z6hfIWxd7l47IJyf9ElnJc39A+f6RU2uZNEJCQlp4EGBVUfXP5ea
   TwsmrjqD1/KYcL0mZ117HzIKgSeaKLFvJwWxvKVb2GQrMj3mCEoJG8qLj
   Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jul 2022 06:50:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:50:21 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:50:20 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 4/4] ath11k: Fix failed to parse regulatory event print
Date: Wed, 20 Jul 2022 19:19:59 +0530
Message-ID: <20220720134959.15688-5-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_065022_927560_38712994 
X-CRM114-Status: GOOD (  12.88  )
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

In the continuous WiFi ON/OFF scenario, we see a lot of
"failed to parse regulatory event" prints on the console.
This is because we already would have created a regulatory
domain for the wiphy and we will discard the subsequent
events to create the same regulatory event.

Fix this error print by freeing up the regulatory resources
in WiFi OFF and create the database again in WiFi ON. The same
applies for hardware recovery as well.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 3 ++-
 drivers/net/wireless/ath/ath11k/reg.c  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2dd51f1ecfd0..a3d6f1b28405 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1210,7 +1210,6 @@ static int ath11k_core_soc_create(struct ath11k_base *ab)
 static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
 	ath11k_debugfs_soc_destroy(ab);
-	ath11k_reg_free(ab);
 	ath11k_qmi_deinit_service(ab);
 }
 
@@ -1532,6 +1531,7 @@ static void ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
+	ath11k_reg_free(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 }
@@ -1929,6 +1929,7 @@ void ath11k_core_stop_device(struct ath11k_base *ab)
 	ath11k_thermal_unregister(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_dp_free(ab);
+	ath11k_reg_free(ab);
 }
 
 int ath11k_core_any_pdevs_on(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 7ee3ff69dfc8..0aa4c7b039d0 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -757,5 +757,7 @@ void ath11k_reg_free(struct ath11k_base *ab)
 	for (i = 0; i < ab->hw_params.max_radios; i++) {
 		kfree(ab->default_regd[i]);
 		kfree(ab->new_regd[i]);
+		ab->default_regd[i] = NULL;
+		ab->new_regd[i] = NULL;
 	}
 }
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
