Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6D3C433FE
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAC160F3A
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBAC160F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y36JjoLLpi1inct3anzp5MeZcB0MCFB6kBqMuII3Ed8=; b=ax8wXYqgCU8KPu
	wEl/UDxfI0qSkNMKUlRy6jdyxRtWW2z15dGEwLjXYfkSkb4YSJ3PccNtSqUKdwAkVd5i/BXdbt4EJ
	Z+cSFCq87UIwo0Xlqd33tYjFEpP4Bkn9hDaXn9Fx9SrYsPWT5xONrNqaGIZ5kkSBi91SW4d3PrxgN
	vgrjm6sVNj4nzMil+QRX7ufHq1hpU1ZxJMBujm9iarQKI/coZiWrCznp50qZOWgOibYY498lf9mhy
	syFJ+G4xFLa4qQnzXjLGiarYw2stDFn2dSAeV0m8Q+yFOinxwOY5dIkOqgkc3Wp9az8nI+TDna67s
	P5Da4bkMKHYAktHH9rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqIb-002t1w-V1; Mon, 13 Sep 2021 18:03:21 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqIV-002t0x-OT
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:03:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556198; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WrTk85o6jVDyoyJoxKXGeRyBbmUALZxD8Ub4V/fI9HA=;
 b=N2wWjMm7gF0CLPNQGRJsL0cuDsdtSWfXtqot+GKN91gzWOSoyAGFjGN+lntG9AcnYRkUH00x
 Z2w++u87Yx9Ty6QUIflc0FnsBghucj35YADK78DkPU4ZLnqq/Dceq1G++qHj4UdRny829jap
 teQw+NDhesCAsz4LwlWm57Vfebc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 613f9255b585cc7d240f6d83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:03:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 948B1C4338F; Mon, 13 Sep 2021 18:03:01 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CDEA1C4360D;
 Mon, 13 Sep 2021 18:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CDEA1C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/5] ath11k: Drop MSDU with length error in DP rx path
Date: Mon, 13 Sep 2021 21:02:43 +0300
Message-Id: <20210913180246.193388-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180246.193388-1-jouni@codeaurora.org>
References: <20210913180246.193388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110318_925784_3790E513 
X-CRM114-Status: GOOD (  12.93  )
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

There are MSDUs whose length are invalid. For example,
attackers may inject on purpose truncated A-MSDUs with
invalid MSDU length.

Such MSDUs are marked with an err bit set in rx attention
tlvs, so we can check and drop them.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0c27eead3e02..c50f70913583 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -142,6 +142,18 @@ static u32 ath11k_dp_rx_h_attn_mpdu_err(struct rx_attention *attn)
 	return errmap;
 }
 
+static bool ath11k_dp_rx_h_attn_msdu_len_err(struct ath11k_base *ab,
+					     struct hal_rx_desc *desc)
+{
+	struct rx_attention *rx_attention;
+	u32 errmap;
+
+	rx_attention = ath11k_dp_rx_get_attention(ab, desc);
+	errmap = ath11k_dp_rx_h_attn_mpdu_err(rx_attention);
+
+	return errmap & DP_RX_MPDU_ERR_MSDU_LEN;
+}
+
 static u16 ath11k_dp_rx_h_msdu_start_msdu_len(struct ath11k_base *ab,
 					      struct hal_rx_desc *desc)
 {
@@ -2525,6 +2537,12 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	rx_desc = (struct hal_rx_desc *)msdu->data;
+	if (ath11k_dp_rx_h_attn_msdu_len_err(ab, rx_desc)) {
+		ath11k_warn(ar->ab, "msdu len not valid\n");
+		ret = -EIO;
+		goto free_out;
+	}
+
 	lrx_desc = (struct hal_rx_desc *)last_buf->data;
 	rx_attention = ath11k_dp_rx_get_attention(ab, lrx_desc);
 	if (!ath11k_dp_rx_h_attn_msdu_done(rx_attention)) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
