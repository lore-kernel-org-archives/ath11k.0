Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DB7C48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8031D61246
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8031D61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ2ujc7MHVAI4Uy8wNvhdjt9xb0quNaHwaIcIuJDUdk=; b=Uzp+eG8j79cJXp
	72qy/9KwYFdjMOJDU7qfB7aUA2SJu5JT3hJ2WXQGwTYTLBv0pwD0PwBtiPeI13wiDW19dP7Ic7beh
	riCS0x5Ch4iHH7M1qzTCicwGUn/x0OqF8BJEUK014sNuhRwx7hLcjhCadHUJ0omQ5JRciSUXjvpLA
	PmL52uIty/p6zPyYzQ+DFJs8afKvpFHlyAnVkim1o3w7UgbqiGRaOwdNOUp39pQMZYKBeR1wc8JhP
	1eds6RAf2J0fbJUXgT6rY7nMroYW1HXqD32LBPFTrenwW50HJxhJZlCyO9YJLIszH1m28SvT/JrxO
	16r2MokNA5UKu5v969WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnc-003fK0-Dl; Tue, 15 Jun 2021 22:44:48 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOM-0033xY-PF
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:14:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791680; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=roH2P0lM4Hnb8FwTlfpvFEb+YoLM2dedezcP3SozlW0=;
 b=owXk0MI0/DFeIRDEwx0VHj1QiA+ki9NC5eE2Mh94BqZsmSrObgQ3v6Ay91LlFJi9gybzCG31
 cNk1v+eXgqyTdBp4SAivAKXx8IMLG5mEcTE2zVZR1nrofXet1Bc2dnEMvWJaoy8aZIgYYpe3
 Y8Ik5gJIvngY72qg+mzck3BJz+s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c9183ce27c0cc77fe10583 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 38E15C43217; Tue, 15 Jun 2021 21:14:35 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D70E9C433D3;
 Tue, 15 Jun 2021 21:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D70E9C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 03/12] ath11k: modify dp_rx desc access wrapper calls inline
Date: Wed, 16 Jun 2021 00:13:58 +0300
Message-Id: <20210615211407.92233-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141440_353255_9077D1C8 
X-CRM114-Status: GOOD (  11.44  )
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

From: P Praneesh <ppranees@codeaurora.org>

In data path, to reduce the CPU cycles spending on descriptor access
wrapper function, changed those functions as static inline.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 114 ++++++++++++------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 603d2f93ac18..32c348812769 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -20,13 +20,15 @@
 
 #define ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
 
-static u8 *ath11k_dp_rx_h_80211_hdr(struct ath11k_base *ab, struct hal_rx_desc *desc)
+static inline
+u8 *ath11k_dp_rx_h_80211_hdr(struct ath11k_base *ab, struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_hdr_status(desc);
 }
 
