Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6AD60E05
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC6AD60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqqrnZ/6B59DbExBJVufnJInIkAmOrL/Rvw2Qcdtfn0=; b=emACq6q0dUlNZ7
	lt/yQULINDH4fPnH6S+KTHu8307Ycf7vtLkr4UB2vddU13TjPoDvMU1RRZHCUZk9N7vYHFoEe8TwP
	wJ4kY6X3Cko/ABfcOqnhSTa4wDI0SQQsE8gNEJ4LiwN1usR+0nvwXOAR0QIwpKWZxf6RRgT2iYpsz
	7oa1nNGx5ndFJGr3D2fvfoDo1Q/jM61SPQjTq5+QL310QYGzidVG2bqGEcA03TQottnVP8QL0jxDW
	bCvp1sMaPHtXOG7q/L8Iqsiy9YMEKKa6pbKa85kgIOgsh2U/vjlpmzKu60iYonML5C1V75xP779Ku
	GHdBiyAHHL2FVa7vZ5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZtjA-009AMh-Vt; Mon, 11 Oct 2021 11:44:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtcu-0097bV-CK
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 11:37:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633952276; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4m4L7rzhSuWR0C4WClTZFH5QOYDfAt/iDpCC9ehNhZU=;
 b=eVOseMJhWDWknaBmp/KlS0fmstEdhqBcI4b55gcsWeK/hKtvT5iIhnJeaLAmGN3ulLrZUauf
 ViAx8uHVxs67jQ+oHoRdkhRjgU+OR4xm5LoIzAiS2L9lWq5RIVTOXPqvWoHW6IZB2NuP4OtV
 aC21Wc7qBZOa8IhAXZLXjFNwA+o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 616421f922fe3a98e5af0bde (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 11:37:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 75E25C4360C; Mon, 11 Oct 2021 11:37:28 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29745C4338F;
 Mon, 11 Oct 2021 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 29745C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/6] ath11k: implement hw data filter
Date: Mon, 11 Oct 2021 15:37:47 -0400
Message-Id: <20211011193750.4891-4-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011193750.4891-1-cjhuang@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_043756_746010_BF3AB668 
X-CRM114-Status: GOOD (  15.41  )
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

Host needs to set hw data filter before entering WoW to
let firmware drop needless bc/mc frames to avoid frequent wakeup.
Host clears hw data filter when leaving WoW.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 32 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 15 +++++++++
 drivers/net/wireless/ath/ath11k/wow.c | 57 ++++++++++++++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9f466fe..be880dc 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8348,6 +8348,38 @@ void ath11k_wmi_detach(struct ath11k_base *ab)
 	ath11k_wmi_free_dbring_caps(ab);
 }
 
+int ath11k_wmi_send_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
+				       u32 filter_bitmap, bool enable)
+{
+	struct wmi_hw_data_filter_cmd *cmd;
+	struct sk_buff *skb;
+	int len;
+
+	len = sizeof(*cmd);
+	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
+
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_hw_data_filter_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_HW_DATA_FILTER_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+
+	cmd->vdev_id = vdev_id;
+	cmd->enable = enable;
+	/* Set all modes in case of disable */
+	if (cmd->enable)
+		cmd->hw_filter_bitmap = filter_bitmap;
+	else
+		cmd->hw_filter_bitmap = ((u32)~0U);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi set hw filter enable %d, filter_bitmap:0x%x\n",
+		   enable, filter_bitmap);
+
+	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+}
+
 int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 {
 	struct wmi_wow_host_wakeup_ind *cmd;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 6d3dfb9..1301b17 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5400,6 +5400,19 @@ struct ath11k_wmi_base {
 	struct ath11k_targ_cap *targ_cap;
 };
 
+/* Definition of HW data filtering */
+enum hw_data_filter_type {
+	WMI_HW_DATA_FILTER_DROP_NON_ARP_BC = BIT(0),
+	WMI_HW_DATA_FILTER_DROP_NON_ICMPV6_MC = BIT(1),
+};
+
+struct wmi_hw_data_filter_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 enable;
+	u32 hw_filter_bitmap;
+} __packed;
+
 /* WOW structures */
 enum wmi_wow_wakeup_event {
 	WOW_BMISS_EVENT = 0,
@@ -5956,4 +5969,6 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 				    enum wmi_wow_wakeup_event event,
 				    u32 enable);
+int ath11k_wmi_send_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
+				       u32 filter_bitmap, bool enable);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 839c58e7..35f1c5c 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -507,6 +507,48 @@ static int ath11k_wow_nlo_cleanup(struct ath11k *ar)
 	return 0;
 }
 
+static int ath11k_wow_set_hw_filter(struct ath11k *ar)
+{
+	struct ath11k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath11k_wmi_send_hw_data_filter_cmd(ar, arvif->vdev_id,
+							 WMI_HW_DATA_FILTER_DROP_NON_ICMPV6_MC |
+							 WMI_HW_DATA_FILTER_DROP_NON_ARP_BC,
+							 true);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to set hw data filter on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ath11k_wow_clear_hw_filter(struct ath11k *ar)
+{
+	struct ath11k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath11k_wmi_send_hw_data_filter_cmd(ar, arvif->vdev_id, 0, false);
+
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to clear hw data filter on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan)
 {
@@ -535,6 +577,13 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ret = ath11k_wow_set_hw_filter(ar);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set hw filter: %d\n",
+			    ret);
+		goto cleanup;
+	}
+
 	ret = ath11k_wow_enable(ar->ab);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start wow: %d\n", ret);
@@ -598,8 +647,14 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 	}
 
 	ret = ath11k_wow_nlo_cleanup(ar);
-	if (ret)
+	if (ret) {
 		ath11k_warn(ar->ab, "failed to cleanup nlo: %d\n", ret);
+		goto exit;
+	}
+
+	ret = ath11k_wow_clear_hw_filter(ar);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
 
 exit:
 	if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
