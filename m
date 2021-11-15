Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F80C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5AB561B4D
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5AB561B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DpOSLO8DFV4F9Nk6qlbBgprP++VQcr5pp56tktUw3yE=; b=HbtOkz8sS6E+R4
	0Wi0Rdfrb3uZOmdPIiQnfCjPbQWe6sFe2dA/7CRBWBgwuDP6YgMXCJUwwsbM0ZPlkQIrHmnW+kb6K
	jh5EkcKmU+MO37BRjPhrvSaSqJ7L9fuKKEIlq5uMK/M937cpQQopU0Ksf/WRy3+5mx25tUBaMh1P6
	91SAiITDefAWEdAiPC1JvH4XrWQcfvI1uEheImiKPmWL73zV4p+hTQskEXHVsI+dXM/oPFTarA8//
	ZUlpgpUtmlDtl+DJQOpmSMG/gdZ80LcQsXKAJReQzg1a1zmgY4HIERBUQOJ9PVmLDaAVoxvv7mrJg
	h+DENs7jLh2tul54yLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZ4c-00F9F0-EC; Mon, 15 Nov 2021 10:18:50 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYrc-00F4z2-Qn
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1636970720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5gu0GMtrQKVEsk6bZlhFGtmRJTyjLTvmg6ahp1uVoUA=;
 b=a2poC0qxMXkaz4KOQonI1ifaJ4t3Ff4x+KIlGEd++vdBsEzsI90Xy2OQ/0cQh+7s+cxFKe
 5VQTYACk1gXwXS6JH+nCUBGh/DU9l3QtM1qinUPV4QqE5tiSno92o2fzrw/MmMB0VgkE0X
 BWaoOImJr+vUvl5L2yOMz6emAXppiSw=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>,
 Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2 1/2] ath11k: clear the keys properly via DISABLE_KEY
Date: Mon, 15 Nov 2021 11:04:40 +0100
Message-Id: <20211115100441.33771-1-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_020525_339973_E8FA0E49 
X-CRM114-Status: GOOD (  10.12  )
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

From: Karthikeyan Kathirvel <kathirve@codeaurora.org>

DISABLE_KEY sets the key_len to 0, firmware will not delete the keys if
key_len is 0. Changing from security mode to open mode will cause mcast
to be still encrypted without vdev restart.

Set the proper key_len for DISABLE_KEY cmd to clear the keys in
firmware.

Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Reported-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
[sven@narfation.org: split into separate patches, clean up commit message]
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
v2:
* resubmit with the missing second patch

 drivers/net/wireless/ath/ath11k/mac.c | 4 +---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc55602787b..cdee7545e876 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3316,9 +3316,7 @@ static int ath11k_install_key(struct ath11k_vif *arvif,
 		return 0;
 
 	if (cmd == DISABLE_KEY) {
-		/* TODO: Check if FW expects  value other than NONE for del */
-		/* arg.key_cipher = WMI_CIPHER_NONE; */
-		arg.key_len = 0;
+		arg.key_cipher = WMI_CIPHER_NONE;
 		arg.key_data = NULL;
 		goto install;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4680d6..d97be60689be 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1689,7 +1689,8 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, key_len_aligned);
-	memcpy(tlv->value, (u8 *)arg->key_data, key_len_aligned);
+	if (arg->key_data)
+		memcpy(tlv->value, (u8 *)arg->key_data, key_len_aligned);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_INSTALL_KEY_CMDID);
 	if (ret) {
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
