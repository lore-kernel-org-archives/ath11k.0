Return-Path: <SRS0=XEXT=P3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7739EC433EF
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 12:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3533961284
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3533961284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AC9DT9aUv9/3B4Ubt0AjebJ5uek0NrGyK1tXg4QblHE=; b=t1NwBxfoonNOY4
	UemN1o4RWLqM1JzGteryo+o+Rq6tUw+66psxR3LaTfe4VPqpCvFONoOeuT6BOdauFr16X4MLqUMJv
	eqK0pgPpKvGWCf5Y+Wsu+6DiyS87ScyyA2TwXtB3IWKKQunysPFiFW8QH78ISCTqUPg9l0bAKbGeU
	zSaFJEkhBylh1I4aUL1kfGet83Px53gz05g8aIXt2u4Z7//GO+b3BYXcdLuRzIKqHyvqEew8cbMk8
	ajmGRKupH42WyDjVfpROnQeda648dIxjpTIWt+9ei/QxSTGby+uS1wCfSjLIFZyU3jbJ6pLqrzgq4
	EGxiUfS+hDpDd4XEEkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk3v4-00GOcv-Br; Mon, 08 Nov 2021 12:38:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk3v1-00GOcI-2q
 for ath11k@lists.infradead.org; Mon, 08 Nov 2021 12:38:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636375115; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=6ozcYf0B2G31qBNR2RL9a+tqM8DVofWgqAwo7Jke7AY=;
 b=p0xsfMzRvpJ1onVZjrJ5C67RDHFVN3nGvGSDveEo/dM5lF8jqzvs7biDpFHt69MDa9U4rtfY
 bB7da9CQGZMf2RvroTUOWtJfDwh6WJLQ9GMyjSLe8syJJvtsiWojqqIL/acxwOIrEczvmn8V
 zyfUVIVsnI0TVTpU1vH3CBOoQl0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61891a46b882f8ab2fff660d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 12:38:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9CEB9C43460; Mon,  8 Nov 2021 12:38:30 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 681E5C4338F;
 Mon,  8 Nov 2021 12:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 681E5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/2] ath11k: convert ath11k_wmi_pdev_set_ps_mode() to use
 enum wmi_sta_ps_mode
Date: Mon,  8 Nov 2021 14:38:25 +0200
Message-Id: <20211108123826.8463-1-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_043835_518091_05200664 
X-CRM114-Status: GOOD (  13.05  )
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

It's more descriptive to use the actual enum used by the firmware instead of a
boolean so change ath11k_wmi_pdev_set_ps_mode() to use a boolean.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

v2:

* new patch

 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 drivers/net/wireless/ath/ath11k/wmi.c | 7 ++++---
 drivers/net/wireless/ath/ath11k/wmi.h | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc55602787b..f6511fc8ae8c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5638,7 +5638,8 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 			goto err_peer_del;
 		}
 
-		ret = ath11k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, false);
+		ret = ath11k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id,
+						  WMI_STA_PS_MODE_DISABLED);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to disable vdev %d ps mode: %d\n",
 				    arvif->vdev_id, ret);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4680d6..b9bfe0407cd7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1244,7 +1244,8 @@ int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 	return ret;
 }
 
-int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable)
+int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id,
+				enum wmi_sta_ps_mode psmode)
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct wmi_pdev_set_ps_mode_cmd *cmd;
@@ -1259,7 +1260,7 @@ int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable)
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_POWERSAVE_MODE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 	cmd->vdev_id = vdev_id;
-	cmd->sta_ps_mode = enable;
+	cmd->sta_ps_mode = psmode;
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_MODE_CMDID);
 	if (ret) {
@@ -1269,7 +1270,7 @@ int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable)
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "WMI vdev set psmode %d vdev id %d\n",
-		   enable, vdev_id);
+		   psmode, vdev_id);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0584e68e7593..93e2992db862 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5351,7 +5351,8 @@ int ath11k_wmi_set_peer_param(struct ath11k *ar, const u8 *peer_addr,
 			      u32 vdev_id, u32 param_id, u32 param_val);
 int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 			      u32 param_value, u8 pdev_id);
-int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id, u32 enable);
+int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id,
+				enum wmi_sta_ps_mode psmode);
 int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab);
 int ath11k_wmi_cmd_init(struct ath11k_base *ab);
 int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab);

base-commit: 042696e7d5cff4bf705caa191ea458352bcc07f3
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
