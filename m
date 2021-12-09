Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FABC433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kt3IJHZ/MTl+IEe1H91QFnnumHth9jAJGpcigJSFWvs=; b=pKDcHJh3KSWZ6Y
	kHYc2e+OTNCW8aAzhhi3pbmonBfFY7SGC0zDi0Ov+bjKvz4FdcTnzxsV9dYwdxYbXuXKFcgHtC/t6
	/C5U4sq2umwO+ZoNjMVvyze3ledIt72Dc5E90ueSeHf6Cckr1oP8BInlOG7T3R2U7KN5hxXjCIY9l
	J/N0l/PbPbZUWiTLWolfBcemXRhcz88MIynobwKIMdQUTPe/H0VRaYxhr8ILFa7hc4j9Kxt8p0p/x
	Shr1WvtDTAnS3X+0chafSZZ7HEX+3PK8oICnT6U3ZfVG+M52tMb6AliTk+kJAHgCMuxrEVrG0ogc7
	PbSdne1pGGcdgH15Dr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJHy-00G3TO-OB; Thu, 09 Dec 2021 13:16:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJHv-00G3Qz-1i
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 13:16:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id m24so3837398pls.10
 for <ath11k@lists.infradead.org>; Thu, 09 Dec 2021 05:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdDY5ij0RZVpRPH4PPkpJNHpzmZFEQMl/Zl2mv0q3gY=;
 b=lDl1VuXtMXA7wRFoKDUgDn3q4xhysFr5zJMACY+32x88H0EOmVtCZE34vaTW79/KJb
 qKIRo8w9JCRojsRqtmeZ7IM1HreQv4j1s21YPkanWoQ7c43yKaMUw2nztLkTflJz8lEJ
 VhRRzUKp00tXFBeQP8vBQ7P0KseWxGLBz6OnKZmP5Bs89UNVDEEJG4K3DQVjbPDTKYqW
 rgUPPOSlDM81fOld08rILF7VqxrexIeRJ5s1QCSfVUzri8nNII/l4biOrFz2+oUpwL10
 dQC8i7tsHf4voyvnOH4Co2MiX6kI08s/+qT4WiFxXwg78SoIYzT+iJZBLKfK0KLz0Tfq
 +DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdDY5ij0RZVpRPH4PPkpJNHpzmZFEQMl/Zl2mv0q3gY=;
 b=zlGwwbUo4jqgwbRrYz1Q0GioIU5HQy3apYDhP0BiQc392FQAultpdV6pc5n4eNC3Bq
 n9A9JnNQbCsxikM5eg+DC/aRhuBHDBUJ/RzmlwDzXc+Pb1qmNPmgxWmow1miGh35oC6H
 AaqpCfivQmESdExbh/L40LPrl/Tzo18GgYF7pafkKQAMYqb2/ZeAwFZLKAa16wVCa/iQ
 7uF0ce3/fzBUcpRGlv1mqUbYdOzpNmzdFDk9xQaIzhF0EstwMAyXyGh9EI83HYdZHVe1
 yx7VfzKJU7KHRrCf+2Ce2gOL70RJ2pHcv3bnfGibDTfgRZwIaJ4MnuoIu9j2Od3h8905
 984A==
X-Gm-Message-State: AOAM531CU8EV9lT8at1EcMMoODMGIBzu1RvX113FHQpnmhRGbOSXTGLZ
 qdnScHgnefIjUqhBSN4bWJxP
X-Google-Smtp-Source: ABdhPJwoPqUPuxXvgZszBjudXWUF9FIm/paRD0EaLXFP5jSKiuwj93WOjzmB1wi7bg5tOXdMiOoSRA==
X-Received: by 2002:a17:90b:4f49:: with SMTP id
 pj9mr15037953pjb.159.1639055801240; 
 Thu, 09 Dec 2021 05:16:41 -0800 (PST)
Received: from localhost.localdomain ([202.21.42.41])
 by smtp.gmail.com with ESMTPSA id q6sm5591169pgs.19.2021.12.09.05.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 05:16:40 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] bus: mhi: core: Add support for forced PM resume
Date: Thu,  9 Dec 2021 18:46:33 +0530
Message-Id: <20211209131633.4168-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051643_143539_679E604C 
X-CRM114-Status: GOOD (  18.85  )
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

From: Loic Poulain <loic.poulain@linaro.org>

For whatever reason, some devices like QCA6390, WCN6855 using ath11k
are not in M3 state during PM resume, but still functional. The
mhi_pm_resume should then not fail in those cases, and let the higher
level device specific stack continue resuming process.

Add an API mhi_pm_resume_force(), to force resuming irrespective of the
current MHI state. This fixes a regression with non functional ath11k WiFi
after suspend/resume cycle on some machines.

Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179

Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
Cc: stable@vger.kernel.org #5.13
Link: https://lore.kernel.org/regressions/871r5p0x2u.fsf@codeaurora.org/
Reported-by: Kalle Valo <kvalo@codeaurora.org>
Reported-by: Pengyu Ma <mapengyu@gmail.com>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[mani: Switched to API, added bug report, reported-by tags and CCed stable]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Switched to a new API "mhi_pm_resume_force()" instead of the "force" flag as
  suggested by Greg. The "force" flag is now used inside the API.

Greg: I'm sending this patch directly to you so that you can apply it to
char-misc once we get an ACK from Kalle.

 drivers/bus/mhi/core/pm.c             | 21 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
 include/linux/mhi.h                   | 13 +++++++++++++
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e3727155..547e6e769546 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_pm_suspend);
 
-int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
+static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 {
 	struct mhi_chan *itr, *tmp;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
 		return -EIO;
 
-	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
-		return -EINVAL;
+	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
+		dev_warn(dev, "Resuming from non M3 state (%s)\n",
+			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
+		if (!force)
+			return -EINVAL;
+	}
 
 	/* Notify clients about exiting LPM */
 	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
@@ -940,8 +944,19 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 }
+
+int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
+{
+	return __mhi_pm_resume(mhi_cntrl, false);
+}
 EXPORT_SYMBOL_GPL(mhi_pm_resume);
 
+int mhi_pm_resume_force(struct mhi_controller *mhi_cntrl)
+{
+	return __mhi_pm_resume(mhi_cntrl, true);
+}
+EXPORT_SYMBOL_GPL(mhi_pm_resume_force);
+
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 {
 	int ret;
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 26c7ae242db6..49c0b1ad40a0 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -533,7 +533,11 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
 		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
 		break;
 	case ATH11K_MHI_RESUME:
-		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
+		/* Do force MHI resume as some devices like QCA6390, WCN6855
+		 * are not in M3 state but they are functional. So just ignore
+		 * the MHI state while resuming.
+		 */
+		ret = mhi_pm_resume_force(ab_pci->mhi_ctrl);
 		break;
 	case ATH11K_MHI_TRIGGER_RDDM:
 		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 723985879035..a5cc4cdf9cc8 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -663,6 +663,19 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
  */
 int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
 
+/**
+ * mhi_pm_resume_force - Force resume MHI from suspended state
+ * @mhi_cntrl: MHI controller
+ *
+ * Resume the device irrespective of its MHI state. As per the MHI spec, devices
+ * has to be in M3 state during resume. But some devices seem to be in a
+ * different MHI state other than M3 but they continue working fine if allowed.
+ * This API is intented to be used for such devices.
+ *
+ * Return: 0 if the resume succeeds, a negative error code otherwise
+ */
+int mhi_pm_resume_force(struct mhi_controller *mhi_cntrl);
+
 /**
  * mhi_download_rddm_image - Download ramdump image from device for
  *                           debugging purpose.
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
