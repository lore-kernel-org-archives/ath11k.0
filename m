Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A6C77B60
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4F5/Ttv37JmbHJS3jTG/6+dFKJGEO2L7o/5zPNV0Ek=; b=xCsL+KAiOGT9sN
	tR2rzWfyOfIPef2Yq1uUrHmcoPBevbknNPFW7+Yrr2mgUAVLynN454dKL/v8PQHAw6c96bEaTZpAs
	rHGsuK3gwOwVoBh1sTHhpv9WO7BFHeilWFvGAsv5dNt59iirLyxeUmBNiahOSRY13MY2lZ5CVCmvT
	druPY3isAnm3dCscaWYf7hpDUOTza1B1JrQTboajzOQJ4wc+ZV5STYL8w2rzr1R+dlNucGNImj2oG
	FMRArA0HZHjbQGNIZ7U0MyRbRn6cinP41ZFEEdCpaQFsFDyi28hMfG8VsTMxGis/8kt22LlBiea6y
	1buOprT0go+JHcNW1ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prm4e-004qU3-2D;
	Wed, 26 Apr 2023 20:49:12 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prm4a-004qSu-2e
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 20:49:10 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id rm4TpH0Nn0CGGrm4TpqSEV; Wed, 26 Apr 2023 22:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682542142;
	bh=kp67nxVyh8jZZFZ6p2tHHUiB/eOzKLK57FZQrJ+46xQ=;
	h=From:To:Cc:Subject:Date;
	b=ON2127XtGpB/s0nIKPSntB5hb2UXPGUjJbG0gWF4olqVv8Hsoq17f2CVZnTAqGjPb
	 qjEtnnos6bjixkIl2xHm7tJtBGnev6CIXjI+r/RBc8dW7NbISsUDUB7NnFCE6KypH0
	 lIxOQngLIcbBA0anyIK6DzecaH3umtqq7zENdXUXclYTy/DKWymYNq+2xETADox2Ln
	 6JknIAoEWjhca/1nWp+t0OEBIqnT9ohbdJV9S/ITns9T4XEIYLR/ptN58mKZkhsf7e
	 VCh/NJUXID8JMFj3swQEOh/pTUdav3oHh8fzy8uS4VOPC6FU2an3wKS4a6G2DNd03G
	 A+n8GaFpsjuBA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 26 Apr 2023 22:49:02 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
Date: Wed, 26 Apr 2023 22:48:59 +0200
Message-Id: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_134909_022582_2C1C7A86 
X-CRM114-Status: GOOD (  10.42  )
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

ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
look the same as list_count_nodes(), so use the latter instead of hand
writing it.

The first ones use list_for_each_entry() and the other list_for_each(), but
they both count the number of nodes in the list.

While at it, also remove to prototypes of non-existent functions.
Based on the names and prototypes, it is likely that they should be
equivalent to list_count_nodes().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-tested
---
 drivers/net/wireless/ath/ath11k/wmi.c | 24 +-----------------------
 drivers/net/wireless/ath/ath11k/wmi.h |  3 ---
 2 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index d0b59bc2905a..a55b5fe37ecf 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6548,28 +6548,6 @@ int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 				   &parse);
 }
 
-size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head)
-{
-	struct ath11k_fw_stats_vdev *i;
-	size_t num = 0;
-
-	list_for_each_entry(i, head, list)
-		++num;
-
-	return num;
-}
-
-static size_t ath11k_wmi_fw_stats_num_bcn(struct list_head *head)
-{
-	struct ath11k_fw_stats_bcn *i;
-	size_t num = 0;
-
-	list_for_each_entry(i, head, list)
-		++num;
-
-	return num;
-}
-
 static void
 ath11k_wmi_fw_pdev_base_stats_fill(const struct ath11k_fw_stats_pdev *pdev,
 				   char *buf, u32 *length)
@@ -6880,7 +6858,7 @@ void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 	}
 
 	if (stats_id == WMI_REQUEST_BCN_STAT) {
-		num_bcn = ath11k_wmi_fw_stats_num_bcn(&fw_stats->bcn);
+		num_bcn = list_count_nodes(&fw_stats->bcn);
 
 		len += scnprintf(buf + len, buf_len - len, "\n");
 		len += scnprintf(buf + len, buf_len - len, "%30s (%zu)\n",
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 92fddb77669c..91bc3e648ce1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -6372,9 +6372,6 @@ int ath11k_wmi_send_pdev_set_regdomain(struct ath11k *ar,
 				       struct pdev_set_regdomain_params *param);
 int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 			     struct ath11k_fw_stats *stats);
-size_t ath11k_wmi_fw_stats_num_peers(struct list_head *head);
-size_t ath11k_wmi_fw_stats_num_peers_extd(struct list_head *head);
-size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head);
 void ath11k_wmi_fw_stats_fill(struct ath11k *ar,
 			      struct ath11k_fw_stats *fw_stats, u32 stats_id,
 			      char *buf);
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
