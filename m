Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24C6C7EE43
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nab+26c/TLdc4loykoa01F8dHSq0MQLJigBkM575f0A=; b=qTZzwedzUtvBMh
	QdopPNGW6MlCWmtrjDWL0OyVPwQFzDo+xzE8VpuIjxemJvRi29qY66FL9AitKFjxPNAlQ0Lsk0foK
	zhvfR7C1xVtHX7J+Fm5KLsH+XtNeBysCXb1eNuwzkc84cp7swaj95T3ahCzzmWoVvWiMiy377RGVY
	53oMobN2O+CAn/msiZG6ZEQHuIeYOfGcCgo0L7XCUwxJCfh7vrVykFC9ku9AY976+BU+8Dvj9jcN5
	4G/uzavtn3IxkAzLBtyCkucsuMpp0MyWGhRf8d4yDkLaZpv48rDnWYVkSMZXlIZjthGuMvQQqYqKl
	BBAHvhTUbtX8yyQprfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2r-00DFZd-1j;
	Fri, 09 Jun 2023 14:24:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2p-00DFXJ-0O
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1570616E0
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C7EC433EF;
	Fri,  9 Jun 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320690;
	bh=bIXOhkdYQhSQR8JZ30iIBHwinCo/evyXgSHTlkstMps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClblRSdF8vJkfKZWMrdoLmUohHlT3uySzpTv/CfUiqyxp1n2Eg3aAwn7Eyz1vjZd7
	 hlWkGo6pqTZJq2r7FrDf83JXm6p4+nOLSge0yA3GVVutjmraWf8pVbm2G8f9aV5ePc
	 mMwpPBMV6MSJjDrXwy/yC+svwVZ88dzRkAJ5NelEq/6Q/w1EJka7Oa5i948CFTXSGN
	 APES1I0VhoWePVnwGH5UX4GgDATuDR/v5kmbQ/uF9iESxpNNBg3xhPv5PnCcux7aFS
	 39LuSkybmoJeeWFkz7bl4AbeEU7VPrTmfXPrJy0Y9BDvywBBnrMV/4ifEyoHR3+7Aa
	 BM6a43nSNC9Dw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 06/15] wifi: ath11k: wmi: cleanup error handling in ath11k_wmi_send_init_country_cmd()
Date: Fri,  9 Jun 2023 17:24:31 +0300
Message-Id: <20230609142440.24643-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072451_199632_583F63EF 
X-CRM114-Status: GOOD (  10.77  )
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

The error handling doesn't follow the preferred style so fix that.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6ce36879a503..3b26e227e80c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2866,21 +2866,25 @@ ath11k_wmi_send_init_country_cmd(struct ath11k *ar,
 		cmd->cc_info.regdom_id = init_cc_params.cc_info.regdom_id;
 		break;
 	default:
+		ath11k_warn(ar->ab, "unknown cc params flags: 0x%x",
+			    init_cc_params.flags);
 		ret = -EINVAL;
-		goto out;
+		goto err;
 	}
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_SET_INIT_COUNTRY_CMDID);
-
-out:
 	if (ret) {
 		ath11k_warn(ar->ab,
 			    "failed to send WMI_SET_INIT_COUNTRY CMD :%d\n",
 			    ret);
-		dev_kfree_skb(skb);
+		goto err;
 	}
 
+	return 0;
+
+err:
+	dev_kfree_skb(skb);
 	return ret;
 }
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