-static enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(struct ath11k_base *ab,
-							       struct hal_rx_desc *desc)
+static inline
+enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(struct ath11k_base *ab,
+							struct hal_rx_desc *desc)
 {
 	if (!ab->hw_params.hw_ops->rx_desc_encrypt_valid(desc))
 		return HAL_ENCRYPT_TYPE_OPEN;
@@ -34,32 +36,34 @@ static enum hal_encrypt_type ath11k_dp_rx_h_mpdu_start_enctype(struct ath11k_bas
 	return ab->hw_params.hw_ops->rx_desc_get_encrypt_type(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_decap_type(struct ath11k_base *ab,
-					       struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_decap_type(struct ath11k_base *ab,
+						      struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_decap_type(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_mesh_ctl_present(struct ath11k_base *ab,
-						     struct hal_rx_desc *desc)
+static inline
+u8 ath11k_dp_rx_h_msdu_start_mesh_ctl_present(struct ath11k_base *ab,
+					      struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mesh_ctl(desc);
 }
 
-static bool ath11k_dp_rx_h_mpdu_start_seq_ctrl_valid(struct ath11k_base *ab,
-						     struct hal_rx_desc *desc)
+static inline
+bool ath11k_dp_rx_h_mpdu_start_seq_ctrl_valid(struct ath11k_base *ab,
+					      struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_seq_ctl_vld(desc);
 }
 
-static bool ath11k_dp_rx_h_mpdu_start_fc_valid(struct ath11k_base *ab,
-					       struct hal_rx_desc *desc)
+static inline bool ath11k_dp_rx_h_mpdu_start_fc_valid(struct ath11k_base *ab,
+						      struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_fc_valid(desc);
 }
 
-static bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
-						 struct sk_buff *skb)
+static inline bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
+							struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr;
 
@@ -67,8 +71,8 @@ static bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
 	return ieee80211_has_morefrags(hdr->frame_control);
 }
 
-static u16 ath11k_dp_rx_h_mpdu_start_frag_no(struct ath11k_base *ab,
-					     struct sk_buff *skb)
+static inline u16 ath11k_dp_rx_h_mpdu_start_frag_no(struct ath11k_base *ab,
+						    struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr;
 
@@ -76,37 +80,37 @@ static u16 ath11k_dp_rx_h_mpdu_start_frag_no(struct ath11k_base *ab,
 	return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
 }
 
-static u16 ath11k_dp_rx_h_mpdu_start_seq_no(struct ath11k_base *ab,
-					    struct hal_rx_desc *desc)
+static inline u16 ath11k_dp_rx_h_mpdu_start_seq_no(struct ath11k_base *ab,
+						   struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_start_seq_no(desc);
 }
 
-static void *ath11k_dp_rx_get_attention(struct ath11k_base *ab,
-					struct hal_rx_desc *desc)
+static inline void *ath11k_dp_rx_get_attention(struct ath11k_base *ab,
+					       struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_attention(desc);
 }
 
-static bool ath11k_dp_rx_h_attn_msdu_done(struct rx_attention *attn)
+static inline bool ath11k_dp_rx_h_attn_msdu_done(struct rx_attention *attn)
 {
 	return !!FIELD_GET(RX_ATTENTION_INFO2_MSDU_DONE,
 			   __le32_to_cpu(attn->info2));
 }
 
-static bool ath11k_dp_rx_h_attn_l4_cksum_fail(struct rx_attention *attn)
+static inline bool ath11k_dp_rx_h_attn_l4_cksum_fail(struct rx_attention *attn)
 {
 	return !!FIELD_GET(RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL,
 			   __le32_to_cpu(attn->info1));
 }
 
-static bool ath11k_dp_rx_h_attn_ip_cksum_fail(struct rx_attention *attn)
+static inline bool ath11k_dp_rx_h_attn_ip_cksum_fail(struct rx_attention *attn)
 {
 	return !!FIELD_GET(RX_ATTENTION_INFO1_IP_CKSUM_FAIL,
 			   __le32_to_cpu(attn->info1));
 }
 
-static bool ath11k_dp_rx_h_attn_is_decrypted(struct rx_attention *attn)
+static inline bool ath11k_dp_rx_h_attn_is_decrypted(struct rx_attention *attn)
 {
 	return (FIELD_GET(RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE,
 			  __le32_to_cpu(attn->info2)) ==
@@ -142,68 +146,68 @@ static u32 ath11k_dp_rx_h_attn_mpdu_err(struct rx_attention *attn)
 	return errmap;
 }
 
-static u16 ath11k_dp_rx_h_msdu_start_msdu_len(struct ath11k_base *ab,
-					      struct hal_rx_desc *desc)
+static inline u16 ath11k_dp_rx_h_msdu_start_msdu_len(struct ath11k_base *ab,
+						     struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_len(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_sgi(struct ath11k_base *ab,
-					struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_sgi(struct ath11k_base *ab,
+					       struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_sgi(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_rate_mcs(struct ath11k_base *ab,
-					     struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_rate_mcs(struct ath11k_base *ab,
+						    struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_rate_mcs(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_rx_bw(struct ath11k_base *ab,
-					  struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_rx_bw(struct ath11k_base *ab,
+						 struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_rx_bw(desc);
 }
 
-static u32 ath11k_dp_rx_h_msdu_start_freq(struct ath11k_base *ab,
-					  struct hal_rx_desc *desc)
+static inline u32 ath11k_dp_rx_h_msdu_start_freq(struct ath11k_base *ab,
+						 struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_freq(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_pkt_type(struct ath11k_base *ab,
-					     struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_pkt_type(struct ath11k_base *ab,
+						    struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_msdu_pkt_type(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_start_nss(struct ath11k_base *ab,
-					struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_start_nss(struct ath11k_base *ab,
+					       struct hal_rx_desc *desc)
 {
 	return hweight8(ab->hw_params.hw_ops->rx_desc_get_msdu_nss(desc));
 }
 
-static u8 ath11k_dp_rx_h_mpdu_start_tid(struct ath11k_base *ab,
-					struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_mpdu_start_tid(struct ath11k_base *ab,
+					       struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_tid(desc);
 }
 
-static u16 ath11k_dp_rx_h_mpdu_start_peer_id(struct ath11k_base *ab,
-					     struct hal_rx_desc *desc)
+static inline u16 ath11k_dp_rx_h_mpdu_start_peer_id(struct ath11k_base *ab,
+						    struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_peer_id(desc);
 }
 
-static u8 ath11k_dp_rx_h_msdu_end_l3pad(struct ath11k_base *ab,
-					struct hal_rx_desc *desc)
+static inline u8 ath11k_dp_rx_h_msdu_end_l3pad(struct ath11k_base *ab,
+					       struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_l3_pad_bytes(desc);
 }
 
-static bool ath11k_dp_rx_h_msdu_end_first_msdu(struct ath11k_base *ab,
-					       struct hal_rx_desc *desc)
+static inline bool ath11k_dp_rx_h_msdu_end_first_msdu(struct ath11k_base *ab,
+						      struct hal_rx_desc *desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_first_msdu(desc);
 }
@@ -221,14 +225,14 @@ static void ath11k_dp_rx_desc_end_tlv_copy(struct ath11k_base *ab,
 	ab->hw_params.hw_ops->rx_desc_copy_attn_end_tlv(fdesc, ldesc);
 }
 
-static u32 ath11k_dp_rxdesc_get_mpdulen_err(struct rx_attention *attn)
+static inline u32 ath11k_dp_rxdesc_get_mpdulen_err(struct rx_attention *attn)
 {
 	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR,
 			 __le32_to_cpu(attn->info1));
 }
 
-static u8 *ath11k_dp_rxdesc_get_80211hdr(struct ath11k_base *ab,
-					 struct hal_rx_desc *rx_desc)
+static inline u8 *ath11k_dp_rxdesc_get_80211hdr(struct ath11k_base *ab,
+						struct hal_rx_desc *rx_desc)
 {
 	u8 *rx_pkt_hdr;
 
@@ -237,8 +241,8 @@ static u8 *ath11k_dp_rxdesc_get_80211hdr(struct ath11k_base *ab,
 	return rx_pkt_hdr;
 }
 
-static bool ath11k_dp_rxdesc_mpdu_valid(struct ath11k_base *ab,
-					struct hal_rx_desc *rx_desc)
+static inline bool ath11k_dp_rxdesc_mpdu_valid(struct ath11k_base *ab,
+					       struct hal_rx_desc *rx_desc)
 {
 	u32 tlv_tag;
 
@@ -247,15 +251,15 @@ static bool ath11k_dp_rxdesc_mpdu_valid(struct ath11k_base *ab,
 	return tlv_tag == HAL_RX_MPDU_START;
 }
 
-static u32 ath11k_dp_rxdesc_get_ppduid(struct ath11k_base *ab,
-				       struct hal_rx_desc *rx_desc)
+static inline u32 ath11k_dp_rxdesc_get_ppduid(struct ath11k_base *ab,
+					      struct hal_rx_desc *rx_desc)
 {
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
 }
 
-static void ath11k_dp_rxdesc_set_msdu_len(struct ath11k_base *ab,
-					  struct hal_rx_desc *desc,
-					  u16 len)
+static inline void ath11k_dp_rxdesc_set_msdu_len(struct ath11k_base *ab,
+						 struct hal_rx_desc *desc,
+						 u16 len)
 {
 	ab->hw_params.hw_ops->rx_desc_set_msdu_len(desc, len);
 }
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
