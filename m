Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A1C433F5
	for <ath11k@archiver.kernel.org>; Thu, 24 Mar 2022 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rOSxgZ7ijKL8RUI/AKP94HYj9xErt2LWzGpkPG3UBfU=; b=OXBNdBfhCaojoy
	1uTnSzroJ/2C1+QoGRu/KdEtXEBJJU0NV8AdUDGWmiDOabBGAvuDQjgw3vVAVytYh+Hek6ENxDfjT
	zO5KtBTVuhKVGZybFj4Fj4OvFIPNKSsah+GtPaMDQ62S/e3LbbqQVhwhUfmb7Q40AtxPvAvjOImtU
	GjCiL2YiuoMSdsZOEacEKEsPjSve8RBDWT8Qr3MIyv3vnwxizV2KN7LzK6u6UYHA0p4Fpe3lLGIRd
	7KL6iSXlAF9oBokHgPtvWrp2CcM/gSvk15HrruYcKHrIDSNycFKWGF41IAqWwhtaTmIFQWCEdbR9f
	S+Gd96igCfhVA7otgmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXC8D-00FIbK-JD; Thu, 24 Mar 2022 01:19:17 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXC8B-00FIao-73
 for ath11k@lists.infradead.org; Thu, 24 Mar 2022 01:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648084755; x=1679620755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aZaxFGN7wIInQGry0NnfGJUmQpkaYS5NdcbjHX9xLOI=;
 b=zM8Dw4r3qxUqExaDdSY7Q3/S/yW+dkFtq1wRzS3wrL5S63nmkyt4CMmD
 lGZnQUcBZwn4kOUw16vvOQpvR0G6FJvBojMHBggBrOWRT4F2BdJ+loMIR
 T0jG6QpbGcfXMkP+7lO81x4t6odIsxnpHgndNMn9l0bJeVwaFXlIxlfVZ 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 23 Mar 2022 18:19:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 18:19:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 18:19:13 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 18:19:12 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: store and send country code to firmware after
 recovery
Date: Wed, 23 Mar 2022 21:18:56 -0400
Message-ID: <20220324011856.11014-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_181915_312674_BE90CE12 
X-CRM114-Status: GOOD (  11.48  )
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

Currently ath11k does not send the country code to firmware after device
recovery, as a result the regdomain info is reported from firmware by
default. Regdomain info is important, so ath11k also need to restore
it to the value which was used before recovery.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to ath.git ath-202203230912

 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/core.h | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 8 ++++++++
 drivers/net/wireless/ath/ath11k/reg.c  | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 9cfba73b9e22..5243bd0aadb3 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1300,6 +1300,7 @@ static void ath11k_update_11d(struct work_struct *work)
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 		ret = ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
 			ath11k_warn(ar->ab,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 70eb6e418422..a23812617298 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -651,6 +651,7 @@ struct ath11k {
 	int hw_rate_code;
 	u8 twt_enabled;
 	bool nlo_enabled;
+	u8 alpha2[REG_ALPHA2_LEN + 1];
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 34a62933ccd2..9c25c60587ae 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7951,6 +7951,14 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH11K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		if (ar->ab->hw_params.current_cc_support &&
+		    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
+			struct wmi_set_current_country_params set_current_param = {};
+
+			memcpy(&set_current_param.alpha2, ar->alpha2, 2);
+			ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
+		}
+
 		if (ab->is_reset) {
 			recovery_count = atomic_inc_return(&ab->recovery_count);
 			ath11k_dbg(ab, ATH11K_DBG_BOOT,
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 81e11cde31d7..35eb1a0c04dc 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -83,6 +83,7 @@ ath11k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	 */
 	if (ar->ab->hw_params.current_cc_support) {
 		memcpy(&set_current_param.alpha2, request->alpha2, 2);
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 		ret = ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
 			ath11k_warn(ar->ab,

base-commit: d3dc55a0ce389be715ac7d104ee2cc852681e8d1
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
