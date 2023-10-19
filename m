Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3689C41513
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KOWFayB01DyMMPwto17judzxIiE/8gTHsIwyfpCPHE=; b=KP6Mr93UE7NnFN
	Esb3Bme7UbybDvvm50pGyd8jJE3CMuWtfGsO+HIbigxjFFvB5vn2hj243Gq0ckUAqw43usSXU4Lgp
	PnSAtUt+9PePtmfiUy/tnafwyrMRh8FlfH1ziW5p8xjuZ434gjODRHdlWNOYci6o17fhPxI2io71c
	YA4lMs5ZcoTFQWS0q0SrCzzeJM4QFAtCgexmN4Z4huJke5Yc4CaPfN/JbR5IJ+WwC7+Bawy0EVsoU
	nxVYOj42WEZnA5i6CG4Xh0lno8wVFPC+PG44CaUord1jF0kBsEpuzgFL09gwxgKa/4btUVVO9KcQT
	1iLEadGywPjC/FHGqx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUl-00H3u6-1B;
	Thu, 19 Oct 2023 10:43:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUi-00H3qU-1P
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 10:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6428BCE2B0B;
	Thu, 19 Oct 2023 10:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9BEC433CA;
	Thu, 19 Oct 2023 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697712189;
	bh=+65hIKor49TrWPpX1MZLxHjHl0a9EdHwn7yekofvZVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kz3CVktyrqbK/5jucRIqPe4Bg8/2aUDx5aCC5oLs93UOJ5tvN73wKlRdWq5NTtP+W
	 Mc/TknTyh1iGgz1UoQOadGAH77q/0zr3L/5nkjnJtDc+TUTjMLONonwsLMMLi6/Pew
	 3Hwej3Jtows5gPsRuMU8pPa6+PjI7jxF7eVJ7dgWctg0OqH626yg0pGxs/mE26M9db
	 YX16xbHr8mJY4dsZzDyBYrnUHJXh3pWb/3FbYzuzp/f1/2DMdPtAgJhkyHsBhuSfZb
	 MLmLetIvMB22OLHJZdUvpmCg7XGbuTQ0WektV7RzW8qKEaH8S6nGaT9Zw+wF5tuqb1
	 /yYqoFvMDy3gw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtQUi-0003ao-2U;
	Thu, 19 Oct 2023 12:43:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath11k: fix dfs radar event locking
Date: Thu, 19 Oct 2023 12:42:11 +0200
Message-ID: <20231019104211.13769-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019104211.13769-1-johan+linaro@kernel.org>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_034312_650573_832A2439 
X-CRM114-Status: UNSURE (   7.89  )
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
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 980ff588325d..fe6b70a503d0 100644
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
