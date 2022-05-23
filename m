Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F21C433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zFmnuE3n5oOGwMROJCgigctdArzz17529xvhKy/43M=; b=SPHe4xEoS7KP21
	MNSFItZnPWzBQXzuyYsNO18+wuBLuGFXQkAUzPmXaGStPkDzBAR+dqQLHbMcYymq8mLFzpm1caf7D
	bA1e85XZP0IqQmGsMivbniBCD9lIxh0enhGYhrgJ5bSdSrBFUu4tyt/W5Splk8fR+3RDnMdvgoa8A
	ecWHU+xMw9KquKsvVqI6KFDGAf98RXn84i/HWEzL0MVWw6XyNwt2MFoi/9raXjmsp8LEsacYNz6QN
	XinSnGoK1l6WtRdVwK13ehPF+5DpAd1/GSaHCnW8IR+LcwFONRhaoP0lA60YhAXMFLKkRwEC6u9X6
	vHy+SrLqUleKqpii9PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Ub-002Skc-LF; Mon, 23 May 2022 08:32:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ol-002A7b-NQ
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=SYZtd6kbLP5eqlkD9Nn28cDORVEsM1UcG2akq0E0BvM=; b=IOTw/eoZZQr1c7LG+e+2cVk1Gz
 me/FqnTuXrMdsEqdYeVFJKa65uIMaeYlVuop3ltq7DGHg7/TARgB+bLntyYKAblw74NoVrAUV/vXD
 nVmKL9Vcs1hk2JIjnvZPSSM4DZqDLd/ocdYUl+rpqW8gp4egZ606sjHghuIup1kPQJwl/CTsw70L7
 y7kncObM/hea8NArVgpoVcCTNHkBkl5PVAOL/TALEkJ8mrRZqagUg6hjj+kCuGLauNTx6+3d6NKM9
 zQFcoIarvLkkxPmLGcZK8kIfcVQntt4YzxGzuag9n0fp/cQFYh7WqorxowmmfNEp8KP4VgvQhG53a
 rEfvq+gA==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19X-000seF-Fw
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285771; x=1684821771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYZtd6kbLP5eqlkD9Nn28cDORVEsM1UcG2akq0E0BvM=;
 b=EX4djXKdyDH5TLDV4ZTMZ+kfqoNMfdBh20GmNoPqoB69Qb/D3gimsAOI
 mYr8jt9vKF8OTLy17RRRANB3Rtee86ur1sEGW1Knt5wihJWji2+4f/Y9h
 erJezxPkoPcClmkegnUro9Z4x63IJdOs+ZPo5Bn5tKGOrmzuP3HkZexsI 4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:28 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:27 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Subject: [PATCH 6/9] ath11k: configure MBSSID device parameters
Date: Sun, 22 May 2022 23:01:05 -0700
Message-ID: <20220523060108.23982-7-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070252_415678_7E9C6EFF 
X-CRM114-Status: GOOD (  14.83  )
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

Add new field nontransmitting_vif_count in struct ath11k_vif which
keeps track of non-transmitting interfaces associated with a
transmitting interface when MBSSID is enabled.
The count is decremented when WMI vdev down is invoked and incremented
when WMI vdev up is invoked.
Use this field to set the profile index and total profile count during
WMI vdev up operation.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 32 +++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 95bca0b078b1..750dc9b46860 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -357,6 +357,8 @@ struct ath11k_vif {
 #ifdef CONFIG_ATH11K_DEBUGFS
 	struct dentry *debugfs_twt;
 #endif /* CONFIG_ATH11K_DEBUGFS */
+
+	u8 nontransmitting_vif_count;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 32ddb80f4cec..10d35cdfafdb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1421,9 +1421,13 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
 	struct ath11k *ar = arvif->ar;
+	struct ath11k_vif *tx_arvif = NULL;
 	int ret = 0;
 	struct vdev_up_params params = { 0 };
 
+	if (arvif->vif->mbssid_tx_vif)
+		tx_arvif = (void *)arvif->vif->mbssid_tx_vif->drv_priv;
+
 	lockdep_assert_held(&arvif->ar->conf_mutex);
 
 	if (!info->enable_beacon) {
@@ -1433,6 +1437,9 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				    arvif->vdev_id, ret);
 
 		arvif->is_up = false;
+		if (tx_arvif)
+			tx_arvif->nontransmitting_vif_count = 0;
+
 		return;
 	}
 
@@ -1453,6 +1460,13 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = arvif->aid;
 	params.bssid = arvif->bssid;
+	if (tx_arvif) {
+		params.tx_bssid = tx_arvif->bssid;
+		params.profile_idx = info->bssid_index;
+		if (params.profile_idx >= tx_arvif->nontransmitting_vif_count)
+			tx_arvif->nontransmitting_vif_count = params.profile_idx;
+		params.profile_count = tx_arvif->nontransmitting_vif_count;
+	}
 	ret = ath11k_wmi_vdev_up(arvif->ar, &params);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to bring up vdev %d: %i\n",
@@ -2813,7 +2827,7 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
-	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	struct ath11k_vif *arvif = (void *)vif->drv_priv, *tx_arvif;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -2827,6 +2841,11 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 
 	arvif->is_up = false;
+	if (arvif->vif->mbssid_tx_vif) {
+		tx_arvif = (void *)arvif->vif->mbssid_tx_vif->drv_priv;
+		if (tx_arvif != arvif)
+			tx_arvif->nontransmitting_vif_count--;
+	}
 
 	memset(&arvif->rekey_data, 0, sizeof(arvif->rekey_data));
 
@@ -3372,7 +3391,8 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 			ret = ath11k_wmi_send_obss_color_collision_cfg_cmd(
 				ar, arvif->vdev_id, info->he_bss_color.color,
 				ATH11K_BSS_COLOR_COLLISION_DETECTION_AP_PERIOD_MS,
-				info->he_bss_color.enabled);
+				arvif->vif->bss_conf.nontransmitted ?
+				0 : info->he_bss_color.enabled);
 			if (ret)
 				ath11k_warn(ar->ab, "failed to set bss color collision on vdev %i: %d\n",
 					    arvif->vdev_id,  ret);
@@ -6952,7 +6972,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			   int n_vifs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif;
+	struct ath11k_vif *arvif, *tx_arvif;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -7011,6 +7031,12 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 		params.vdev_id = arvif->vdev_id;
 		params.aid = arvif->aid;
 		params.bssid = arvif->bssid;
+		if (arvif->vif->mbssid_tx_vif) {
+			tx_arvif = (void *)arvif->vif->mbssid_tx_vif->drv_priv;
+			params.tx_bssid = tx_arvif->bssid;
+			params.profile_idx = arvif->vif->bss_conf.bssid_index;
+			params.profile_count = tx_arvif->nontransmitting_vif_count;
+		}
 		ret = ath11k_wmi_vdev_up(arvif->ar, &params);
 		if (ret) {
 			ath11k_warn(ab, "failed to bring vdev up %d: %d\n",
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
