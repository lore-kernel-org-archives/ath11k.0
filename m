Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE5BC52D7C
	for <ath11k@archiver.kernel.org>; Fri,  9 Aug 2024 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0L/O1/w2/H4X5J9hK2LMni0910UPhAB4G8qwSg6XNk=; b=Gz0XHtP5Hsuht21Bs23mAxfLFj
	/RFaETwdJwL/8ArJ5etQWVPVTjJ6vSbO+1cON2hvtbrU0yi2EqBXvbVdm1gV/M2ZYWhRXo8Uc9KND
	A69BXR6+kkcYiHtLgnv1G3Q1AIHgeEJu4bhffkMGsn4ZT8yUzchZlOcF70A8XshLf+3UdjipOAs+1
	eHK1o1HOl/3mSEJJIbcMjhkXQtiRCKJE0qWwnuooAV+G1UtA+KwzRgViIRLvknyYXK4ZXXCWBNz39
	dnywW0iGIB6NjSl0oYv/WdUEmHWQGjGsEWdNpyHN67BsUPftYTzmebWs/VMRGYfa+kDl++SGGvwmC
	QFhizWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSOf-0000000BtxA-3QHM;
	Fri, 09 Aug 2024 16:23:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSME-0000000Bt7I-2uug
	for ath11k@lists.infradead.org;
	Fri, 09 Aug 2024 16:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01BB56170A
	for <ath11k@lists.infradead.org>; Fri,  9 Aug 2024 16:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1335BC32782;
	Fri,  9 Aug 2024 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723220448;
	bh=JvFuafIlA5XYuTkzcsIaPQIzRgFXGYfK86QgMIRemXM=;
	h=Date:From:To:Cc:Subject:From;
	b=JTx0pkY32DTKdHuZ8o93I2RKkOrJMLad6J9pBwJVg4g/I4Kjq88Xx5NvRbLu7q+rn
	 g71WncVeC5YSlCMMuF+dTJ5vOg7NkN1eBqh5PKWnAZrBuMUHqaGKj5TgZuJ3pa8c+g
	 qQnq2FJ/xDMCZsluWC4pLkMRAGvig4a8Cd96pwUZtKS3YZZe/DOKqisVttItQmjf2B
	 LHfwR8wch9DmpbeEdWklneFb8ENsA1y3Bkbm1W9oYraV7ehsOSbDt5KKzinSKlKyAv
	 MPHtUqWLNOa7yJDux76y8dqQdkvtFtb2pLtfo4f/UkHz3FzZZQxdUmi7F14PZZuL3k
	 WXuNAozIuging==
Date: Fri, 9 Aug 2024 10:20:45 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: ath11k: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <ZrZB3Rjswe0ZXtug@cute>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_092050_906492_A407663C 
X-CRM114-Status: GOOD (  10.81  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declaration to the end of the structure. Notice
that `struct ieee80211_chanctx_conf` is a flexible structure --a
structure that contains a flexible-array member.

Also, remove a couple of unused structures.

Fix the following warnings:
drivers/net/wireless/ath/ath11k/core.h:409:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/ath/ath11k/dp.h:1309:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/net/wireless/ath/ath11k/dp.h:1368:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  4 +++-
 drivers/net/wireless/ath/ath11k/dp.h   | 23 -----------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index df24f0e409af..e283415dccf3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -406,11 +406,13 @@ struct ath11k_vif {
 	bool wpaie_present;
 	bool bcca_zero_sent;
 	bool do_not_send_tmpl;
-	struct ieee80211_chanctx_conf chanctx;
 	struct ath11k_arp_ns_offload arp_ns_offload;
 	struct ath11k_rekey_data rekey_data;
 
 	struct ath11k_reg_tpc_power_info reg_tpc_info;
+
+	/* Must be last - ends in a flexible-array member. */
+	struct ieee80211_chanctx_conf chanctx;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 2f6dd69d3be2..65d2bc0687c8 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1305,18 +1305,6 @@ struct htt_ppdu_stats_user_rate {
 #define HTT_TX_INFO_PEERID(_flags) \
 			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M, _flags)
 
-struct htt_tx_ppdu_stats_info {
-	struct htt_tlv tlv_hdr;
-	u32 tx_success_bytes;
-	u32 tx_retry_bytes;
-	u32 tx_failed_bytes;
-	u32 flags; /* %HTT_PPDU_STATS_TX_INFO_FLAGS_ */
-	u16 tx_success_msdus;
-	u16 tx_retry_msdus;
-	u16 tx_failed_msdus;
-	u16 tx_duration; /* united in us */
-} __packed;
-
 enum  htt_ppdu_stats_usr_compln_status {
 	HTT_PPDU_STATS_USER_STATUS_OK,
 	HTT_PPDU_STATS_USER_STATUS_FILTERED,
@@ -1364,17 +1352,6 @@ struct htt_ppdu_stats_usr_cmpltn_ack_ba_status {
 	u32 success_bytes;
 } __packed;
 
-struct htt_ppdu_stats_usr_cmn_array {
-	struct htt_tlv tlv_hdr;
-	u32 num_ppdu_stats;
-	/* tx_ppdu_stats_info is filled by multiple struct htt_tx_ppdu_stats_info
-	 * elements.
-	 * tx_ppdu_stats_info is variable length, with length =
-	 *     number_of_ppdu_stats * sizeof (struct htt_tx_ppdu_stats_info)
-	 */
-	struct htt_tx_ppdu_stats_info tx_ppdu_info[];
-} __packed;
-
 struct htt_ppdu_user_stats {
 	u16 peer_id;
 	u32 tlv_flags;
-- 
2.34.1


