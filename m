Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53D2C6FA8E
	for <ath11k@archiver.kernel.org>; Sun, 26 Feb 2023 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKI2OfaivhS2+ILQW7BVIvWG16CYpxt2FTw25eCbfX0=; b=FP7du/pENtA9zY
	Bx1pQGUksEfMAGVngEjZCfW1v1S5XdwZUV8XchnsIR0mEVVr3NDG5Ac7xSXwXMfP2L4+oCN71Td8K
	Fcnus8c9s+1sS6RqmdEn6GKh3WbC/HnDyn+notejqFSPK5HH/12HvDJyUvWyY1WYiac/ZkeU8Lo2b
	muL7CHUY2uev9SRASqYtf2owHB4esXkULffiPy9KtG0fmsNc6cNNCO/nY7dcJNazDFir4VYQMVaK1
	3rPBmuudvfvEaypdiP8bgyLnGcDqdVv7i8pM9C9aZMfyW9uyKpoTjivNEL2zmf+R8Mzj2dTvJ7lM9
	k21T1VV+4WCGIoKQqRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIKn-007QCs-2s; Sun, 26 Feb 2023 14:49:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIKj-007QB3-UE
	for ath11k@lists.infradead.org; Sun, 26 Feb 2023 14:49:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74CEE60BEB;
	Sun, 26 Feb 2023 14:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBA8C433A0;
	Sun, 26 Feb 2023 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677422940;
	bh=CUBmYu+VDOfw3tRx9G3iyf4SSGdnOxDE+tA/8QYyjcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FiNgfrbIvlINVTSI8q2N+E8h0QQq00v9HM57mMj6O4Q6RtGfblmSu2onajLy1wDVd
	 p9vYWmU/HuuMVmU4ImKnOynD6FAP929F0Zim/CMp1SqAM9LazOR9EzVJQtV6k3stj8
	 a/m1BoHj+KGgl+dRU3lF8Y0qoYyc3+qqOi/4KMnnIBznZM9PFIp0p0O8nTLNX0WHmK
	 +qt7wT4/g6ejCJCd6bhNRwRhsjGbirgqX1JP7W2mVt4FZMoev4k1gNXajNdghPgPlt
	 b9mGjmWjLDj2QWMrg+DWv3AfMgAcMHZMZe+aQerX/MfI98LQTPV1hD8a/ViAK7g7Ud
	 pgtULteO+47xA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/36] wifi: ath11k: debugfs: fix to work with multiple PCI devices
Date: Sun, 26 Feb 2023 09:48:14 -0500
Message-Id: <20230226144845.827893-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144845.827893-1-sashal@kernel.org>
References: <20230226144845.827893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_064902_286644_C02487F1 
X-CRM114-Status: GOOD (  18.87  )
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

[ Upstream commit 323d91d4684d238f6bc3693fed93caf795378fe0 ]

ath11k fails to load if there are multiple ath11k PCI devices with same name:

 ath11k_pci 0000:01:00.0: Hardware name qcn9074 hw1.0
 debugfs: Directory 'ath11k' with parent '/' already present!
 ath11k_pci 0000:01:00.0: failed to create ath11k debugfs
 ath11k_pci 0000:01:00.0: failed to create soc core: -17
 ath11k_pci 0000:01:00.0: failed to init core: -17
 ath11k_pci: probe of 0000:01:00.0 failed with error -17

Fix this by creating a directory for each ath11k device using schema
<bus>-<devname>, for example "pci-0000:06:00.0". This directory created under
the top-level ath11k directory, for example /sys/kernel/debug/ath11k.

The reference to the toplevel ath11k directory is not stored anymore within ath11k, instead
it's retrieved using debugfs_lookup(). If the directory does not exist it will
be created. After the last directory from the ath11k directory is removed, for
example when doing rmmod ath11k, the empty ath11k directory is left in place,
it's a minor cosmetic issue anyway.

Here's an example hierarchy with one WCN6855:

ath11k
`-- pci-0000:06:00.0
    |-- mac0
    |   |-- dfs_block_radar_events
    |   |-- dfs_simulate_radar
    |   |-- ext_rx_stats
    |   |-- ext_tx_stats
    |   |-- fw_dbglog_config
    |   |-- fw_stats
    |   |   |-- beacon_stats
    |   |   |-- pdev_stats
    |   |   `-- vdev_stats
    |   |-- htt_stats
    |   |-- htt_stats_reset
    |   |-- htt_stats_type
    |   `-- pktlog_filter
    |-- simulate_fw_crash
    `-- soc_dp_stats

I didn't have a test setup where I could connect multiple ath11k devices to the
same the host, so I have only tested this with one device.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Tested-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221220121231.20120-1-kvalo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/core.h    |  1 -
 drivers/net/wireless/ath/ath11k/debugfs.c | 48 +++++++++++++++++++----
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index caa8f6eba0097..fda1c2db05d0a 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -731,7 +731,6 @@ struct ath11k_base {
 	enum ath11k_dfs_region dfs_region;
 #ifdef CONFIG_ATH11K_DEBUGFS
 	struct dentry *debugfs_soc;
-	struct dentry *debugfs_ath11k;
 #endif
 	struct ath11k_soc_dp_stats soc_stats;
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 554feaf1ed5cd..f827035f0dd2e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -836,10 +836,6 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
 
-	ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
-	if (IS_ERR(ab->debugfs_soc))
-		return PTR_ERR(ab->debugfs_soc);
-
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
 
@@ -857,15 +853,51 @@ void ath11k_debugfs_pdev_destroy(struct ath11k_base *ab)
 
 int ath11k_debugfs_soc_create(struct ath11k_base *ab)
 {
-	ab->debugfs_ath11k = debugfs_create_dir("ath11k", NULL);
+	struct dentry *root;
+	bool dput_needed;
+	char name[64];
+	int ret;
+
+	root = debugfs_lookup("ath11k", NULL);
+	if (!root) {
+		root = debugfs_create_dir("ath11k", NULL);
+		if (IS_ERR_OR_NULL(root))
+			return PTR_ERR(root);
+
+		dput_needed = false;
+	} else {
+		/* a dentry from lookup() needs dput() after we don't use it */
+		dput_needed = true;
+	}
+
+	scnprintf(name, sizeof(name), "%s-%s", ath11k_bus_str(ab->hif.bus),
+		  dev_name(ab->dev));
+
+	ab->debugfs_soc = debugfs_create_dir(name, root);
+	if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
+		ret = PTR_ERR(ab->debugfs_soc);
+		goto out;
+	}
+
+	ret = 0;
 
-	return PTR_ERR_OR_ZERO(ab->debugfs_ath11k);
+out:
+	if (dput_needed)
+		dput(root);
+
+	return ret;
 }
 
 void ath11k_debugfs_soc_destroy(struct ath11k_base *ab)
 {
-	debugfs_remove_recursive(ab->debugfs_ath11k);
-	ab->debugfs_ath11k = NULL;
+	debugfs_remove_recursive(ab->debugfs_soc);
+	ab->debugfs_soc = NULL;
+
+	/* We are not removing ath11k directory on purpose, even if it
+	 * would be empty. This simplifies the directory handling and it's
+	 * a minor cosmetic issue to leave an empty ath11k directory to
+	 * debugfs.
+	 */
 }
 EXPORT_SYMBOL(ath11k_debugfs_soc_destroy);
 
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
