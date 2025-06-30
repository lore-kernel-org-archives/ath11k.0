Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B6C83026
	for <ath11k@archiver.kernel.org>; Mon, 30 Jun 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV8S0JK7uX8xYk9O0AqGs9CFpRRSYI7UmJ+uMI5PmQs=; b=nGJnB/4R5rLejpvZA/SYN043/R
	d3uWHidRVazbLvLCNycZ26qtRzjhuQ0jrXukzCqfKIAjLC0YfA2Yxubv5ksfgBevxT0JHexQ/zVOl
	H+Njh0XYTS0j8novi9ZMUhVw782i54FwsjjDYpwOCi9sWRhgZUt0C12jc/hMQ7/OkHX75+7E7ONeB
	shos4zSN3HXbid8A2JQbxAn+SE2DLQsyMDfb5ut2yrgJ/Wwgf9VyVXdAAomc/oTg3/VA7qK3/Oa7F
	ns5QUQwu05cYDdRMDsWwa0kDr6wmcTWIKB5iM16uDbZ9fWpVMbYlHwWzrl6+AanokMyyMi5UBKoDO
	Ph8+tGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9De-00000001Ubo-06fo;
	Mon, 30 Jun 2025 07:46:26 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9CZ-00000001UMC-2VME
	for ath11k@lists.infradead.org;
	Mon, 30 Jun 2025 07:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751269483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XGxFZzOgso314U88svUkjhZdO0Qh39BYpQTUm1Scir/2cxiYNWh51lY56mEXskd13RkbZWc/LoToSFE/eSZFsqd0gfSC2lMEOyQqk5Uy4194TapE6XtNIFCfBP0WfwsIMojTzxaV8BIE9iWQ09y2xQ4PTHPR0LhVSjRepm1bB5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751269483; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uV8S0JK7uX8xYk9O0AqGs9CFpRRSYI7UmJ+uMI5PmQs=; 
	b=N2GdNEELh25VdHU/JfFHjVD5rRasxbVWOlxdgoHBobHssMjS9crleUumwwI+XwFM+83NRrxUPq7eKY4qcWTqhOzXNx4OwP1EFDSsNYrAeCMA+iJpJWUAmXWpxeZDedK6ucbB4DjL+lrPrV1BAPiWxk64JFTHvxLdKX+7xXb3ieY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751269483;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uV8S0JK7uX8xYk9O0AqGs9CFpRRSYI7UmJ+uMI5PmQs=;
	b=WGpDSjxVGnc/HCN4ZIY3kCu34NKFqF6M+6tziUE4RPNau5eyoZXqQzfWcyaIn3C6
	IIqCgN8VE2zeqArJNvOKNuCJPW0GX5Vk4JhtPzmQqONPrg+MQNzOgUiYE6BXOu8zWn5
	suvL3ro4tTUU+qR1Sk1OYcYdUaqdyYyqf0E2eY0w=
Received: by mx.zohomail.com with SMTPS id 1751269481985439.6433346986413;
	Mon, 30 Jun 2025 00:44:41 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Alex Elder <elder@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	John Crispin <john@phrozen.org>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kernel@collabora.com
Subject: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
Date: Mon, 30 Jun 2025 12:43:30 +0500
Message-Id: <20250630074330.253867-4-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630074330.253867-1-usama.anjum@collabora.com>
References: <20250630074330.253867-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004519_692424_BD1672A5 
X-CRM114-Status: UNSURE (   9.70  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Don't deinitialize the device context while going into suspend or
hibernation cycles. Otherwise the resume may fail if at resume time, the
memory pressure is high and no dma memory is available.

Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/bus/mhi/host/init.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 2e0f18c939e68..8f56e73fdc42e 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
-	ret = mhi_init_dev_ctxt(mhi_cntrl);
-	if (ret)
-		goto error_dev_ctxt;
+	if (!mhi_cntrl->mhi_ctxt) {
+		ret = mhi_init_dev_ctxt(mhi_cntrl);
+		if (ret)
+			goto error_dev_ctxt;
+	}
 
 	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
 	if (ret) {
@@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	mhi_cntrl->bhi = NULL;
 	mhi_cntrl->bhie = NULL;
-
-	__mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 
 void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
@@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 	}
 
 	mhi_deinit_dev_ctxt(mhi_cntrl);
+	__mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
 
-- 
2.39.5


