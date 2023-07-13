Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE77EB64DA
	for <ath11k@archiver.kernel.org>; Thu, 13 Jul 2023 00:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZ0AYF59Vrkh6SrFFS54c2LGQnO+8qyxI5KrTwrJoBo=; b=yzvAI+x39FiIti
	uDLLFAF4yj7IBUhhJOSQkQe9YQxIim/Bf+5B3AB/T2p//UevVieH2fZfVSDj9UX9tU0ZecQAPZwjz
	7iORs6vHVOP4p0I/VdK7SlKHnvTYuGP6HuTRO/zgGZwrBiBBibmYrlNd218ICeXYvHxJNmRBWDAhH
	S42zAU8Yeosb9UXSCYNBJIAAAWAeI92E+Hr5CfDR/XpkNfY+f+jaxhsDQDfomhbVp1Y4ajLUp4f4v
	z+DyJRjWNkhL1YqZp15yoW85Ba1JQBqS2KlEBBc5aWbAySFlo5j+n3Zphj0KPSY13FiNZ/m8VYbfP
	kSh3MRyb8JwnUhM5zGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJk7J-001Z4t-1D;
	Thu, 13 Jul 2023 00:23:33 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJk7G-001Z4Q-1z
	for ath11k@lists.infradead.org;
	Thu, 13 Jul 2023 00:23:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666eef03ebdso104811b3a.1
        for <ath11k@lists.infradead.org>; Wed, 12 Jul 2023 17:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689207808; x=1691799808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sT4EPf3iKpEGqJ9z73dP6QmwaakqTzng8UdClO0Piew=;
        b=aRIYCxnqUBaRxyMH1DBKp/8X4qC1atHIh1r2/LHdWve6SewdPZoLngvOxRUYaIPykF
         vEvFITAIPdtjiZ9Z8oF90zWyqEle5fM1PhH5EyETF+eyjgqZqBVGBqgOtvzpxzHpM6lQ
         gJmpOcFz+vYnoQlDsXpmzjRTuCgYXk4ZwK+/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689207808; x=1691799808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sT4EPf3iKpEGqJ9z73dP6QmwaakqTzng8UdClO0Piew=;
        b=adLFRfrgYTMbtKJy2WYj6wKi/WahcJU24fn/Hc1B3OQD3b6lpb+S66FhkMY14EajUc
         pC/ktzWEahfi+m+jldPMFLpYBQJ5eHux2Z/cvrrC35cohaBOeFPQYbdGWPFU6I5F6Lrk
         TWh9aQcVGxjJ6JPP+1Zd/wUO7t5EAEWRk1mL/3AxPIUShfsYQIem6eRHKbIs/hgZr8qf
         bEMOfFI39npWmUCh6nq0uJgDe/L0DowejTpgKRX+6RmuKB7YWqybi8t27Qw1yPQlhs0U
         pTZ/b3NFCQWm2DFYZyXDvQL6ydPyoVMtwrVEx4TB/Nt7kT1OaZ7wdf8XMNkMUWQehG+l
         rg/Q==
X-Gm-Message-State: ABy/qLaU2lO0ROe7DXcTtkG4M2VLXw6nwpwupqCU49DBMjsFXwyCzDIZ
	wqJBLTA2FsiMfN/MuvYsHEE0p8BN07OO5seZBXA=
X-Google-Smtp-Source: APBJJlGKjZCgdVN17RxPtjOTfMluNOyGQtpx6cSkveJ3gQkvS7LPdpApIOmQefFMYURTDvN7ZXUL0w==
X-Received: by 2002:a05:6a00:1399:b0:681:ee3c:c5fe with SMTP id t25-20020a056a00139900b00681ee3cc5femr162644pfg.33.1689207808438;
        Wed, 12 Jul 2023 17:23:28 -0700 (PDT)
Received: from arowa.mtv.corp.google.com ([2620:15c:9d:4:7744:239:e1aa:a886])
        by smtp.gmail.com with ESMTPSA id s4-20020aa78284000000b0066883d75932sm4143886pfm.204.2023.07.12.17.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 17:23:28 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Arowa Suliman <arowa@chromium.org>
Subject: [v3] wifi: ath11k: Add crash logging
Date: Wed, 12 Jul 2023 17:22:18 -0700
Message-ID: <20230713002319.4057612-1-arowa@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_172330_675054_4E2AD220 
X-CRM114-Status: GOOD (  11.31  )
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

Currently, the ath11k driver does not print a crash signature when a
crash happens. Checked by triggering a simulated crash using the command
[1] and checking dmesg for logs.

[1] echo assert > /sys/kernel/debug/ath11k/../simulate_fw_crash

Change the crash logging from debug to informational and add a warning
when firmware crash MHI_CB_EE_RDDM happens.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Arowa Suliman <arowa@chromium.org>
---
v3:
1- Fixed the error:
drivers/net/wireless/ath/ath11k/mhi.c:328:25: warning: passing argument 2 of 'ath11k_info' makes pointer from integer without a cast [-Wint-conversion]
2- Removed extra spaces in lines 329 and 338
3- Updated commit message with correct Tested-on flag and the reason of
the change.
---
 drivers/net/wireless/ath/ath11k/mhi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 3ac689f1def4..d9783c2e0529 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -325,7 +325,7 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 {
 	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
 
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
+	ath11k_info(ab, "notify status reason %s\n",
 		   ath11k_mhi_op_callback_to_str(cb));
 
 	switch (cb) {
@@ -333,6 +333,7 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 		ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
 		break;
 	case MHI_CB_EE_RDDM:
+		ath11k_warn(ab, "firmware crashed: MHI_CB_EE_RDDM\n");
 		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
 		break;
-- 
2.41.0.255.g8b1d071c50-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
