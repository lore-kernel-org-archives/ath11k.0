Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE3C4829B
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtlqHllwjFZl2786B/ZnNk68ctdlZdYfKUj7z5b/g7E=; b=e1+WgJZ7oZHmzQHQB8Ltkac8yY
	0LTlBjOgNY1MpHSEuIZfYiNm2UR5skfEd7hTrJ+YZPbqLUCrST3XGkTWNdSQbk/XWLP6qeDh1pPHu
	EzFtR0DLbhCoaBToJYFLN3oPkFqL8kR+IU1uPOOd88IsRvAh2Ze/i/bggHAS3yw/yQqOQckH1m0T8
	FPI2pgp3tUGuJ5GNr/OBydYoTd60WUSmotqD+koxKmXaYiedvn9+s6dZi4heF76l2/ydz7BNVmYyK
	kn1NUXktav6phHb5x5RnCh3xvwjEbcf80vPDv4i+9GI+UEMilXZsCAfIEJ0Ye91jKiSHMRC8QKCPX
	6dPCIRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAW-0000000GsQZ-0Lmo;
	Fri, 09 Feb 2024 11:35:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAT-0000000GsPM-0564
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 11:35:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4106cf2e9e2so3625625e9.3
        for <ath11k@lists.infradead.org>; Fri, 09 Feb 2024 03:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707478538; x=1708083338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtlqHllwjFZl2786B/ZnNk68ctdlZdYfKUj7z5b/g7E=;
        b=LDX/d/tfNWomgU8RRPGrdOGouQtriCVm098DZOHWnecczQOikJnsR1m8m3F51LV2A0
         Kum0z6RUYRUP5ClmP+RDozxO0U5iRgZwX+qlv97ZUd3hPyngAlMrxadiPQ8fM9bSfMPc
         khQ5X5ENHWTRQlrLDK330sq0d7pEk11m8ZF9H9Tv9Zc+w6ORuniAni3FCJKGG9QY53za
         vK9aPeZBP/W1DjBUqpjHlhCCtP/GDWD4GS7drMvcRySSQjlns3iqXmij2sSmad/Df5Tb
         bduwmiVzgM892/MKfvJ6EKjGNm6vwDwWOm9MLRdFCbwZtVuVfjYfI/O+f7ku88/Y3Vzw
         vikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707478538; x=1708083338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtlqHllwjFZl2786B/ZnNk68ctdlZdYfKUj7z5b/g7E=;
        b=LRzdJGMzzUCBCgswZpi9oPfDpoJ0lXeBnY7cVxGMp6id0nlG5yrZX0achsBuLVlYaB
         CV9VyRLVmRPmYukBiqSghEkumred8MhbHltGxIpRrC8rAGI2iHKaC7A/31eWIazQkAFv
         i35/Q0KlEQ8Im41OFVFOzr5KDkiFvJ3MyzcT89eTPFQItKBTAJGkbBjibJqWmBFB5GzQ
         5P5lLS0ZO8IFUs/s710s4ikLoyKOE7iYeKe7HFV77IYFxKMwef6jfi9sl3M7wM0i8luj
         bcRLjBF5PZgPS6zVLYHY8mO+wwCCxqt+ymnsQszr40kL8rqqmSnZ9iRaqvq87IZY0pks
         iQSQ==
X-Gm-Message-State: AOJu0YwO4yGlH3j08BYN2CEuJCHD3Tk7GpOWw7EB2umnR6dE9G4sX4lb
	samPVLgCOd7PxGlGYntOmlaNg4v1wnwln+WgHsT2K2Je5YuzgME9QOg/LCNk
X-Google-Smtp-Source: AGHT+IHA4KQZAMJuYwS55zu/hXNFYZN3e63pc3he17mm07yp14L6PPs7xrz3EhPSfP9uVJBH4AFn2Q==
X-Received: by 2002:a05:600c:468e:b0:410:1d09:701f with SMTP id p14-20020a05600c468e00b004101d09701fmr856436wmo.14.1707478538264;
        Fri, 09 Feb 2024 03:35:38 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id y18-20020a1c4b12000000b00410723b14e4sm346251wma.19.2024.02.09.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:35:37 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath11k: Remove scan_flags union from struct scan_req_params
