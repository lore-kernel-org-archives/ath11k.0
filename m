Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B4C433F5
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 16:04:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F04586023F
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 16:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F04586023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VIep8naDFheOu69ZhUlqjIG8zN/qx/oYJ6+rJ8bYGlU=; b=XM1Eu2Qj1qun2I
	zhf7jVSA+MN9XprktvYQs0rnpwvQE6oMIKUr6GsIhqx0/tD8Yk2jzV1AIVVHpQlEXcI4uKpCkcV0m
	obx9UFjUlGdLhcIZe0n5el4SoNGHlOA+rNnUtMltnZwJVE4RYI9AOYOjzae92XDNa7C6Ja7xBLohe
	Mbs/yG8OLLnmQg09FaFxjAUAzXms3oyXUmye7V5JejmQizidZV2mP8V0hKWQT2w5SbUoukVHQ3URX
	W08A9CpNdYpGuE9m37wHJNKem9AhV0qucMY75SR9jKDnHc/XrB+5aJ1qBD1ZdPsjJ4hFCP7fhJfyb
	lJ+x7O+kXoi9dEX/NfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2SF-00GyGx-S3; Mon, 25 Oct 2021 16:04:07 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2SD-00GyFr-8f
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 16:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635177845; x=1666713845;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=pJT5c83KDeRLLFfz0Qz0svZYTZQIRxLG7zjBLv4uO64=;
 b=NC9+7Tzr0luVE8JAfcDOhs/wqbUSmdzsdo4UQs/QuEU6+y55VzIUfCHb
 LRAcfqwfcZMG4qs80gdtN8dTp7ajjihLtNKvHGIuNNDR2QKfJu9m9JMuU
 WV/HrgLz7c0FBiLytfdpE/YmtZql8g/u3Zsasw6r/Z//1iYG0Fmp+t9Qm w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 09:04:03 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 09:04:03 -0700
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 09:04:01 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>, Lavanya Suresh <lavaks@codeaurora.org>
Subject: [PATCH] ath11k: Clear auth flag only for actual association in
 security mode
Date: Mon, 25 Oct 2021 21:33:06 +0530
Message-ID: <1635177786-20854-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_090405_413359_4BDF3944 
X-CRM114-Status: GOOD (  12.56  )
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

AUTH flag is needed when peer assoc command is sent from host in
security mode for non-assoc cases. Firmware will handle AUTH flag
when client is associating as AUTH flag will be set after key exchange.
For internally provided peer assoc commands from host, there won't be
any key exchange, so AUTH flag is expected to be set in host.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc5560..3ae5193 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2418,6 +2418,7 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 
 	rcu_read_unlock();
 
+	peer_arg.is_assoc = true;
 	ret = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
@@ -3685,6 +3686,7 @@ static int ath11k_station_assoc(struct ath11k *ar,
 
 	ath11k_peer_assoc_prepare(ar, vif, sta, &peer_arg, reassoc);
 
+	peer_arg.is_assoc = true;
 	ret = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
@@ -3896,6 +3898,7 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 			ath11k_peer_assoc_prepare(ar, arvif->vif, sta,
 						  &peer_arg, true);
 
+			peer_arg.is_assoc = false;
 			err = ath11k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 			if (err)
 				ath11k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4..2c940ed 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1762,7 +1762,7 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 		cmd->peer_flags |= WMI_PEER_AUTH;
 	if (param->need_ptk_4_way) {
 		cmd->peer_flags |= WMI_PEER_NEED_PTK_4_WAY;
-		if (!hw_crypto_disabled)
+		if (!hw_crypto_disabled && param->is_assoc)
 			cmd->peer_flags &= ~WMI_PEER_AUTH;
 	}
 	if (param->need_gtk_2_way)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0584e68..f395937 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3617,6 +3617,7 @@ struct peer_assoc_params {
 	u32 peer_he_tx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
 	bool twt_responder;
 	bool twt_requester;
+	bool is_assoc;
 	struct ath11k_ppe_threshold peer_ppet;
 };
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
