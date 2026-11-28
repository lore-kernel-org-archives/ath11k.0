Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3352606A697
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cP/xMHRj;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cbC/L0zd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=; b=cP/xMHRjpjNdwH
	KECEcxWytIbAKc0gWbMw76jLHWOZvJ5HxyBl+XFlnuh521EZcN2vQxbOfm4R45mv6xrzTyweVU8iV
	3xbwBq5XO6yC8C7IgyBljzHJ3+qiALXSNU02nGEKkmle/8D1cAmK7WReEx3SZgvlFXngDuMV7EjaL
	ky92NCUsTj4hWXMKolLQgFAUOk8SnK/sBHAIrRskw8srfswJpyHOCKoUwt655K7ZeoHiZO/1ii3uR
	Mnl5WloN5ASKL8OnuQmpHUeQzxGnmtBC+pkZFUsBFdfzi41Vfs/8SpaL3t7psiqivC6yO/TKiK9Lj
	9U+W4ok6L8jto6xSdwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtt-00000000wZW-1AIT;
	Sat, 28 Nov 2026 16:03:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKto-00000000wM9-1dwN
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c516a192844so999783166b.1
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881819; x=1796486619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=cbC/L0zdiUP4gIJCifURAtjic1bGv1zW06+C3FX3EAdOS/x9bk1fDrrjQ8VqoawwQ6
         q2d+yjQS3MozF3eIiUiGdihSzU3U+RjmCdFYEmSZc2G35UqxvEMISfwKXofDbTdbToHB
         1zKyx9H/nH0/vWLajCzwkNq2sSaEYXzQiOyfqqd9p4vW7VW6xJIcGNjZzmo3n0oF7Xsv
         Xa4Mn92u+jyMgf/tLV4xNaRmb7SgXmdu4b1zCG5IgZoKw2/d3bhvRh3FE0x8XVkugzxZ
         +HXh7bpcCIbhJ6DqIak5Cs1IBU1af30/0i3KZuTOVEeC3SwdbXgsvRQkCcZxWPFngi6E
         LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881819; x=1796486619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0KqIf20BL/9VhpTuh3BbPHRdDbiuv9sbaK8NTXw8wk=;
        b=PsYNsKSttHsIoBKA/1dvgZ7r5sl8pWluu/27QgOeifBHDHaVLT6RruUnKsthh66JKN
         AKH+x0b1ZuNdXGtgOOx/1Zz2ezPW4gCHKBvUVT1yObtWEalRELHLU+bv0Vh8sQq2Lqx7
         Vb1GD+wq5wpuDEUEnTBpA9tUkkOIqIwK5hxy+78D0e8kTPAS6dTKxDosk3fwCk4AFoBS
         q2zK7CGLSiePLJAxO1c1yE81wNEj2qjUQ5gOoTOVE4TKPNBeHREFpN706rdNcD/vG+FD
         LU8kWO/0XnOHsN3hXux1vlx0QOcv+yt2gMtDQQ1NDNFwjtX6YaMd93wZbQrADfFpYpHn
         jckQ==
X-Forwarded-Encrypted: i=1; AL+hErGeYGb82EXgX2xzMhiAJJUCkUXkv88m36P8APTAPpBuiZVAdXv5gaNVEkVASNa/DMW/zyrwkHo=@lists.infradead.org
X-Gm-Message-State: APuU4Z9jfDMhqalivOsqxOxuaqqioeabgKDRq1+py03sw+551Bau1rbe
	2UNHmvPSNxA8Qg34+BbgnsXUa7MSQsLE0j4w+RDyaqZRraY7cf3i1GEmQ9MpH33fzQ==
