Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15362C7EE25
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN5NhgS/Jp9DbGWGJierRw0XVtIZNb2b+kO/opLbDWI=; b=Nc6pkQWnoQXhe6
	p/I9phj63K35puDwPNW0Ef7qIP9q6QqDRK9hY3AgeGBZnQPLsf9KMhm5Gu1rYq4HXptmpgQzdwKly
	i8E5M4JjLfNmJowUCvofx9yTtdncsV6B4WHdr2nUQ7bUFfLOuxKgtsMTKqw1U8ryCMrJ0jv7OlLAy
	wUQPvGJXLCGC0+FVsApChUmSLzoV2hCuuY2k0gELl0eIYOV0fXT3ba9mMRufJKSAJy5VHQR1xIGSa
	DxreNxoJJHfAIc0Qf8gv+GcKpUQo2D/hOSgTMeKxsZIsNU5uwiApFyHEa/vhfJM12Pch7kh+7F9SE
	ltFy6pbp0+SEcCLG5zGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2q-00DFYV-1r;
	Fri, 09 Jun 2023 14:24:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2o-00DFWu-0q
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5F9F65882
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D91FC4339B;
	Fri,  9 Jun 2023 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320689;
	bh=w9jTiH5RnEdZVrbY21BlNuf+p+Weoy31ragwGttVmC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TBlh3kZOaR8fe+jV7yi4wtiAivSjWbFfdPS6WuYUaleuAIyy5RJt4tV5PE/5/Eik6
	 QxtMCqxlT1JE3he7EuvRsJKu4pnYkYNan6kowY+UpQOcL+XdO+nFC9XlRUbEs3ZVMF
	 iamZdBNeYuttJ9nvSRhaGoAHvwspIlli1OjF5tEC8WXsbSExzUfp2xIRr4pCg2trk+
	 WmWmLS0GihVwQgh+0lVGw+787hGY4SbGQXIVd70DOsy1Gj9JpYUYu6xpeTzMPQzTgO
	 iv1YPmKn+PABV18QPkfmPNxzPu3CHeUvrWSIjQIhfNaztjd/KA0EwKLLVrkqbj7M2f
	 bDh5RTrxWdYAg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 05/15] wifi: ath11k: remove unsupported event handlers
Date: Fri,  9 Jun 2023 17:24:30 +0300
Message-Id: <20230609142440.24643-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072450_334525_CA6C11EE 
X-CRM114-Status: GOOD (  10.75  )
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

Now that we have a default handler there's no need anymore to list every
unsupported event id anymore, so remove that to clean this up.

While at it remove the pointless todo comment and change the debug message to
follow the preferred style.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 99beb7636835..6ce36879a503 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8663,19 +8663,6 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_TWT_ADD_DIALOG_EVENTID:
 		ath11k_wmi_twt_add_dialog_event(ab, skb);
 		break;
-	/* add Unsupported events here */
-	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
-	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
-	case WMI_TWT_ENABLE_EVENTID:
-	case WMI_TWT_DISABLE_EVENTID:
-	case WMI_TWT_DEL_DIALOG_EVENTID:
-	case WMI_TWT_PAUSE_DIALOG_EVENTID:
-	case WMI_TWT_RESUME_DIALOG_EVENTID:
-	case WMI_PDEV_DMA_RING_CFG_RSP_EVENTID:
-	case WMI_PEER_CREATE_CONF_EVENTID:
-		ath11k_dbg(ab, ATH11K_DBG_WMI,
-			   "ignoring unsupported event 0x%x\n", id);
-		break;
 	case WMI_PDEV_DFS_RADAR_DETECTION_EVENTID:
 		ath11k_wmi_pdev_dfs_radar_detected_event(ab, skb);
 		break;
@@ -8697,9 +8684,8 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath11k_wmi_gtk_offload_status_event(ab, skb);
 		break;
-	/* TODO: Add remaining events */
 	default:
-		ath11k_dbg(ab, ATH11K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
+		ath11k_dbg(ab, ATH11K_DBG_WMI, "unsupported event id 0x%x\n", id);
 		break;
 	}
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
