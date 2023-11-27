Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14599C0755A
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQpp2GtDRIE7RmgHvzLqPh/bvqJqwSIdccBWQ8g2SFo=; b=DAJNXJZWsY24m9
	IBCE5fulwTdAhundHTPzo7fQJrRnVKIkZrUAz/mSNLEI/rKSS7cCDWEUwl8YV+sPfn3He8w4vtX60
	9yEQRBg5Lh+dvWM8U1HW2YzV+z+Px5hnmWCICFrsAEEmzJClbJtRIz5NC3bClsEJrretLRP6p69S9
	WUOJJ5AXW/Z/15wEobRrjZNGQDLQAaRI+ZWQR8ZCSDtSmztae4o9GaeaZT9ZAxh3vhUMt9nDnaCah
	adBCk0H96hzSXcFwKFE7aJ+5F6AIxsNxPIZtKa99UpPIBockK37jFH5YSGfqxQU0FE3WOvPUHw5cf
	52xIXiCMlZs21rnS0asA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7g09-003BrJ-0m;
	Mon, 27 Nov 2023 18:06:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7g07-003Bqi-0M
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 18:06:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso6517737e87.1
        for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701108388; x=1701713188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DT40gvGBf/eM8IJ2UaCbuM7rGTg9Ams4wqAFywuOGQg=;
        b=lH/htR+SO8IhDyMN94G//4tspgzSoeSAHJd6alVJfTYdczJCuPHIFR1cdE430JKZMM
         Dh42cv3H+sqBduK/uUQq4597dsDwJjSJuAq4Mw8miFyD5/tj9gohg0M0bjyHlcj4IMNc
         HJLw9NrHE/lQboIg/M9zb1YOiiZeNEp4W6kCSG+GUApY/JRyChPAZlRlf2gr8+torq9G
         BqyK9zTfp4fBYM1wX/tunvK5CM25BYlNdLaS3hHV62r/mGB6qfPvFq0csKXx9cU9OTkk
         n+NFotTPeWn72BbHD/epJHlYEOHQe4EWbGarzNTfVl+VJNzM0ooDUqIq5cVRFyJ+A+CP
         pshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108388; x=1701713188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT40gvGBf/eM8IJ2UaCbuM7rGTg9Ams4wqAFywuOGQg=;
        b=M9G+kWuV9BCrgAfiRspbZEOFwygkwfJArVzIBJuGxa2mgEaSPH5EC/LdjtEM+HpW6R
         dq0VUupe2fk4XGa/RlHBx6NJ3uaSzYYisPbXz6IRI7rcmvyKIP67MjBkdMGxLnd9pUhD
         VVQnDk0pTZCl6L3OkRv1DXXSHdQ6a/X+qaQG/tsEnxTQj5aW5VtaWorRW+Qpq2qvyRYU
         kXVMW5BhiZMD9ADfV9tS1CKE10T9dVRCmTRmlQtkidxs1Y0vTInMr2jxyaXFvWxk7CzK
         6CTBxBkWmNRwUWZF8ofnsW1btXshGdSkU1F6FT2Psy7ObA/DRLtjHYhJJkFz8EqgIyS1
         bHtQ==
X-Gm-Message-State: AOJu0YxGQj3Za+hqOyY+DnAMg080LyHF7XPFXKrfdfGPf+dnjbNBWOBb
	8EXoO2NUxXARxvgLKR4O5V4=
X-Google-Smtp-Source: AGHT+IH0U0hrGxgiqxbvTxJgMetsDCw5i7Yn7rA7X0J8Zw0WgeHRZr19HnuLIIdh6N1eT3DHYBFoiA==
X-Received: by 2002:a05:6512:684:b0:508:1edf:92f with SMTP id t4-20020a056512068400b005081edf092fmr11089362lfe.40.1701108387855;
        Mon, 27 Nov 2023 10:06:27 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a2-20020adff7c2000000b003258934a4bcsm9795304wrq.42.2023.11.27.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:06:27 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Nicolas Escande <nico.escande@gmail.com>
Subject: [PATCH] wifi: ath11k: fix layout of scan_flags in struct scan_req_params
Date: Mon, 27 Nov 2023 19:05:59 +0100
Message-ID: <20231127180559.1696041-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_100631_168006_533AA4FD 
X-CRM114-Status: GOOD (  11.84  )
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

The is a layout mismatch between the bitfield representing scan_flags in
struct scan_req_params & the bits as defined in the WMI_SCAN_XXX macros.
Lets fix it by making the struct match the #defines.

I tried to correct it by making the struct match the #define and it 
worked for WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS / scan_f_force_active_dfs_chn
so I'm assuming this is the right thing to do.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 100bb816b592..0b4e6c2f7860 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3348,17 +3348,17 @@ struct scan_req_params {
 			    scan_f_filter_prb_req:1,
 			    scan_f_bypass_dfs_chn:1,
 			    scan_f_continue_on_err:1,
+			    scan_f_promisc_mode:1,
+			    scan_f_force_active_dfs_chn:1,
+			    scan_f_add_tpc_ie_in_probe:1,
+			    scan_f_add_ds_ie_in_probe:1,
+			    scan_f_add_spoofed_mac_in_probe:1,
 			    scan_f_offchan_mgmt_tx:1,
 			    scan_f_offchan_data_tx:1,
-			    scan_f_promisc_mode:1,
 			    scan_f_capture_phy_err:1,
 			    scan_f_strict_passive_pch:1,
 			    scan_f_half_rate:1,
 			    scan_f_quarter_rate:1,
-			    scan_f_force_active_dfs_chn:1,
-			    scan_f_add_tpc_ie_in_probe:1,
-			    scan_f_add_ds_ie_in_probe:1,
-			    scan_f_add_spoofed_mac_in_probe:1,
 			    scan_f_add_rand_seq_in_probe:1,
 			    scan_f_en_ie_whitelist_in_probe:1,
 			    scan_f_forced:1,
-- 
2.43.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
