Return-Path: <SRS0=fjpk=KA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33669C43461
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 16:31:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DB6613EC
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 16:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93DB6613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ar3cdUIlTdb6ZMz9hMJpkLyzHPbGYGJzH3lT37wmhLU=; b=XUqevxrkrt2DQ/4ZO3Nvlpoi7K
	aOK4u3CF1yXPEVEseF2MzIQpbJ/+mF8PU4F/yWtptXclQbQyIM2fgTOUIbFEQlvL2gRK4voPgX72N
	IfZpM6pgEm66Y8LLF8vzex20KnUDa2X5UjQGTLKUMmyxU0NIhw9tSqJl5cQ+HwZs6klSHthF5tG4Z
	qHiR5dRByAWedyI5LFn7Wb4OVGDY4mikB6GKXqKFepOlWorvK4FwQDnI7F8HDtoLgNWXjcXy7akmx
	thraP5EASAjMjv99+KTfbEy932/ixmHRhM/4o2Su+4WAqyv4NcZbqTX21uUkzWXyRjo8G3f24MS3b
	+bfvlE3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKQv-001eM1-1o; Wed, 05 May 2021 16:31:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKQt-001eLr-H3
 for ath11k@desiato.infradead.org; Wed, 05 May 2021 16:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IhSK8VETl0H+LiNiImQAVn46A2VxKDIqmzECHSFJNUo=; b=hOD9owW7nx4nMoWOAZjS0jIcLP
 AD11iRUQCl3xacYrnTO3jEiMWE4dGCq18UkmJfy+5wBDZGdTjImvTJPbxMTjsanBTQsQBNDz0Y55o
 hAeXswxu07UFoKwm2/pl1D6G6l4v2mU1/tdgg/QrFhO3WK7+pK7TCf+DqDIwVkPvecPUsMiTuOYMH
 HEdbt4z75xcddWlJ/pNuIiMSC7piyVUDedevrQulqrUbp0tX4qeKZQoSs7bBDw3pud9KJ04mhFISY
 LGVGZ0atjKKiIVpvWnmmhQ4BDxY/qNdDJl/y80n8o9byYfRAFUhFVwXKo9f6a/fhZfzGi6kji4tlP
 ZsoyEq0w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKQq-004w9O-Ks
 for ath11k@lists.infradead.org; Wed, 05 May 2021 16:31:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AD9061176;
 Wed,  5 May 2021 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232287;
 bh=GC0JSQP6TWY1b0lfwONIKL+869Qk61wRxyZRS4vVIz8=;
 h=From:To:Cc:Subject:Date:From;
 b=b0Sw1VTBifF255lbkOLmJaO5Tt+/31rE0B7vguzYdVrcW3p1Gt5Wf8gFNSXLR1Aza
 FuhxhWAAWKmc5BbDth5eWD9yQQaEvi/wJbHzytWljJG80A/gtZVXY6JMsNA0J88Cop
 5D7TcQg7TjVDS6auIt5uESbJE7ubUa1vDVNRktKqwwkmSDFMweg2+r/3qfmn+LGOUq
 mJD6PxT/4Zp3y9eIMlpALYLDaX8L3QfpY8SsmQld2mlMeMkBSswnDrPXlLjWvd6xG/
 1Gr8w9HitkGy458yAeDQyOrLS0z+6NFaILVSYyMDaz7smVmShOgIswIqZz64bn+why
 toCXgwTisQUHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Kalle Valo <kvalo@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 001/116] ath11k: fix thermal temperature read
Date: Wed,  5 May 2021 12:29:29 -0400
Message-Id: <20210505163125.3460440-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093128_763262_CEF4CED7 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

[ Upstream commit e3de5bb7ac1a4cb262f8768924fd3ef6182b10bb ]

Fix dangling pointer in thermal temperature event which causes
incorrect temperature read.

Tested-on: IPQ8074 AHB WLAN.HK.2.4.0.1-00041-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210218182708.8844-1-pradeepc@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 53 +++++++++++----------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index cccfd3bd4d27..ca5cda890d58 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5417,31 +5417,6 @@ int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 	return 0;
 }
 
-static int
-ath11k_pull_pdev_temp_ev(struct ath11k_base *ab, u8 *evt_buf,
-			 u32 len, const struct wmi_pdev_temperature_event *ev)
-{
-	const void **tb;
-	int ret;
-
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
-	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return ret;
-	}
-
-	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
-	if (!ev) {
-		ath11k_warn(ab, "failed to fetch pdev temp ev");
-		kfree(tb);
-		return -EPROTO;
-	}
-
-	kfree(tb);
-	return 0;
-}
-
 size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head)
 {
 	struct ath11k_fw_stats_vdev *i;
@@ -6849,23 +6824,37 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 				  struct sk_buff *skb)
 {
 	struct ath11k *ar;
-	struct wmi_pdev_temperature_event ev = {0};
+	const void **tb;
+	const struct wmi_pdev_temperature_event *ev;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return;
+	}
 
-	if (ath11k_pull_pdev_temp_ev(ab, skb->data, skb->len, &ev) != 0) {
-		ath11k_warn(ab, "failed to extract pdev temperature event");
+	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch pdev temp ev");
+		kfree(tb);
 		return;
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "pdev temperature ev temp %d pdev_id %d\n", ev.temp, ev.pdev_id);
+		   "pdev temperature ev temp %d pdev_id %d\n", ev->temp, ev->pdev_id);
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 	if (!ar) {
-		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev.pdev_id);
+		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
+		kfree(tb);
 		return;
 	}
 
-	ath11k_thermal_event_temperature(ar, ev.temp);
+	ath11k_thermal_event_temperature(ar, ev->temp);
+
+	kfree(tb);
 }
 
 static void ath11k_fils_discovery_event(struct ath11k_base *ab,
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
