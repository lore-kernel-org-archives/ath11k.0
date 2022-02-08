Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39046C433EF
	for <ath11k@archiver.kernel.org>; Tue,  8 Feb 2022 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YluUSg03uHrEvNnnds7IYzlFs24ib8eCZcY3D3x5HOk=; b=fl+gT/Tbf++n1P
	NKQAGBIDzZAtGKjejgwGeUkw9Fis1gQ3/WZAatKj7iE363SWvTtJbDkxevTMQcAWUJ/a3QcO6owAs
	/eCTNkWx5DIioWfN/RWr3ebs6h2qD2dMFRXI16LApR2RHy9b2YSdZas3j2uKncWxUuv7EJyd5XLNL
	shC8o8HReX15FdCueFhV6v3x/WYbcEiieTdYtjenjwwMAdrjXmNImHkE8saJPXROEog0nuDG6THp0
	BxIFXQ1dWjEWPKh9QBMBXzsoA4Iz2DHgXfn/XMhs1VOtfAQYZO3mCIHFA+HrC0rquz7KwA31M7Btn
	eWlVt3daT4vjOnImRr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLdB-00Csti-4m; Tue, 08 Feb 2022 08:13:45 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLd9-00CssP-2Z
 for ath11k@lists.infradead.org; Tue, 08 Feb 2022 08:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644308023; x=1675844023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=fH/qgj+dDtRFV8WcMxMiKcWypVJq2rw8EsBnqMfnxbE=;
 b=mC7Hotpjp91wKk76ZUuOhlhnexf9Wgdl6kMq93xne/wcX0pcyYyiIYqk
 YeVG5iJ3VToPpmgkdpkvOXqUedPMTlYUgy8+ID1jM6qDT5/wrsyUKCusK
 +lPPfdV9OUr9WJA5zge1oCSNOedZ2p/VRfaF4yy2qzH2QYfpsKdyWNUq7 w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 00:13:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:13:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:41 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:39 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 3/6] ath11k: implement hardware data filter
Date: Tue, 8 Feb 2022 16:13:23 +0800
Message-ID: <1644308006-22784-4-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_001343_180625_E5EE39FD 
X-CRM114-Status: GOOD (  12.80  )
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

Host needs to set hardware data filter before entering WoW to
let firmware drop needless broadcast/mulitcast frames to avoid
frequent wakeup. Host clears hardware data filter when leaving WoW.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 32 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 15 ++++++++
 drivers/net/wireless/ath/ath11k/wow.c | 55 +++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9ff170493dd0..6fa9659f9c61 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8165,6 +8165,38 @@ void ath11k_wmi_detach(struct ath11k_base *ab)
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
index 9150e0555c6d..4ef1b4f4a743 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5390,6 +5390,19 @@ struct ath11k_wmi_base {
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
@@ -5953,4 +5966,6 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 				    enum wmi_wow_wakeup_event event,
 				    u32 enable);
+int ath11k_wmi_send_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
+				       u32 filter_bitmap, bool enable);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index bef36b244a9f..63577e018518 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -512,6 +512,48 @@ static int ath11k_wow_nlo_cleanup(struct ath11k *ar)
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
@@ -540,6 +582,13 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
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
@@ -608,6 +657,12 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 		goto exit;
 	}
 
+	ret = ath11k_wow_clear_hw_filter(ar);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
+		goto exit;
+	}
+
 exit:
 	if (ret) {
 		switch (ar->state) {
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
