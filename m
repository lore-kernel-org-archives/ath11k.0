Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B6C433FE
	for <ath11k@archiver.kernel.org>; Thu, 20 Jan 2022 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuGWxuWr6t8IW5bxo24SCPBitWrwODdtwBB4xkJhZNY=; b=mP73J+uXz/FZKx
	2O4uzimSjaVLx34YD6WjWzvOw+oUrOL3dKAp+PYQesT6YZgyfNaDSSBZqRAYcsNNUoN6INnpK8GXI
	jQyN70i+xJU4v03g+MEg9bOdd+33/xmQ+tqH/w68s5pQbrDFUS+cPlSlSm0eaFCFKORvR44plrOBZ
	OVR5Ja7DXamTl6D5VamhePBjFO1+W/22quAgxsRN+A1xFCV6x+gJsYVew42jQZrvszHNmIjua4g+y
	ogR3zHqvYmfube3HQNW45NKkp9OpFNBhyYrsuxvt2Rhj+2MAz8C4ObZvvQTfxnLGFhILgPnXBTr8Q
	NplHTuwhbTq2NCob4CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUSE-00AaaM-Cb; Thu, 20 Jan 2022 10:14:06 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUSA-00AaXT-Ac
 for ath11k@lists.infradead.org; Thu, 20 Jan 2022 10:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642673642; x=1674209642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=o1zl1icBE+iK6V/7MratuL1LOIKUD7NR7KLnzrUcSTc=;
 b=J927UYOx1o7og/ihxtFO9oHw5OUlc6ufJ8gqf254D2hdO1w5XHI+oPdf
 iPaAt/hYAbAUhUfgPkrX8BEJGQQyR/8Y9jouxD4ZnUPS6Ua2cV6cQ5acn
 +JVsnTDuZ3DvBT9yAo/jWrN+N7TlWG2brfC/whl9RVH66eEd6FePgbfk8 Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jan 2022 02:14:01 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:14:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:14:01 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 02:14:00 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 3/6] ath11k: implement hardware data filter
Date: Thu, 20 Jan 2022 18:13:24 +0800
Message-ID: <1642673607-8896-4-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642673607-8896-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1642673607-8896-1-git-send-email-quic_cjhuang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_021402_449478_DCFD7FF9 
X-CRM114-Status: GOOD (  13.40  )
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
 drivers/net/wireless/ath/ath11k/wmi.c | 32 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 15 ++++++++++
 drivers/net/wireless/ath/ath11k/wow.c | 55 +++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index f3a4181..706dcd8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7670,6 +7670,38 @@ void ath11k_wmi_detach(struct ath11k_base *ab)
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
index 6f997b1..3019882 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5232,6 +5232,19 @@ struct ath11k_wmi_base {
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
@@ -5785,4 +5798,6 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 				    enum wmi_wow_wakeup_event event,
 				    u32 enable);
+int ath11k_wmi_send_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
+				       u32 filter_bitmap, bool enable);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index bef36b2..63577e0 100644
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
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
