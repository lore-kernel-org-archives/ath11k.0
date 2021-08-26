Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAB6C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 17:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF1E26103C
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 17:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF1E26103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mhqeFiuSig3dTsIJeS87meLEmau/E3WVe/u+dIiQKOI=; b=WUxjcejd4b+wGW
	/fUA0c0PkLODqNhGeS1aeIn9bwMGBSQyZpBppCrlco9iZ5KASsFJSI9TeGuPuUrfbiZySEdC/nlUO
	LBPuaVKStKPPs25ilcFi7bbj6++90Zgoas7sKjjr9NumLSrZ1rJo/w7edKTCrx+yQDbT+sKPizfdG
	0BeSOGhvSr3kjuc/7otnwsVgCU78uhyjqVE5YMho2610a8TvQ7xQZfY0IWtXzpv/AWU5mWejM7bGP
	YI/kyfKnRjtcgv2umlbjsD5bC9a8l2FPI8trw3lAltZQABJLIkhKgQRZNbrSjU45AwmDoIfuqPpMm
	SEh6XOnethxb4/elSidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJJBL-00AeW0-Bi; Thu, 26 Aug 2021 17:28:51 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJJBF-00AeV6-K5
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 17:28:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629998924; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=PfdLDssuVocpX0OAfjQ6bnz0pnV5VdAo1CkeOfpph+A=;
 b=S70aTt1l6tTcSq/kRMD2pvTTwi0/gnF44hslpFXP3Ln/2gcmguSdCYAtTvsYeS2uH2R8lBGc
 /Zss8DdYWCoe5nLPpuxy6EhS4QkWF82+K75T8bz/uKBCFVGRTeQ8Hv/wvWf6+lVezmD6KfiR
 2uw6V+Am4Tk7Gd3RIQ0f3R6+HNk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6127cf3ad6653df767116e7f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 17:28:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D5F6C43618; Thu, 26 Aug 2021 17:28:25 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9C01C43460;
 Thu, 26 Aug 2021 17:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D9C01C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: netdev@vger.kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev, wt@penguintechs.org,
 manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
 loic.poulain@linaro.org, nschichan@freebox.fr
Subject: [PATCH] Revert "net: really fix the build..."
Date: Thu, 26 Aug 2021 20:28:16 +0300
Message-Id: <20210826172816.24478-1-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_102845_776651_D1F10E38 
X-CRM114-Status: GOOD (  17.49  )
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

This reverts commit ce78ffa3ef1681065ba451cfd545da6126f5ca88.

Wren and Nicolas reported that ath11k was failing to initialise QCA6390
Wi-Fi 6 device with error:

qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22

Commit ce78ffa3ef16 ("net: really fix the build..."), introduced in
v5.14-rc5, caused this regression in qrtr. Most likely all ath11k
devices are broken, but I only tested QCA6390. Let's revert the broken
commit so that ath11k works again.

Reported-by: Wren Turkal <wt@penguintechs.org>
Reported-by: Nicolas Schichan <nschichan@freebox.fr>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h  |  2 +-
 drivers/bus/mhi/core/main.c      |  9 +++------
 drivers/net/mhi/net.c            |  2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c |  2 +-
 include/linux/mhi.h              |  7 +------
 net/qrtr/mhi.c                   | 16 +---------------
 6 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index bc239a11aa69..5b9ea66b92dc 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan, unsigned int flags);
+			struct mhi_chan *mhi_chan);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 84448233f64c..fc9196f11cb7 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1430,7 +1430,7 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan, unsigned int flags)
+			struct mhi_chan *mhi_chan)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1455,9 +1455,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
-	if (mhi_chan->dir == DMA_FROM_DEVICE)
-		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
-	
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1613,7 +1610,7 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1624,7 +1621,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
index 11be6bcdd551..e60e38c1f09d 100644
--- a/drivers/net/mhi/net.c
+++ b/drivers/net/mhi/net.c
@@ -335,7 +335,7 @@ static int mhi_net_newlink(void *ctxt, struct net_device *ndev, u32 if_id,
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
 
 	/* Start MHI channels */
-	err = mhi_prepare_for_transfer(mhi_dev, 0);
+	err = mhi_prepare_for_transfer(mhi_dev);
 	if (err)
 		goto out_err;
 
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index d0a98f34c54d..e4d0f696687f 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -110,7 +110,7 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
 	int ret;
 
 	/* Start mhi device's channel(s) */
-	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev, 0);
+	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5e08468854db..944aa3aa3035 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -719,13 +719,8 @@ void mhi_device_put(struct mhi_device *mhi_dev);
  *                            host and device execution environments match and
  *                            channels are in a DISABLED state.
  * @mhi_dev: Device associated with the channels
- * @flags: MHI channel flags
  */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
-			     unsigned int flags);
-
-/* Automatically allocate and queue inbound buffers */
-#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
 
 /**
  * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1dc955ca57d3..fa611678af05 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -15,7 +15,6 @@ struct qrtr_mhi_dev {
 	struct qrtr_endpoint ep;
 	struct mhi_device *mhi_dev;
 	struct device *dev;
-	struct completion ready;
 };
 
 /* From MHI to QRTR */
@@ -51,10 +50,6 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	struct qrtr_mhi_dev *qdev = container_of(ep, struct qrtr_mhi_dev, ep);
 	int rc;
 
-	rc = wait_for_completion_interruptible(&qdev->ready);
-	if (rc)
-		goto free_skb;
-
 	if (skb->sk)
 		sock_hold(skb->sk);
 
@@ -84,7 +79,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	int rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, 0);
+	rc = mhi_prepare_for_transfer(mhi_dev);
 	if (rc)
 		return rc;
 
@@ -101,15 +96,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
-	if (rc) {
-		qrtr_endpoint_unregister(&qdev->ep);
-		dev_set_drvdata(&mhi_dev->dev, NULL);
-		return rc;
-	}
-
-	complete_all(&qdev->ready);
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
