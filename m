Return-Path: <SRS0=z4JX=JU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3713C433ED
	for <ath11k@archiver.kernel.org>; Fri, 23 Apr 2021 13:42:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F2461175
	for <ath11k@archiver.kernel.org>; Fri, 23 Apr 2021 13:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F2461175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y0HyGlQO25Lp6AU9V3t221bJc4a1NAqWOouobIDYDCs=; b=fkJBnID3Pzs61iYYo3GQz5MMAJ
	NWgDqObvkIYp0xWEMCrjftBqaMDNC2sjyHEkbQQdFzqZhSK9hnNsFQvGCP7mYApvVdzEyB31T+hrK
	8zYgFbAbOnnEc7heO/iHQgweUr7gegqpOl/h7ILDC8mjiG4VD85SMTDTLzkZuTejLWoRm7Mqd9AOe
	3udHZtTMnVyCbqcBhsm6ibuebLE3lIO8X5/GS0l4OTaiwAih/APaXKNEattBWk+wU254a0OtNoP4b
	oQzUSoQmGKRcIFg0hs9v4WjFrYzzVMOgxhxT7mNslaVgBcEmYFdrHzm0HibKG8oYmlXIA3neJt/yW
	2jOgLcag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZw47-001ab1-3R; Fri, 23 Apr 2021 13:41:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZw40-001aaS-8v; Fri, 23 Apr 2021 13:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=a49NdrbR/z66Jr6mY7jD/2z+Dj3b1ARUac7JGgXfqZs=; b=DChTPcqVApzxV9kZl/lth4b1QG
 hxNcg+C6qvSIBm5AEmX99L4iysQtP1BI2P1QISjrvNsVB/Au5AVyBhOPGTHSCmWwPPcAGdrqGkA/Q
 nehMfVROLcs+3eGFpq0Z7m+4DZhPQu36bXDeVAcd1HXus1Itwg4DtNvrCgEthJQme5Q6FGU4sYrak
 l2xsaqGC3SlARQtDqrXs9jOPCpYvL/JVQxbV45ZCIPdbaxqBF18Hb+DBhUMWaDc4z7eqwJT880dT9
 A39Yxh73QAsddmL9xm5SoS2XOAXZF5NkHrZMhH5jOyXofiMjzJOjReQD4hV/3rojiOI13aB/Wmfn+
 ubD87kCg==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZw3w-00ERau-Uw; Fri, 23 Apr 2021 13:41:42 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lZw3p-0002wi-8X; Fri, 23 Apr 2021 13:41:33 +0000
From: Colin King <colin.king@canonical.com>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ath10k/ath11k: fix spelling mistake "requed" -> "requeued"
Date: Fri, 23 Apr 2021 14:41:33 +0100
Message-Id: <20210423134133.339751-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_064141_199960_AD0A5263 
X-CRM114-Status: GOOD (  11.57  )
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

From: Colin Ian King <colin.king@canonical.com>

