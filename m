Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9C8C83F22
	for <ath11k@archiver.kernel.org>; Tue, 15 Jul 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDPjmv3LEWDCBb9fA78/k0Uz/0ozwN9L8y+fFs46MNU=; b=KYVxS/y8meN9QgSYURx5y8IGIS
	JIoTovr4SMf1psqUitf1F10CFaHZAhZ4wtkYQzAaVDwVvZja8R9TKmdKLr9LdcCWVT8xybZVhRTbc
	gRxX7TVCV10910IxLSdpthbEMP8DWAfAXybEDnFRppXTl28kB8HhB/Q1WsQcFrXEAhmZOHNQvn6z2
	TIDCzMSXsZX6qmE5ybUhX35vjNPVzdFJNAJ1gwcVpegwEy3Q2CU5iG1abKAYSNi9fESWR9QVrlwRU
	nvCPpRlXUH3js+yuw3vfMc7h70EgEB6XTPIKZX74LOTw7ouXIStAhK2EIRE1IhK40yOwh7nuz8f8X
	/THz09Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgy9-00000005RVI-3H5H;
	Tue, 15 Jul 2025 14:49:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubffB-00000005CQk-0lLV
	for ath11k@lists.infradead.org;
	Tue, 15 Jul 2025 13:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752585847; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZVG2fuf9IkoShLnMJ+0FksgGRRohYKjrlPa30aqFmRitabW7R2nYYmsCwDJjC54xAaf0rmrqRRPz50UiDJdUGcwL7mJqMB1XW6LT3Ui5t5acdCTeU7sxm6sBxMex5Sli76K5JABMUigTEu/zuOt1LiEP8qn08+ty2y4xz7MG0dc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752585847; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yDPjmv3LEWDCBb9fA78/k0Uz/0ozwN9L8y+fFs46MNU=; 
	b=OU8dCDgwZT1HsjCe3ad9QPeWr6zUmuOPv1c83KvsLVKBBo5stH+tEycJGEVr1nNl9MAOUdJqPSaT6GXz9xCDqaVaLCDHkweHPLc1AV7CwTM6HVl4ugxQQ1pNgNTZkTZhsJusoK33kWqYxaRoJdvtM0XXpAhw/dpcBrL0hafL/3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752585847;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yDPjmv3LEWDCBb9fA78/k0Uz/0ozwN9L8y+fFs46MNU=;
	b=b1VUHq9Z909pI6HmnxYCx+SQ8VQCp663xgQ6zTE/pJxicvsyUdnEzm1B36tmlwJG
	zk6pH0PCH9MvUhd/ubbjWbWUkpqLgCsVv+xQTKwokQWYeXzqnPjNLYPDWS18LHD3vH4
	pMgxYD9pohvpKufEpnOutmzhYWwAUuTWFmpMNQD4=
Received: by mx.zohomail.com with SMTPS id 1752585844627311.6253288130798;
	Tue, 15 Jul 2025 06:24:04 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	kbuild test robot <lkp@intel.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	stable@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again
Date: Tue, 15 Jul 2025 18:23:50 +0500
Message-Id: <20250715132351.2641289-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062541_284222_58F4CEE7 
X-CRM114-Status: GOOD (  11.12  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Don't deinitialize and reinitialize the HAL helpers. The dma memory is
deallocated and there is high possibility that we'll not be able to get
the same memory allocated from dma when there is high memory pressure.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Cc stable and fix tested on tag
- Clear essential fields as they may have stale data
---
 drivers/net/wireless/ath/ath11k/core.c |  6 +-----
 drivers/net/wireless/ath/ath11k/hal.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath11k/hal.h  |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 4488e4cdc5e9e..34b27711ed00f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
-	ath11k_hal_srng_deinit(ab);
+	ath11k_hal_srng_clear(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	ret = ath11k_hal_srng_init(ab);
-	if (ret)
-		return ret;
-
 	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index b32de563d453a..dafa9bdbb3d32 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1359,6 +1359,18 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
+void ath11k_hal_srng_clear(struct ath11k_base *ab)
+{
+	memset(ab->hal.srng_list, 0,
+	       sizeof(ab->hal.srng_list));
+	memset(ab->hal.shadow_reg_addr, 0,
+	       sizeof(ab->hal.shadow_reg_addr));
+	ab->hal.avail_blk_resource = 0;
+	ab->hal.current_blk_index = 0;
+	ab->hal.num_shadow_reg_configured = 0;
+}
+EXPORT_SYMBOL(ath11k_hal_srng_clear);
+
 void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
 {
 	struct hal_srng *srng;
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 601542410c752..839095af9267e 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -965,6 +965,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
 			  struct hal_srng_params *params);
 int ath11k_hal_srng_init(struct ath11k_base *ath11k);
 void ath11k_hal_srng_deinit(struct ath11k_base *ath11k);
+void ath11k_hal_srng_clear(struct ath11k_base *ab);
 void ath11k_hal_dump_srng_stats(struct ath11k_base *ab);
 void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
 				       u32 **cfg, u32 *len);
-- 
2.39.5