X-Gm-Gg: AZFdTZfitI3h3qKNyJ3HI29bemf3OIYMwV3SVnDqcQpRELqcoq+/DDxnR4h/OmbgNCr
	607ZNB3FcQ25+P7jvC9ZUVTTexPh6FK0GdQN7sXTZcWTXTS4/fe8HijHOnGPupM4tIMC9o9UXJV
	Vww9c9WtwVvaZaScd0oTQy1JeEAn/8JUPmQoZ12AjLeIlM/v4X6vVqkRd0Rl3hv5i78uVvqUHeF
	ooJAjepBW9tzXCPLXVmmySx5XYoLBdE5tSqnP37nxZpxCM27GovH3Iz0ng3A8xfoGdqM7pt3j2x
	3hoyaKly/WIaRogitLbECEuZSwXGuMpQaF1RU1kvyS1h6zGS1Sd4P+mkMWJfu7jJNISkbfWjNAt
	L1BRAaMX87h7eTDqfhpj/Cr/8ZmV5+ZhwB6K81dDPqjgfYqVoZCq4MCa57droei7AXshKUwhQ+M
	Cj0oclNg/5W3i8lJBrgmU+Yxo50bWLKKsINBkfN+gt4OKSNF8VcCyWTnCEruj7NPvTU375ePpYC
	O/4J+kJxGmT1Yy7GeGjYoNgcb1PWeNiHcujsXI9JRdC31QJ7UjxAcqu5l1apIc53BrZ00vPhftW
	oZgSKaE3rcUgugO/uIAgAI3JBC63n7CGCXsesMZLT9buS35vV1ZSNFKbOQ9l0XHd4NFWB0EPptQ
	wb8eRuc3crTxjcwBClG/wHwnbfFgQCaBBcNZWrbTT2DXomfAXj858ilki4N/1G5YTMqbPBqWqwo
	uIeJp82spSU4f8znDpUo/YMFsgNQiTIuoy5sPjUAh4NSWg5+g7Tlu/L8k+SmpeLoX6gnmwdWBas
	Um9yQsdLCvRGXbVO7QYAaXj5FpcGSs2BhIv6SATnDXGLsvFxYwXn5z3WD+SpYwGMITmxTZedXiY
	sFtoqhrjJ95W9g==
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id a640c23a62f3a-c513aaad90bmr2317289066b.39.1795881818727;
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:38 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 7/7] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:35 +0100
Message-ID: <20261128160335.1815537-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080340_629928_348DC00D 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
from the rx descriptor data of the MSDU, or IEEE80211_NUM_TIDS when the
MPDU has no QoS control. The TID field has 4 bits, so add the QoS
control valid bit of MPDU_START to struct hal_rx_desc_data.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Take the TID from rx_info instead of rxcb->tid, which
  *rx_status = *status overwrote before v1 read it. Found by the
  hosted Sashiko review of v1.
- Pass IEEE80211_NUM_TIDS for a frame without QoS control. Found by an
  LLM review (Claude).

 drivers/net/wireless/ath/ath12k/dp_rx.c             | 2 ++
 drivers/net/wireless/ath/ath12k/hal.h               | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 9 +++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 9 +++++++++
 5 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 52838ade1b1d..cfa539df09d2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1409,6 +1409,8 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = rx_info->qos_ctrl_valid ? rx_info->tid :
+						    IEEE80211_NUM_TIDS;
 
 	/* TODO: trace rx packet */
 
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..0c61a08f4374 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -739,6 +739,7 @@ struct hal_rx_desc_data {
 	    is_mcbc:1,
 	    seq_ctl_valid:1,
 	    fc_valid:1,
+	    qos_ctrl_valid:1,
 	    is_to_ds:1,
 	    is_from_ds:1;
 	u16 msdu_len;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..3f0dfeedcb31 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -260,6 +260,12 @@ static bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(struct hal_rx_desc *des
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(struct hal_rx_desc *desc)
 {
 	return le32_get_bits(desc->u.qcc2072.mpdu_start.info4,
@@ -403,6 +409,8 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->seq_ctl_valid =
 				ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcc2072(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcc2072(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcc2072(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcc2072(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_qcc2072(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_qcc2072(ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..060e5ea1f7fd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -722,6 +722,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.qcn9274_compact.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1024,6 +1031,8 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_qcn9274(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_qcn9274(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_qcn9274(rx_desc);
 	rx_desc_data->is_from_ds = ath12k_wifi7_hal_rx_h_from_ds_qcn9274(ldesc);
 	rx_desc_data->is_to_ds = ath12k_wifi7_hal_rx_h_to_ds_qcn9274(ldesc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_qcn9274(rx_desc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..3751bf8589ba 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -340,6 +340,13 @@ bool ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(struct hal_rx_desc *desc)
 			       RX_MPDU_START_INFO4_MPDU_FCTRL_VALID);
 }
 
+static inline
+bool ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(struct hal_rx_desc *desc)
+{
+	return !!le32_get_bits(desc->u.wcn7850.mpdu_start.info4,
+			       RX_MPDU_START_INFO4_MPDU_QOS_CTRL_VALID);
+}
+
 static inline
 u16 ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(struct hal_rx_desc *desc)
 {
@@ -620,6 +627,8 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->seq_ctl_valid =
 		ath12k_hal_rx_desc_get_mpdu_seq_ctl_vld_wcn7850(rx_desc);
 	rx_desc_data->fc_valid = ath12k_hal_rx_desc_get_mpdu_fc_valid_wcn7850(rx_desc);
+	rx_desc_data->qos_ctrl_valid =
+		ath12k_hal_rx_desc_get_mpdu_qos_ctrl_valid_wcn7850(rx_desc);
 	rx_desc_data->seq_no = ath12k_hal_rx_desc_get_mpdu_start_seq_no_wcn7850(rx_desc);
 	rx_desc_data->msdu_len = ath12k_hal_rx_desc_get_msdu_len_wcn7850(ldesc);
 	rx_desc_data->sgi = ath12k_hal_rx_desc_get_msdu_sgi_wcn7850(ldesc);
-- 
2.53.0


