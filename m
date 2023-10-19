Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5BCDB488
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R67f6ndk+zNm7WZvdyOgIzVHVP84fGvPgUsN1uJjopY=; b=k0swoleTOq8psh
	8p5f0FPHpUGYjBcw3ZTIV0ZqlmZ58d0bwN6tFrox4egWuaNlOvo7T02esKXw4rYDuu0YgQ4TYCVed
	rZifh+zawCqWX/Mw9M9d7/WH3zNOvwggjR0i6dVA/F1sixceyUKAgOvMQ5OFQbBQaTqxpfrGmavBc
	zIaVWx16VbFr2zDpqpOoZrfFOIlPDw5r6xSDktAp8gB4lMLQxOYP6wlu+ihbKXDOrrTQ7PXfu2O+9
	5KCyf64LjTB+W9DrxnGxyIJ6ECQ3gObkNadDSCWk6XqZbpCN45zrkmxKdzom53BUA4xNnQWlxOFUj
	e07meku4LK3OR/hdZ+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV1C-000CZc-2X;
	Thu, 19 Oct 2023 15:33:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV19-000CXs-03
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D423CE2B5A;
	Thu, 19 Oct 2023 15:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6655CC433C8;
	Thu, 19 Oct 2023 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697729576;
	bh=JmxVPCdruKLMQZ5RUKgTCknlS6N8U4MPq35+pkolZUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=POBMJg19qSQ8erDJJsBUAf4QYH8J8D1C98PNUaEeDBax10sfUqooXE+3ZKs22bFFx
	 Tg9fXsoNI6LSy/j0et+lzIy5ceQrs4BsPjQwjk6tD+nHsf2hGul/MyaheRNwH/wszt
	 xHYnJlyz6oQmakAfMzDckwV0XWI316CcWj3YbngQAeHnep2LSdzgNys2eLGFEu5KNM
	 HddIU7Bp2dEJECPMzwA191ONt1VSdxObTlvZ+T1OKmQWSXiA7A6TOvMFzR4bwLKq8l
	 or2NE7fzpEJnHxWyFEMg+AOLSbqyFlZjJejvqN1n0klNmtRYMy+tSULs0BB/IKbE4I
	 Zwz+s+1Czk0Aw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtV1A-0006tC-0o;
	Thu, 19 Oct 2023 17:33:00 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath11k: fix dfs radar event locking
Date: Thu, 19 Oct 2023 17:31:15 +0200
Message-ID: <20231019153115.26401-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019153115.26401-1-johan+linaro@kernel.org>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083259_222554_DA320E1D 
X-CRM114-Status: UNSURE (   7.92  )
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

The ath11k active pdevs are protected by RCU but the DFS radar event
handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
read-side critical section.

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org      # 5.6
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index da1582b8dc30..f0eac6cb84fd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8337,6 +8337,8 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab, struct sk_buff
 		   ev->detector_id, ev->segment_id, ev->timestamp, ev->is_chirp,
 		   ev->freq_offset, ev->sidx);
 
+	rcu_read_lock();
+
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 
 	if (!ar) {
@@ -8354,6 +8356,8 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab, struct sk_buff
 		ieee80211_radar_detected(ar->hw);
 
 exit:
+	rcu_read_unlock();
+
 	kfree(tb);
 }
 
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