There are multiple occurrances of the misspelling of requeued in
the drivers with symbol names and debug text. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/core.h              | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c             | 4 ++--
 drivers/net/wireless/ath/ath10k/htt.h               | 4 ++--
 drivers/net/wireless/ath/ath10k/wmi.c               | 6 +++---
 drivers/net/wireless/ath/ath10k/wmi.h               | 8 ++++----
 drivers/net/wireless/ath/ath11k/core.h              | 4 ++--
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c               | 4 ++--
 drivers/net/wireless/ath/ath11k/wmi.h               | 4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 648ed36f845f..5aeff2d9f6cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -301,7 +301,7 @@ struct ath10k_fw_stats_pdev {
 	s32 underrun;
 	u32 hw_paused;
 	s32 tx_abort;
-	s32 mpdus_requed;
+	s32 mpdus_requeued;
 	u32 tx_ko;
 	u32 data_rc;
 	u32 self_triggers;
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index fd052f6ed019..39378e3f9b2b 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1105,7 +1105,7 @@ static const char ath10k_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"d_tx_ppdu_reaped",
 	"d_tx_fifo_underrun",
 	"d_tx_ppdu_abort",
-	"d_tx_mpdu_requed",
+	"d_tx_mpdu_requeued",
 	"d_tx_excessive_retries",
 	"d_tx_hw_rate",
 	"d_tx_dropped_sw_retries",
@@ -1205,7 +1205,7 @@ void ath10k_debug_get_et_stats(struct ieee80211_hw *hw,
 	data[i++] = pdev_stats->hw_reaped;
 	data[i++] = pdev_stats->underrun;
 	data[i++] = pdev_stats->tx_abort;
-	data[i++] = pdev_stats->mpdus_requed;
+	data[i++] = pdev_stats->mpdus_requeued;
 	data[i++] = pdev_stats->tx_ko;
 	data[i++] = pdev_stats->data_rc;
 	data[i++] = pdev_stats->sw_retry_failure;
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 956157946106..4e11ee775b4d 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1282,8 +1282,8 @@ struct htt_dbg_stats_wal_tx_stats {
 	/* Num PPDUs cleaned up in TX abort */
 	__le32 tx_abort;
 
-	/* Num MPDUs requed by SW */
-	__le32 mpdus_requed;
+	/* Num MPDUs requeued by SW */
+	__le32 mpdus_requeued;
 
 	/* excessive retries */
 	__le32 tx_ko;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index d48b922215eb..f42bf2c8f9e7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2867,7 +2867,7 @@ void ath10k_wmi_pull_pdev_stats_tx(const struct wmi_pdev_stats_tx *src,
 	dst->hw_reaped = __le32_to_cpu(src->hw_reaped);
 	dst->underrun = __le32_to_cpu(src->underrun);
 	dst->tx_abort = __le32_to_cpu(src->tx_abort);
-	dst->mpdus_requed = __le32_to_cpu(src->mpdus_requed);
+	dst->mpdus_requeued = __le32_to_cpu(src->mpdus_requeued);
 	dst->tx_ko = __le32_to_cpu(src->tx_ko);
 	dst->data_rc = __le32_to_cpu(src->data_rc);
 	dst->self_triggers = __le32_to_cpu(src->self_triggers);
@@ -2895,7 +2895,7 @@ ath10k_wmi_10_4_pull_pdev_stats_tx(const struct wmi_10_4_pdev_stats_tx *src,
 	dst->hw_reaped = __le32_to_cpu(src->hw_reaped);
 	dst->underrun = __le32_to_cpu(src->underrun);
 	dst->tx_abort = __le32_to_cpu(src->tx_abort);
-	dst->mpdus_requed = __le32_to_cpu(src->mpdus_requed);
+	dst->mpdus_requeued = __le32_to_cpu(src->mpdus_requeued);
 	dst->tx_ko = __le32_to_cpu(src->tx_ko);
 	dst->data_rc = __le32_to_cpu(src->data_rc);
 	dst->self_triggers = __le32_to_cpu(src->self_triggers);
@@ -8270,7 +8270,7 @@ ath10k_wmi_fw_pdev_tx_stats_fill(const struct ath10k_fw_stats_pdev *pdev,
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "PPDUs cleaned", pdev->tx_abort);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
-			 "MPDUs requed", pdev->mpdus_requed);
+			 "MPDUs requeued", pdev->mpdus_requeued);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "Excessive retries", pdev->tx_ko);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d870f7067cb7..dd980c81793e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4371,8 +4371,8 @@ struct wmi_pdev_stats_tx {
 	/* Num PPDUs cleaned up in TX abort */
 	__le32 tx_abort;
 
-	/* Num MPDUs requed by SW */
-	__le32 mpdus_requed;
+	/* Num MPDUs requeued by SW */
+	__le32 mpdus_requeued;
 
 	/* excessive retries */
 	__le32 tx_ko;
@@ -4444,8 +4444,8 @@ struct wmi_10_4_pdev_stats_tx {
 	/* Num PPDUs cleaned up in TX abort */
 	__le32 tx_abort;
 
-	/* Num MPDUs requed by SW */
-	__le32 mpdus_requed;
+	/* Num MPDUs requeued by SW */
+	__le32 mpdus_requeued;
 
 	/* excessive retries */
 	__le32 tx_ko;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 55af982deca7..382df5318b61 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -795,8 +795,8 @@ struct ath11k_fw_stats_pdev {
 	s32 underrun;
 	/* Num PPDUs cleaned up in TX abort */
 	s32 tx_abort;
-	/* Num MPDUs requed by SW */
-	s32 mpdus_requed;
+	/* Num MPDUs requeued by SW */
+	s32 mpdus_requeued;
 	/* excessive retries */
 	u32 tx_ko;
 	/* data hw rate code */
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index ec93f14e6d2a..9e0c90da99d3 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -89,7 +89,7 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_abort = %u",
 			   htt_stats_buf->tx_abort);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "mpdu_requeued = %u",
-			   htt_stats_buf->mpdu_requed);
+			   htt_stats_buf->mpdu_requeued);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "tx_xretry = %u",
 			   htt_stats_buf->tx_xretry);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "data_rc = %u",
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index 567a26d485a9..d428f52003a4 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -147,7 +147,7 @@ struct htt_tx_pdev_stats_cmn_tlv {
 	u32 hw_flush;
 	u32 hw_filt;
 	u32 tx_abort;
-	u32 mpdu_requed;
+	u32 mpdu_requeued;
 	u32 tx_xretry;
 	u32 data_rc;
 	u32 mpdu_dropped_xretry;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ca2d80679b6..6c253eae9d06 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5235,7 +5235,7 @@ ath11k_wmi_pull_pdev_stats_tx(const struct wmi_pdev_stats_tx *src,
 	dst->hw_reaped = src->hw_reaped;
 	dst->underrun = src->underrun;
 	dst->tx_abort = src->tx_abort;
-	dst->mpdus_requed = src->mpdus_requed;
+	dst->mpdus_requeued = src->mpdus_requeued;
 	dst->tx_ko = src->tx_ko;
 	dst->data_rc = src->data_rc;
 	dst->self_triggers = src->self_triggers;
@@ -5505,7 +5505,7 @@ ath11k_wmi_fw_pdev_tx_stats_fill(const struct ath11k_fw_stats_pdev *pdev,
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
 			 "PPDUs cleaned", pdev->tx_abort);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10d\n",
-			 "MPDUs requed", pdev->mpdus_requed);
+			 "MPDUs requeued", pdev->mpdus_requeued);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10u\n",
 			 "Excessive retries", pdev->tx_ko);
 	len += scnprintf(buf + len, buf_len - len, "%30s %10u\n",
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 3ade1ddd35c9..d35c47e0b19d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4171,8 +4171,8 @@ struct wmi_pdev_stats_tx {
 	/* Num PPDUs cleaned up in TX abort */
 	s32 tx_abort;
 
-	/* Num MPDUs requed by SW */
-	s32 mpdus_requed;
+	/* Num MPDUs requeued by SW */
+	s32 mpdus_requeued;
 
 	/* excessive retries */
 	u32 tx_ko;
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
