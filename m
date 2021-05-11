Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C120C433B4
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC79C6187E
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC79C6187E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGWfjrW9uJfWwssZVE950SCMRQzSjuHXZQdWKSyvopc=; b=TVZlRHlxc1NPJm7b73YdRE/b0
	5Lqug+yWrLMTIhOzTurGdDEvDswxQbzlQHyOnCx+t96eqyvSoaD6B2CzNZVzOZUJ34aWYFUSQDSZo
	aWwwni75RCOjQDDp02k9ntQnoYbq0Si6Gq/MpKOIIQmvxBlrybWPAMhQgmsb43pR/EJv8dFU2mmUh
	pcRdqTjJnWBrjpHo7qvZrUkCG/Ni8BJwCGtv0GMlq9rS0UyrLlW6wyg+MxE0JdYEHihjDsmnuZ3fU
	IbOUAQiDA3McUbqnuLq/1xrmSiWH4nc2rNp41K64QmKexHdU1hUn6v88HerRKDCPkBjrup46JLFqg
	mgQXIYUmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQX-000mS6-Jh; Tue, 11 May 2021 16:40:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAK-000irn-0C
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IVyami990KY+dqeiRJu1k7i0CV3TjJ04chwTn6JjOvQ=; b=DQX8MSnF/xdOBktvuPZbYNotur
 Dw/iGoWpr7k1HlTpco99n18Ijc/IqxunmKwa2ubcGvi7sttViq5moSl81cJIPyBNEJs0fjODAylFN
 uA60I+CVWDafOZmWabm6I0NHHgg6u53hteU5SaIK6uzEDM1WNmaTTRVM20mZZWYQhVpb5IG/swSi3
 uR7ZuaLguA2TIYL6MsfCyIQ/6vlUfMvejrHzR+Hr7jqTVK3n45FJn3qvvTR48K5Y0Db7PqXuovk30
 WJDKbljsB6SHdp4TkRfN7rcd733XHJfUn7B2FoIYN+iSIcQuI0KptwY4pvRzq9dxQs2jz3JU/wBUv
 SR1StyBQ==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAC-009l9l-Tf
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:23:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750200; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IVyami990KY+dqeiRJu1k7i0CV3TjJ04chwTn6JjOvQ=;
 b=SmKQeC3bui2NfFgp1T2mszrmHiGSeIlydsg5uU+7MYw0j+P3Nyjwrl8n3mX1nmvoQbsSdQI5
 vnA0aFeruXWEhaWYFNZ/CAA7+D/i4bB5BMlGMIaY2StcMhyPXJMD8iw/VPIu+iRfsDHWrzq1
 if/J82UfTo5qn4iDweNJmjOVs9s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 609aaf69761079bcc28a569b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:23:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 070F1C43143; Tue, 11 May 2021 16:23:05 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F2CAC4338A;
 Tue, 11 May 2021 16:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F2CAC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 5/7] ath11k: add support to get peer id for WCN6855
Date: Tue, 11 May 2021 19:22:12 +0300
Message-Id: <20210511162214.29475-6-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092320_995791_D6457101 
X-CRM114-Status: GOOD (  16.41  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

For WCN6855, the layout of hal rx mpdu info is different, so need to
handle this target differently when getting peer id.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c |  5 +----
 drivers/net/wireless/ath/ath11k/hal_rx.h |  8 +++++++
 drivers/net/wireless/ath/ath11k/hw.c     | 28 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h     |  1 +
 4 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index b479d93bee32..95d77468e87e 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1092,12 +1092,9 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		break;
 	}
 	case HAL_RX_MPDU_START: {
-		struct hal_rx_mpdu_info *mpdu_info =
-			(struct hal_rx_mpdu_info *)tlv_data;
 		u16 peer_id;
 
-		peer_id = FIELD_GET(HAL_RX_MPDU_INFO_INFO0_PEERID,
-				    __le32_to_cpu(mpdu_info->info0));
+		peer_id = ab->hw_params.hw_ops->mpdu_info_get_peerid(tlv_data);
 		if (peer_id)
 			ppdu_info->peer_id = peer_id;
 		break;
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index d464a270c049..0f1f04b812b9 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -254,12 +254,20 @@ struct hal_rx_phyrx_rssi_legacy_info {
 } __packed;
 
 #define HAL_RX_MPDU_INFO_INFO0_PEERID	GENMASK(31, 16)
+#define HAL_RX_MPDU_INFO_INFO0_PEERID_WCN6855	GENMASK(15, 0)
+
 struct hal_rx_mpdu_info {
 	__le32 rsvd0;
 	__le32 info0;
 	__le32 rsvd1[21];
 } __packed;
 
+struct hal_rx_mpdu_info_wcn6855 {
+	__le32 rsvd0[8];
+	__le32 info0;
+	__le32 rsvd1[14];
+} __packed;
+
 #define HAL_RX_PPDU_END_DURATION	GENMASK(23, 0)
 struct hal_rx_ppdu_end_duration {
 	__le32 rsvd0[9];
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 01207b50a454..d9596903b0a5 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -742,6 +742,29 @@ static void ath11k_hw_wcn6855_reo_setup(struct ath11k_base *ab)
 			   ring_hash_map);
 }
 
+static u16 ath11k_hw_ipq8074_mpdu_info_get_peerid(u8 *tlv_data)
+{
+	u16 peer_id = 0;
+	struct hal_rx_mpdu_info *mpdu_info =
+		(struct hal_rx_mpdu_info *)tlv_data;
+
+	peer_id = FIELD_GET(HAL_RX_MPDU_INFO_INFO0_PEERID,
+			    __le32_to_cpu(mpdu_info->info0));
+
+	return peer_id;
+}
+
+static u16 ath11k_hw_wcn6855_mpdu_info_get_peerid(u8 *tlv_data)
+{
+	u16 peer_id = 0;
+	struct hal_rx_mpdu_info_wcn6855 *mpdu_info =
+		(struct hal_rx_mpdu_info_wcn6855 *)tlv_data;
+
+	peer_id = FIELD_GET(HAL_RX_MPDU_INFO_INFO0_PEERID_WCN6855,
+			    __le32_to_cpu(mpdu_info->info0));
+	return peer_id;
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
@@ -775,6 +798,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_ipq8074_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
 };
 
 const struct ath11k_hw_ops ipq6018_ops = {
@@ -810,6 +834,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_ipq8074_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
 };
 
 const struct ath11k_hw_ops qca6390_ops = {
@@ -845,6 +870,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_ipq8074_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
 };
 
 const struct ath11k_hw_ops qcn9074_ops = {
@@ -880,6 +906,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_ipq8074_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
 };
 
 const struct ath11k_hw_ops wcn6855_ops = {
@@ -915,6 +942,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_attention = ath11k_hw_wcn6855_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_wcn6855_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_wcn6855_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_wcn6855_mpdu_info_get_peerid,
 };
 
 #define ATH11K_TX_RING_MASK_0 0x1
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index afe3b3c71695..be62f0c2e25e 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -200,6 +200,7 @@ struct ath11k_hw_ops {
 	struct rx_attention *(*rx_desc_get_attention)(struct hal_rx_desc *desc);
 	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
 	void (*reo_setup)(struct ath11k_base *ab);
+	u16 (*mpdu_info_get_peerid)(u8 *tlv_data);
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
