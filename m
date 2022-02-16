Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E0C43217
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owFlzAa7/uVoapRYZFptvN9jny3MkxyfuCdn5aFv1ZI=; b=iN8VHeBgH/832L
	3GMZYZO2aFJMplab+Vp4vIEVEUZajp8+hsI0OsQIjdkVKDJcfUOym5azuxRHYd1F3mNmegGg8C9U7
	OhpCXzWmNEi5S7LWYMrDASLE7IU1qvwkOm5BBi/yMNpcvKNUMFZIQM6EibUum1hgMnbocjTNitMDP
	i3OixY50dzLRyb1wmr5ql1CBooCqaUBUGAqgeRdrgESHyhsBsb0bS1ZePZYJHC4uEsjljrmJkkmwk
	D5cCikYO4n85/wEwrc67WDd7YxoxzwjRRaNQPQOE33kWhidEmcv2/x8suKeRwiDjR0liwBTiA3h46
	10vEjYiIRUTDVFhUH6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHBx-006SBU-OG; Wed, 16 Feb 2022 10:05:45 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHBs-006S8k-VK
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 10:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645005941; x=1676541941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LThbDbeBI+iFBZRU/6mlR2Z3ILJJwrgIMGnVmW0fAdA=;
 b=JSUhiMoV35UnmHTXuNUGviJRgmJM9h4dFE35vUVK71Ajek+J5K0qzAI3
 dmac0KRCyKeCoVVbbTHzVxgI2fQiW5tT1sTe5C7bgPY6LTlomzrriULlL
 I3e8VmTla/yK5a3t1Ir9qJlLiomkTK9Ocgk+zPdkEkWCwa++sm1S0dduH A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 02:05:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:05:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 02:05:40 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 02:05:38 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCHv2 3/6] ath11k: register relayfs entries for CFR dump
Date: Wed, 16 Feb 2022 15:35:19 +0530
Message-ID: <1645005922-7252-4-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_020541_066199_3E6DFD45 
X-CRM114-Status: GOOD (  13.44  )
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

Provide a relayfs interface to collect the CFR dump from
the user space.

'/sys/kernel/debug/ieee80211/phyX/ath11k/cfr_capture' is exposed
to user space to get CFR data.

CFR format to user space:
 ___________________________________________
| CFR header | CFR payload | CFR tail data |
|____________|_____________|_______________|

CFR header contains the following fields,

* Start magic number 0xDEADBEAF - 4bytes
* vendor id - 4bytes
* cfr metadata version - 1byte
* cfr data version - 1byte
* chip type - 1byte
* platform type - 1byte
* CFR metadata length - 4bytes
* metadata - 92bytes
        peer mac - 6bytes
        capture status - 1byte (1 for success 0 for failure)
        capture_bw - 1byte
        channel_bw - 1byte
        phy_mode - 1byte
        prim20_chan - 2bytes
        center_freq1 - 2bytes
        center_freq2 - 2bytes
        capture_mode - 1byte
        capture_type - 1byte
        sts_count - 1byte
        num_rx_chain - 1byte
        timestamp - 4bytes
        length - 4bytes
        chain_rssi - 32bytes (4bytes for each chain)
        chain_phase - 16bytes (2bytes for each chain)
        cfo_measurement - 4bytes
        agc_gain - 8bytes (1 bytes for each chain)
        rx_start_ts - 4bytes

CFR payload:

CFR payload contains 8bytes of ucode header followed by the
tone information. Tone order is  positive tones, followed by
PHY memory garbage, followed by negative tones. Dummy tones
are uploaded to make number of tones always integer number
of 64. Number of tones is not preamble type dependent.

Each CFR tone has 14-bit I component and 14-bit Q component
and is sign extended to 16-bit I/Q. Two tones are packed
into one 64-bit unit as:

[63:0] = [Tone1_Q(63:48) Tone1_I(47:32) Tone0_Q(31:16) Tone0_I(15:0)]

CFR tail: end magic number 0xBEAFDEAD

Tested-on: IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c | 43 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index 3d20082..4cf9fe3 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -14,6 +14,32 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
 	return 0;
 }
 
+static struct dentry *create_buf_file_handler(const char *filename,
+					      struct dentry *parent,
+					      umode_t mode,
+					      struct rchan_buf *buf,
+					      int *is_global)
+{
+	struct dentry *buf_file;
+
+	buf_file = debugfs_create_file(filename, mode, parent, buf,
+				       &relay_file_operations);
+	*is_global = 1;
+	return buf_file;
+}
+
+static int remove_buf_file_handler(struct dentry *dentry)
+{
+	debugfs_remove(dentry);
+
+	return 0;
+}
+
+static const struct rchan_callbacks rfs_cfr_capture_cb = {
+	.create_buf_file = create_buf_file_handler,
+	.remove_buf_file = remove_buf_file_handler,
+};
+
 void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
 				 u32 buf_id)
 {
@@ -87,6 +113,11 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
 		ar = ab->pdevs[i].ar;
 		cfr = &ar->cfr;
 
+		if (ar->cfr.rfs_cfr_capture) {
+			relay_close(ar->cfr.rfs_cfr_capture);
+			ar->cfr.rfs_cfr_capture = NULL;
+		}
+
 		ath11k_cfr_ring_free(ar);
 
 		spin_lock_bh(&cfr->lut_lock);
@@ -151,6 +182,18 @@ int ath11k_cfr_init(struct ath11k_base *ab)
 		}
 
 		ar->cfr_enabled = true;
+
+		ar->cfr.rfs_cfr_capture =
+				relay_open("cfr_capture",
+					   ar->debug.debugfs_pdev,
+					   ar->ab->hw_params.cfr_stream_buf_size,
+					   ar->ab->hw_params.cfr_num_stream_bufs,
+					   &rfs_cfr_capture_cb, NULL);
+		if (!ar->cfr.rfs_cfr_capture) {
+			ath11k_warn(ar->ab, "failed to open relay for cfr in pdev %d\n",
+				    ar->pdev_idx);
+			return -EINVAL;
+		}
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index c050f03..f39b82c 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -46,6 +46,7 @@ struct ath11k_cfr {
 	struct ath11k_dbring rx_ring;
 	/* Protects cfr data */
 	spinlock_t lock;
+	struct rchan *rfs_cfr_capture;
 	struct ath11k_look_up_table *lut;
 	u32 lut_num;
 	u32 dbr_buf_size;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
