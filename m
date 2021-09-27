Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3B8C433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE60604D1
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE60604D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eD172ZJkLAA7XkPIaTxwuRHmam48MxIvPO6T1aQh9t0=; b=ziNG+hii2LbgXu
	ycrl8Kjo+B/fUvXGnZv/bU5L5a8yiatUGIbpkyMbZxBXN0FZ+Xu22wsYj45m3pYsHcoEtgK3n2Fyx
	AnmW9p0y1KgjoAfK0rz7hGAnHOkWiKVoO5Ncq5R367L/zRaf0K/nm4SpFsXb8vlufayuFfXpiLBFg
	hHkdiCHbkUc1F8vCGh0jPirMbOgXdS8WVEvJZB0LeL7PYbKOifEpPuXSckuGHePc0ALWmGUfpx3Nf
	5PRIzzh2LRFZFJkO7p/BCdxyWZrEmWfslNTvTpQNIjdhbRJQc8LHfh61J3HyMq/OkAkI4NbrRXz1l
	9tuCbeGLKOEz5aFyU/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsFC-00332e-VC; Mon, 27 Sep 2021 15:08:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsEn-0032rp-Mk
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 15:08:15 +0000
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D27D3402DF
 for <ath11k@lists.infradead.org>; Mon, 27 Sep 2021 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632755283;
 bh=1q/DcpUc3XiR6bWmSAxCheMZIC3a2GduwPENrVEfX+Q=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=eXE/txZpIV2+fxANN9Ox66B3tFfzEY3V0PsootPnsxm1flfq6ePaVAqgPhEWsVJ9t
 OOqRFF3h1rx+ohaUDw4NjJyrehqoy1FPAQxiyp6LF3Nu5cXRROUPXzKe3kJx5BuBYn
 Q+78ynW1/R7V5+Tf2qLrDQhfsO2kQigoBX/chXsGRHaeCTQp75EcJ7vnr0uLe2tXTa
 +DiqlOVR5HMAU8BGtTG6p6C6wYu/Usw+jnwDaXnWxW3pLb9gwlvCpdiL17l/AvDS3Z
 mtyHKEIfCVehM+JxgjSksge+61RvpoCaQQIN8TzBpRonGTIPW65xHCNKXPT8EfXrGz
 iM7Iu0k/v/yuQ==
Received: by mail-pg1-f199.google.com with SMTP id
 h10-20020a65404a000000b00253122e62a0so13109158pgp.0
 for <ath11k@lists.infradead.org>; Mon, 27 Sep 2021 08:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1q/DcpUc3XiR6bWmSAxCheMZIC3a2GduwPENrVEfX+Q=;
 b=QXSVLTzG/fGWIfqBF/skr4CjEZ8Wizfek5dB04Rws4wAgYuK1rA0KC4K9RyqFc+yeR
 /hFV+wz0tKGUHMNsJqJXj94LOpGFUjzY2mDG6sIfMsTBzQd+MTDhufR2r4xNoRp6fNTz
 rFe3YPDyfdFM6Axf+ZTQv/xegH/JrlUkoyH8JK0A3HjAU3bMfxJXPWLBvkm1ziYliv1x
 m0g8CE5GBdck9/+BGMBDXLjgpFCN2EdM9bbGf/3scj6aZy18g02Py0V4O0XIqdf3OQbR
 vlbVIQfV74rhynW1gDLJWetNnr9tT6/PbKOKSczumTdHOJvLhMuRkhVJLML8bIWeJfKe
 ULvA==
X-Gm-Message-State: AOAM5330D3QrDK7ro7nujy5hFRPrjZpRu6ojaonZWOl+mvlE6E7jcrCQ
 dELwbdQ5F4RqXWjKtK5IFhcI/aUV9d8qFmbdY6f00sHAZ7ALQ0gUJkXSaSYYrKHoMsd/ne6AZE8
 ZhsqsSFKDs2yLDMoFH3p987OPGdLHsuE0AXLEXSI=
X-Received: by 2002:a17:90a:311:: with SMTP id
 17mr20487556pje.121.1632755281933; 
 Mon, 27 Sep 2021 08:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFzOCZGKP1K5PJtBQasVhwsqVTuP6aOioiRpVP9zX9xcJNqrJjCrwwR7QVLL8geh28dmBKLQ==
X-Received: by 2002:a17:90a:311:: with SMTP id
 17mr20487527pje.121.1632755281710; 
 Mon, 27 Sep 2021 08:08:01 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id i27sm17510152pfq.184.2021.09.27.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 08:08:01 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: ath11k@lists.infradead.org
Cc: tim.gardner@canonical.com, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: Remove unused variable in
 ath11k_dp_rx_mon_merg_msdus()
Date: Mon, 27 Sep 2021 09:07:43 -0600
Message-Id: <20210927150743.19816-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_080813_896221_A2A7856D 
X-CRM114-Status: GOOD (  14.92  )
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

Coverity complains that a constant variable guards dead code. In fact,
mpdu_buf is set NULL and never updated.

4834err_merge_fail:
    	null: At condition mpdu_buf, the value of mpdu_buf must be NULL.
    	dead_error_condition: The condition mpdu_buf cannot be true.
CID 92162 (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
dead_error_line: Execution cannot reach the expression decap_format !=
  DP_RX_DECAP_TYPE_RAW inside this statement: if (mpdu_buf && decap_forma....
Local variable mpdu_buf is assigned only once, to a constant value, making it
  effectively constant throughout its scope. If this is not the intent, examine
  the logic to see if there is a missing assignment that would make mpdu_buf not
  remain constant.
4835        if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {

Fix this by removing mpdu_buf and unreachable code.

Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9a224817630a..7d57952fd73c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4740,7 +4740,7 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 			    struct ieee80211_rx_status *rxs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
+	struct sk_buff *msdu, *prev_buf;
 	u32 wifi_hdr_len;
 	struct hal_rx_desc *rx_desc;
 	char *hdr_desc;
@@ -4748,8 +4748,6 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 	struct ieee80211_hdr_3addr *wh;
 	struct rx_attention *rx_attention;
 
-	mpdu_buf = NULL;
-
 	if (!head_msdu)
 		goto err_merge_fail;
 
@@ -4832,12 +4830,6 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 	return head_msdu;
 
 err_merge_fail:
-	if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {
-		ath11k_dbg(ab, ATH11K_DBG_DATA,
-			   "err_merge_fail mpdu_buf %pK", mpdu_buf);
-		/* Free the head buffer */
-		dev_kfree_skb_any(mpdu_buf);
-	}
 	return NULL;
 }
 
-- 
2.33.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
