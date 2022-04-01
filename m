Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D05C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QXhB23l81rchBQrd3/85SfJFUuvtPMlIkOL9JhnVj4=; b=pgHoiJqy62anuY
	OzMYLz99i5IELmZW2i+z0P+DPj8c5L0ps4D/8ealu/MY8SUXjvTIhRfEWcTN3DX2EYlUmkldRcava
	slPJw4uzoseZywHETfb2ZE5L4JK+YGEvhcogjxEuu5rlsdx2+jGFfXME6eQVuyzgmzgaD/BwBTCoh
	D4cYRjfYZ9XofKYwfbWlWRfnfVXMq6PU3sSepydkAlp0D+wifaEl3q2PgJMxA6oggTMmP/cQlH6W0
	We/EOuflJlARuW/xzJmTYH0D7ZnNwtjFrrf1FgmHYFvy3A5v709JzziD6Bg0o6nnhHMLHwT9AKLw/
	Bp8XbqovcO/AhsqVonqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naL6r-006i6p-Ls; Fri, 01 Apr 2022 17:30:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naL6o-006i5A-Oy
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 17:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FDD761D19
 for <ath11k@lists.infradead.org>; Fri,  1 Apr 2022 17:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ADAC3410F;
 Fri,  1 Apr 2022 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648834249;
 bh=9u43NB96IkwkW9C2rkSjk9B1Oivm1z1nwWy7IAMbEYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aMLd7n/kEO2kTox1PZXfGkjsy/2uQuDt0UWz5kyVS22ARjDU/ly4iN8wRTK3NK9K9
 xl0eC4otonisR2duGb1ot6gyadQnjwUv/IpkjbutDLzgawU2/ilwAF8F0EguM8sfJ5
 oF11KPnrRPLSZkX07kR12l53M9V4f7tkIn/ClcpAqqfPbUNR9uWxLC6g/K34jwJkH/
 ha5kBkA16Rmysyy3qzWGKRJBqpyx2FL0SKlres/1d0tTdlcwqNvbu01oIk7hw8jAIh
 KRUw/O5Fx7kmMUw5srJtZi8z/OOoOlcfYnUocZnvxteD9XwGuB+NX3+nRLd3yBxwqQ
 KSa6lEUiNAFlQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/3] ath11k: mhi: remove unnecessary goto from
 ath11k_mhi_start()
Date: Fri,  1 Apr 2022 20:30:42 +0300
Message-Id: <20220401173042.17467-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220401173042.17467-1-kvalo@kernel.org>
References: <20220401173042.17467-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_103050_887339_34FD6075 
X-CRM114-Status: GOOD (  11.05  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

No need to have goto for a return statement, so simplify the code. While at it,
print warning messages if power up calls fail.

No functional changes.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 706de7b0b4a1..a372ebb184a1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -463,22 +463,24 @@ void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
 
 int ath11k_mhi_start(struct ath11k_pci *ab_pci)
 {
+	struct ath11k_base *ab = ab_pci->ab;
 	int ret;
 
 	ab_pci->mhi_ctrl->timeout_ms = MHI_TIMEOUT_DEFAULT_MS;
 
 	ret = mhi_prepare_for_power_up(ab_pci->mhi_ctrl);
-	if (ret)
-		goto out;
+	if (ret) {
+		ath11k_warn(ab, "failed to prepare mhi: %d", ret);
+		return ret;
+	}
 
 	ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
-	if (ret)
-		goto out;
+	if (ret) {
+		ath11k_warn(ab, "failed to power up mhi: %d", ret);
+		return ret;
+	}
 
 	return 0;
-
-out:
-	return ret;
 }
 
 void ath11k_mhi_stop(struct ath11k_pci *ab_pci)
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
