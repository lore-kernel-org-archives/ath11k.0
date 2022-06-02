Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192E6C433EF
	for <ath11k@archiver.kernel.org>; Thu,  2 Jun 2022 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9m1ZHAcfhJokgqSA9+a4en2Y94RutEgy387MHj4KlrI=; b=HzohmEiq10kGoC
	W4CqMXdYpUMVZEJt2etsFjonU9ztBmwlZLUxHwfZuH3JvnClk9kHIBUv0WVC5WRK3N0RKIlqlqNi6
	24gG/nBUR1UuhKLwJUXO+Dnabxx+gb7aaOUVHCY47X6q0UQi4K10gruwiHV4lc9WlBcecGNheN5O7
	/jilvzmTQZftTuAjFH1mEKhZWcmslBO7Ab2pOdaLqMTfEqUmptaXT8zCne1GFRuy7nJXojEWJ8FZq
	SIeRERMcRvZLqaXsXJd/n1hu+80oC3yh5zNWqtXw1Uw1xrowrwN6xwYUGr5LeMKqzHBswom0cMLj+
	ZDE6oPSnx/h7yh8z1mZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkeW-003LXK-3g; Thu, 02 Jun 2022 13:14:16 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkeT-003LWd-9p
	for ath11k@lists.infradead.org; Thu, 02 Jun 2022 13:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654175653; x=1685711653;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vJcXBskslpghKa6iRYrdfqEqjidM0JWM2EfBfNovq7s=;
  b=Z6jtiN84kZUX7oNd8iRX8c9n9wEuN/WAohEQjzeJrrwDw5XI5QYlg2Xb
   rn4VUaoqMS1yOLqYkZSBG6PSgjdlVMxQjyfamyFHhOGV4o08piqUUvddG
   731xGbNGKCpyl/JgvmPp8BZ7JBABnLRlpuUHzcj4oxQPljqnAra3VA1Sf
   A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 06:14:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 06:14:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 06:14:08 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 06:14:06 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Fix warnings reported by checkpatch
Date: Thu, 2 Jun 2022 18:43:50 +0530
Message-ID: <20220602131350.29486-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_061413_426561_D995B2D4 
X-CRM114-Status: GOOD (  15.03  )
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

Fix warnings reported by checkpatch tool. Below are the errors fixed,

drivers/net/wireless/ath/ath11k/hal_rx.c:760: 'recevied' may be misspelled - perhaps 'received?
drivers/net/wireless/ath/ath11k/qmi.c:2232: Prefer strscpy over strlcpy
drivers/net/wireless/ath/ath11k/qmi.c:2238: Prefer strscpy over strlcpy
drivers/net/wireless/ath/ath11k/qmi.c:2662: Prefer strscpy over strlcpy
drivers/net/wireless/ath/ath11k/mac.c:7836: 'atleast' may be misspelled - perhaps 'at least'?
drivers/net/wireless/ath/ath11k/wmi.c:6566: 'succeded' may be misspelled - perhaps 'succeeded'?

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 2 +-
 drivers/net/wireless/ath/ath11k/mac.c    | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c    | 6 +++---
 drivers/net/wireless/ath/ath11k/wmi.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 4bb1fbaed0c9..7f39c6fb7408 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -757,7 +757,7 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 
 	/* TODO: HW queue descriptors are currently allocated for max BA
 	 * window size for all QOS TIDs so that same descriptor can be used
-	 * later when ADDBA request is recevied. This should be changed to
+	 * later when ADDBA request is received. This should be changed to
 	 * allocate HW queue descriptors based on BA window size being
 	 * negotiated (0 for non BA cases), and reallocate when BA window
 	 * size changes and also send WMI message to FW to change the REO
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f11956163822..ea1b6c6feee3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7833,7 +7833,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	he_ltf = mask->control[band].he_ltf;
 
 	/* mac80211 doesn't support sending a fixed HT/VHT MCS alone, rather it
-	 * requires passing atleast one of used basic rates along with them.
+	 * requires passing at least one of used basic rates along with them.
 	 * Fixed rate setting across different preambles(legacy, HT, VHT) is
 	 * not supported by the FW. Hence use of FIXED_RATE vdev param is not
 	 * suitable for setting single HT/VHT rates.
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 61ead37a944a..00136601cb7d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2229,13 +2229,13 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 
 	if (resp.fw_version_info_valid) {
 		ab->qmi.target.fw_version = resp.fw_version_info.fw_version;
-		strlcpy(ab->qmi.target.fw_build_timestamp,
+		strscpy(ab->qmi.target.fw_build_timestamp,
 			resp.fw_version_info.fw_build_timestamp,
 			sizeof(ab->qmi.target.fw_build_timestamp));
 	}
 
 	if (resp.fw_build_id_valid)
-		strlcpy(ab->qmi.target.fw_build_id, resp.fw_build_id,
+		strscpy(ab->qmi.target.fw_build_id, resp.fw_build_id,
 			sizeof(ab->qmi.target.fw_build_id));
 
 	if (resp.eeprom_read_timeout_valid) {
@@ -2659,7 +2659,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	memset(&resp, 0, sizeof(resp));
 
 	req->host_version_valid = 1;
-	strlcpy(req->host_version, ATH11K_HOST_VERSION_STRING,
+	strscpy(req->host_version, ATH11K_HOST_VERSION_STRING,
 		sizeof(req->host_version));
 
 	req->tgt_cfg_valid = 1;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 84d1c7054013..f69918b9452a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6563,7 +6563,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 
 fallback:
 	/* Fallback to older reg (by sending previous country setting
-	 * again if fw has succeded and we failed to process here.
+	 * again if fw has succeeded and we failed to process here.
 	 * The Regdomain should be uniform across driver and fw. Since the
 	 * FW has processed the command and sent a success status, we expect
 	 * this function to succeed as well. If it doesn't, CTRY needs to be
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
