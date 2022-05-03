Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C72C433EF
	for <ath11k@archiver.kernel.org>; Tue,  3 May 2022 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aMeXw2RurZHSmBqn3JrsSEAQ72CfxxeOR5mx6sB6V8U=; b=Zwe5py6IeFxgs5
	tqiRtgU17w0Z+Y2wY2Rfj1nyZMwP234DyYHtsZTEOX1cM36atXiFG3c8CrFNvN5HB5VoECQgBlYsT
	/rBkr1tCGEZDtzSiaedumCJ8fRfKN3YLAm+R30xEJq1yKcryolrW23g3zGHWPe5MxErZS/R7qSvsa
	g0hC4Bs0UFBpgS1mi+iuuiYfSBLj4dh6Ol3CcZIjOKCJWFsKMda8fdJ9O4Oqv8Pzj6zYfyhUH9+fe
	cPQY7XyH8rps0sL1PGo/21ssgfC97qjxanAZcKW/5EBCJv2y4X3ZkiezEKiWGOkB5rjX3wTtphaxq
	6pOlgluCSnDfjA0qO8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlle4-003ny5-F3; Tue, 03 May 2022 06:04:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlle1-003nvB-Tu
 for ath11k@lists.infradead.org; Tue, 03 May 2022 06:04:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28E0DB81C86
 for <ath11k@lists.infradead.org>; Tue,  3 May 2022 06:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D87C385A4;
 Tue,  3 May 2022 06:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651557857;
 bh=JaeLcKSUKWQsW5Alndt0sH184FKi93Smpt1/is3vpHA=;
 h=From:To:Cc:Subject:Date:From;
 b=J/j0Wkg6UpjKxWZvnOObpehI351Y6yyC/EuUjSNIh3+JBI5KzUSNqUIJ5mYB5erxn
 4Xpeiqf/OY3Rs/MbwdI+FgMsHZ9APGDZL+oD7Ds8auwbqG8Iw9+dR4DaCVa4caX7RZ
 KJeqc9cNPGuSCECqGXlBcd0i7WlrJRmmfNQsm2ysElp2GfNpw/TZHf0Pw0cY2Cghou
 TKG85ITnhjc/lnFInP34Ix6do2p5CNeyV0HNx2hPm27rlVftokk0wtlhchWGjsFjNg
 GNSXSGV5Ew/BEySvqnUQF567WGnoahMdd831PzT5yCyg1oCevKicgOKXAh4+Refg5T
 hz5Qb5Thy6uOg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] ath11k: mac: fix too long line
Date: Tue,  3 May 2022 09:04:14 +0300
Message-Id: <20220503060415.24499-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_230422_142868_9B21D4F8 
X-CRM114-Status: GOOD (  10.80  )
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

checkpatch warns:

drivers/net/wireless/ath/ath11k/mac.c:7760: line length of 91 exceeds 90 columns

This was introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling for
MLO support").

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c76cac5d6849..32fb0142124d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7735,6 +7735,7 @@ ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar, enum nl80211_b
 	bool he_fixed_rate = false, vht_fixed_rate = false;
 	struct ath11k_peer *peer, *tmp;
 	const u16 *vht_mcs_mask, *he_mcs_mask;
+	struct ieee80211_link_sta *deflink;
 	u8 vht_nss, he_nss;
 	bool ret = true;
 
@@ -7757,13 +7758,16 @@ ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar, enum nl80211_b
 	spin_lock_bh(&ar->ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ar->ab->peers, list) {
 		if (peer->sta) {
-			if (vht_fixed_rate && (!peer->sta->deflink.vht_cap.vht_supported ||
-					       peer->sta->deflink.rx_nss < vht_nss)) {
+			deflink = &peer->sta->deflink;
+
+			if (vht_fixed_rate && (!deflink->vht_cap.vht_supported ||
+					       deflink->rx_nss < vht_nss)) {
 				ret = false;
 				goto out;
 			}
-			if (he_fixed_rate && (!peer->sta->deflink.he_cap.has_he ||
-					      peer->sta->deflink.rx_nss < he_nss)) {
+
+			if (he_fixed_rate && (!deflink->he_cap.has_he ||
+					      deflink->rx_nss < he_nss)) {
 				ret = false;
 				goto out;
 			}

base-commit: f39af96d352dd4f36a4a43601ea90561e17e5ca6
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
