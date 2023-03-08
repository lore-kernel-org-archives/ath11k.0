Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E6C742A7
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGt6BN7Tyqk6UXxgsTeUdLTu68XLxLg+9YpZXBcOq+k=; b=rU2R3H64cOUgdG
	IzHGAVKMaMa7fvI9Fdr7yqAbQjU2SqY2jrZMuNWuw4L5QAY6eO/z2z6Ie8A9GydsNAzN2nu3xTp+C
	cWd4lVGX9Slso4epPtSsTgI1W+d+aOaWshQGqWKuF61zoL88L0CrswfBYMRIKwNK7h+Y7LCM1yRZz
	bQPU7TYu8HUAmrRAN7OjidL3/AOCK+lTRqKHiHRJYfoahcXw7oGI6eKHNOjJLH1UM7HAbtq9S7LDX
	XXwu1ZqWA1A1sN0pu7ADnAodYpx+XSCSJsJhb1aZa/HWtl5qK9uJXoqdnQ5cWvJrIlF5vxay6wkEC
	7TDBvguYExxaiN3U4M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfb-005hEw-7m; Wed, 08 Mar 2023 15:25:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfY-005hBv-SE
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 15:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E291B81D2C
	for <ath11k@lists.infradead.org>; Wed,  8 Mar 2023 15:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FFBC433D2;
	Wed,  8 Mar 2023 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678289126;
	bh=SrAq+DDewNQuaVVmmMK7PUrDAUggwmxqEZ7rN80AGB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmHjS0oIiOPyujluEn8Xug0isgdipJ4IuIuERhik4Yy6ZdzSGbgndhEIClphaWcXP
	 WSVyZn7T1SsPq0lzOZw0atkDjNJsk06ywjipjHKLxiMuiEiylJtrBcQyxTHtLBpgc0
	 mOHtHYRcUmLX0ShCxRS6y8Fp9CqXM6InpwbWnuVnyfiWlF8vORdjxYukXETH0boTpv
	 9twG8gyVretuQ179pispswO8l5IpOGUzvzrcebGZo1I3HbQ+mBTntqC2e2NK0ULrLp
	 UpJZjw+a5rsq/TZOyH4DR6k6ThYGlxkx39T3UZC8SLWaRZwmTkJy5CeN+yizk+baLu
	 DSR7Gq1GsfJ5Q==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the firmware via a pointer
Date: Wed,  8 Mar 2023 17:25:20 +0200
Message-Id: <20230308152522.6728-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308152522.6728-1-kvalo@kernel.org>
References: <20230308152522.6728-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_072533_223809_DD6B7AAA 
X-CRM114-Status: GOOD (  18.63  )
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

Currently MHI loads the firmware image from the path provided by client
devices. ath11k needs to support firmware image embedded along with meta data
(named as firmware-2.bin). So allow the client driver to request the firmware
file from user space on it's own and provide the firmware image data and size
to MHI via a pointer struct mhi_controller::fw_data.

This is an optional feature, if fw_data is NULL MHI load the firmware using the
name from struct mhi_controller::fw_image string as before.

Tested with ath11k and WCN6855 hw2.0.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 28 +++++++++++++++++++---------
 include/linux/mhi.h         |  6 ++++++
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 1c69feee1703..5e6e1e340057 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -365,12 +365,10 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 }
 
 static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
-			      const struct firmware *firmware,
+			      const u8 *buf, size_t remainder,
 			      struct image_info *img_info)
 {
-	size_t remainder = firmware->size;
 	size_t to_cpy;
-	const u8 *buf = firmware->data;
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
 	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
 
@@ -392,9 +390,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	const struct firmware *firmware = NULL;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	const char *fw_name;
+	const u8 *fw_data;
 	void *buf;
 	dma_addr_t dma_addr;
-	size_t size;
+	size_t size, fw_sz;
 	int i, ret;
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
@@ -424,6 +423,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
 		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
 
+	if (!fw_name && mhi_cntrl->fbc_download &&
+	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
+		size = mhi_cntrl->sbl_size;
+		fw_data = mhi_cntrl->fw_data;
+		fw_sz = mhi_cntrl->fw_sz;
+		goto skip_req_fw;
+	}
+
 	if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
 						     !mhi_cntrl->seg_len))) {
 		dev_err(dev,
@@ -443,6 +450,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (size > firmware->size)
 		size = firmware->size;
 
+	fw_data = firmware->data;
+	fw_sz = firmware->size;
+
+skip_req_fw:
 	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
 				 GFP_KERNEL);
 	if (!buf) {
@@ -451,7 +462,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Download image using BHI */
-	memcpy(buf, firmware->data, size);
+	memcpy(buf, fw_data, size);
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
 
@@ -463,7 +474,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Wait for ready since EDL image was loaded */
-	if (fw_name == mhi_cntrl->edl_image) {
+	if (fw_name && fw_name == mhi_cntrl->edl_image) {
 		release_firmware(firmware);
 		goto fw_load_ready_state;
 	}
@@ -477,15 +488,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (mhi_cntrl->fbc_download) {
-		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
-					   firmware->size);
+		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);
 			goto error_fw_load;
 		}
 
 		/* Load the firmware into BHIE vec table */
-		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
+		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
 	}
 
 	release_firmware(firmware);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a5441ad33c74..72eef7309736 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -299,6 +299,10 @@ struct mhi_controller_config {
  * @iova_start: IOMMU starting address for data (required)
  * @iova_stop: IOMMU stop address for data (required)
  * @fw_image: Firmware image name for normal booting (optional)
+ * @fw_data: Firmware image data content for normal booting, used only
+ *           if fw_image is NULL (optional)
+ * @fw_sz: Firmware image data size for normal booting, used only if fw_image
+ *         is NULL and fbc_download is true (optional)
  * @edl_image: Firmware image name for emergency download mode (optional)
  * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
@@ -384,6 +388,8 @@ struct mhi_controller {
 	dma_addr_t iova_start;
 	dma_addr_t iova_stop;
 	const char *fw_image;
+	const u8 *fw_data;
+	size_t fw_sz;
 	const char *edl_image;
 	size_t rddm_size;
 	size_t sbl_size;
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