Date: Fri,  9 Feb 2024 12:35:36 +0100
Message-ID: <20240209113536.266822-3-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209113536.266822-1-nico.escande@gmail.com>
References: <20240209113536.266822-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_033541_086561_2655E5A1 
X-CRM114-Status: UNSURE (   9.14  )
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

Now that we do not use scan_flags directly with WMI_SCAN_XXX macros anymore but
only the bitfield scan_f_xxx, lets remove the scan_flags & the underlying union.

This will prevent further problems as some entries in the scan_f_xxx bitfield
don't match their corresponding WMI_SCAN_XXX flags as seen in [1]

[1] https://lore.kernel.org/all/20231127180559.1696041-1-nico.escande@gmail.com/

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 55 ++++++++++++---------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 6dcd14700570..bc7adf7f13fb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3394,36 +3394,31 @@ struct scan_req_params {
 	u32 idle_time;
 	u32 max_scan_time;
 	u32 probe_delay;
-	union {
-		struct {
-			u32 scan_f_passive:1,
-			    scan_f_bcast_probe:1,
-			    scan_f_cck_rates:1,
-			    scan_f_ofdm_rates:1,
-			    scan_f_chan_stat_evnt:1,
-			    scan_f_filter_prb_req:1,
-			    scan_f_bypass_dfs_chn:1,
-			    scan_f_continue_on_err:1,
-			    scan_f_offchan_mgmt_tx:1,
-			    scan_f_offchan_data_tx:1,
-			    scan_f_promisc_mode:1,
-			    scan_f_capture_phy_err:1,
-			    scan_f_strict_passive_pch:1,
-			    scan_f_half_rate:1,
-			    scan_f_quarter_rate:1,
-			    scan_f_force_active_dfs_chn:1,
-			    scan_f_add_tpc_ie_in_probe:1,
-			    scan_f_add_ds_ie_in_probe:1,
-			    scan_f_add_spoofed_mac_in_probe:1,
-			    scan_f_add_rand_seq_in_probe:1,
-			    scan_f_en_ie_whitelist_in_probe:1,
-			    scan_f_forced:1,
-			    scan_f_2ghz:1,
-			    scan_f_5ghz:1,
-			    scan_f_80mhz:1;
-		};
-		u32 scan_flags;
-	};
+	u32 scan_f_passive:1,
+	    scan_f_bcast_probe:1,
+	    scan_f_cck_rates:1,
+	    scan_f_ofdm_rates:1,
+	    scan_f_chan_stat_evnt:1,
+	    scan_f_filter_prb_req:1,
+	    scan_f_bypass_dfs_chn:1,
+	    scan_f_continue_on_err:1,
+	    scan_f_offchan_mgmt_tx:1,
+	    scan_f_offchan_data_tx:1,
+	    scan_f_promisc_mode:1,
+	    scan_f_capture_phy_err:1,
+	    scan_f_strict_passive_pch:1,
+	    scan_f_half_rate:1,
+	    scan_f_quarter_rate:1,
+	    scan_f_force_active_dfs_chn:1,
+	    scan_f_add_tpc_ie_in_probe:1,
+	    scan_f_add_ds_ie_in_probe:1,
+	    scan_f_add_spoofed_mac_in_probe:1,
+	    scan_f_add_rand_seq_in_probe:1,
+	    scan_f_en_ie_whitelist_in_probe:1,
+	    scan_f_forced:1,
+	    scan_f_2ghz:1,
+	    scan_f_5ghz:1,
+	    scan_f_80mhz:1;
 	enum scan_dwelltime_adaptive_mode adaptive_dwell_time_mode;
 	u32 burst_duration;
 	u32 num_chan;
-- 
2.43.0


