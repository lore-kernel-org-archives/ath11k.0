Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0777C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlA1mT6L5fuj3e32el/u5O528scoMeCqD0CbNPO+/So=; b=tLq5oX8QA/3fR4
	esebsrnAziWANrsL2e2W0nn9C9J8/7sgeC+lyXlFFhhDof1WpWJoun2vyDawzGk+xIWFjGnGGwNXG
	WQcprXGwOpTk9H3nceZDmu0FG+++hU5EqZsJQDbHtemYrkwKhnqMwt7QC9lJ14DoFMT81wuZyD9bg
	i9SOMEis78tobrB29/qMcC7EhP5CAe5hXKgzxQqji6fK7/2utoqbLX130qu5nUZ/iOxlPfMSTS7L3
	S+UT12K+t9raHLdhpoknAdcTLeF6CarWEnkQ+o7G7B1inv4eiHfc46TZwWB6Dz4FBjKeTVAwMcuMb
	OJ/7s0Tqqer/BG5RGHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2u-00DFc6-0q;
	Fri, 09 Jun 2023 14:24:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2q-00DFY0-1A
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2A756173E
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA87C4339B;
	Fri,  9 Jun 2023 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320691;
	bh=Fl2pPLBw28hP0W9JqhqkFKCzbiCQMgAgej6YusvbAV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bo2HmS6EOv7M1EL297mr0zkGkEfUDXl2OOZJHccThy/0w1ZjgLJ1Wqo4wTsw3bZoS
	 Mt1P9pC9A4poo/MaEy0/K1MWYuxGCu++wJkkR4HqvRdjul5C89wPT86+iP3WpNwgtN
	 K13flDaA5NM3I511qvPbUQ8FGs62ko8X41yamslp6TSZsmk4XsUkaNyl6XR5ulEw8B
	 hDw7LFOY85CqvlGnZ19CV26zHiRjjAfp7mEkOgoIGz1HCORl5LfTrPraIM6WrL9X4F
	 u94E6zmgrAiCgLfkBsvyG3o4TU01quReBZcadgcSw3bziJOmmPHseNuUnNMtiIrn2A
	 elwYw/n2VmF+A==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 07/15] wifi: ath11k: wmi: use common error handling style
Date: Fri,  9 Jun 2023 17:24:32 +0300
Message-Id: <20230609142440.24643-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072452_489600_2F70685F 
X-CRM114-Status: GOOD (  10.65  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Also these functions don't follow the preferred style so fix those.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 80 +++++++++++++++++++--------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3b26e227e80c..972f282a3032 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3181,10 +3181,12 @@ int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id,
 	if (ret) {
 		ath11k_warn(ab, "Failed to send WMI_TWT_ENABLE_CMDID");
 		dev_kfree_skb(skb);
-	} else {
-		ar->twt_enabled = 1;
+		return ret;
 	}
-	return ret;
+
+	ar->twt_enabled = 1;
+
+	return 0;
 }
 
 int
@@ -3211,10 +3213,12 @@ ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
 	if (ret) {
 		ath11k_warn(ab, "Failed to send WMI_TWT_DISABLE_CMDID");
 		dev_kfree_skb(skb);
-	} else {
-		ar->twt_enabled = 0;
+		return ret;
 	}
-	return ret;
+
+	ar->twt_enabled = 0;
+
+	return 0;
 }
 
 int ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
@@ -3266,8 +3270,10 @@ int ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
 			    "failed to send wmi command to add twt dialog: %d",
 			    ret);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
@@ -3303,8 +3309,10 @@ int ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
 			    "failed to send wmi command to delete twt dialog: %d",
 			    ret);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
@@ -3341,8 +3349,10 @@ int ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
 			    "failed to send wmi command to pause twt dialog: %d",
 			    ret);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
@@ -3382,8 +3392,10 @@ int ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
 			    "failed to send wmi command to resume twt dialog: %d",
 			    ret);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int
@@ -3417,8 +3429,10 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 		ath11k_warn(ab,
 			    "Failed to send WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int
@@ -3453,9 +3467,10 @@ ath11k_wmi_pdev_set_srg_bss_color_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3491,9 +3506,10 @@ ath11k_wmi_pdev_set_srg_patial_bssid_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3529,9 +3545,10 @@ ath11k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3567,9 +3584,10 @@ ath11k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3605,9 +3623,10 @@ ath11k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3643,9 +3662,10 @@ ath11k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 		ath11k_warn(ab,
 			    "failed to send WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int
@@ -3688,8 +3708,10 @@ ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
 	if (ret) {
 		ath11k_warn(ab, "Failed to send WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id,
@@ -3722,8 +3744,10 @@ int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id,
 	if (ret) {
 		ath11k_warn(ab, "Failed to send WMI_BSS_COLOR_CHANGE_ENABLE_CMDID");
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_fils_discovery_tmpl(struct ath11k *ar, u32 vdev_id,
@@ -3765,8 +3789,10 @@ int ath11k_wmi_fils_discovery_tmpl(struct ath11k *ar, u32 vdev_id,
 			    "WMI vdev %i failed to send FILS discovery template command\n",
 			    vdev_id);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_probe_resp_tmpl(struct ath11k *ar, u32 vdev_id,
@@ -3818,8 +3844,10 @@ int ath11k_wmi_probe_resp_tmpl(struct ath11k *ar, u32 vdev_id,
 			    "WMI vdev %i failed to send probe response template command\n",
 			    vdev_id);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 int ath11k_wmi_fils_discovery(struct ath11k *ar, u32 vdev_id, u32 interval,
@@ -3853,8 +3881,10 @@ int ath11k_wmi_fils_discovery(struct ath11k *ar, u32 vdev_id, u32 interval,
 			    "WMI vdev %i failed to send FILS discovery enable/disable command\n",
 			    vdev_id);
 		dev_kfree_skb(skb);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 static void
@@ -4122,9 +4152,10 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 	if (ret) {
 		ath11k_warn(ab, "failed to send WMI_INIT_CMDID\n");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int ath11k_wmi_pdev_lro_cfg(struct ath11k *ar,
@@ -4213,9 +4244,10 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 	if (ret) {
 		ath11k_warn(ab, "failed to send WMI_PDEV_SET_HW_MODE_CMDID\n");
 		dev_kfree_skb(skb);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int ath11k_wmi_cmd_init(struct ath11k_base *ab)
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
