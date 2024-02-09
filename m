Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69AFC4828F
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fm4JJt9uD1FPJlWzQS1y3vdwjoX/msXl9aHi4Ixrq2w=; b=aSZ/jtihY2QAUuk1mPv41U1orA
	3FRSxdVXHIGNfxClaq5XSJL0/ee+3ob/1gePgiuqpULCVsHQtk28nYZZi+dzMlN932V6AV5JY6FaH
	DczUHzxaCMd9BKEWaDotkSWbfySjM/ioRT33DwJl6bDkFTh+qY7g1NPhxkl6gHiIscOYmSGX2rBjp
	UU5s+N8ZKoYNaEBWmijPj0XxV0zF8R2nJ+P3xFvUdrj/f+Nwyignk99kBoRtvhwIaZ7GbE3XykdDZ
	zom4cBBI6ykEmMl8dc81TNmV4cSXJbtmnw4YwzZJnpAzQeKU3wMLi0mr+1pPBesqbOzOWqWGiI6Bd
	XQCkwirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAW-0000000GsQe-2DQa;
	Fri, 09 Feb 2024 11:35:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAT-0000000GsPL-0V3Q
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 11:35:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41060e5b664so5136945e9.1
        for <ath11k@lists.infradead.org>; Fri, 09 Feb 2024 03:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707478538; x=1708083338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm4JJt9uD1FPJlWzQS1y3vdwjoX/msXl9aHi4Ixrq2w=;
        b=JRw7XLtGQfujLnuSx2kwJmkiQk7+sb4ncduIr5O8DKKS+/ptnuP8cy1G/A7R2dQdEd
         jb7ETZiNe5LLfFgyrP9vKHdF3ua39PbTtpsmImoBamnChOmHNIm42fFXozdXXIICkMv4
         NaMQ2mnproKw2RoEmy5jZ9w36rA8nePLptXkPu7ZYI1TaAFqbrfj9mq0eVbVBMFaQeu7
         bbyN2FKzLKMhvX/k7WeRIi4FswqPjR8qyZUnrZDzLeX1aSnkOsPQCPVE2Ls881oGnMBh
         s+jcwGzNZTaDcdUyUJ2W8Nt7gIUsQcIHHzOOH+dTXPMMZrhzmX9vkhDG8Vbbv7MMb6PM
         gI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707478538; x=1708083338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm4JJt9uD1FPJlWzQS1y3vdwjoX/msXl9aHi4Ixrq2w=;
        b=ujW6bqcGKhZlVHK6MZ0xklExhT7lF0nhvBDNBapYZ/7q1xxap6IHaT+k90E6z9xYm+
         poNdDyULFBB6gwWie7FMHAMygvommaanmEP4k8TyaJ77xviw4YYXfMp4ZYT2FOlqA6yr
         mRnmrkF99v4ARNdgoZ72tATUp6MZ4rQgeD22lwQOg7z1TvjLb7l/upurDuuwFvWlusrf
         zRraqS7e1R+R/NOvGPy7p7xq17ZCJU4DI+v/UrdUELJ8/4lDI/Sql1wbDIcPFltb/Gsb
         oeA63hshv+CHgF9Km/5uzDoLCLcCdYpdJ0D2JZPwSgIJoHnzTrhLeEiLpv+8NfC+WGCB
         Zd9A==
X-Gm-Message-State: AOJu0YzejddnP+BTkjmUSyxCGCOhsvGpR1UJnKjVf7ZMd+euR+sLXQPR
	MCLuOmj9OeLy03yUsLFqmu9PxjDBMDkgdP8YzfLq51ZBzPkjpmoJY+nrv3WR
X-Google-Smtp-Source: AGHT+IFmiJ2G7GqQQljSg/6FYb0ezyz9HlO6sLBHNN3PZhmm2gDtrn5oXA+qrP/xHI8L2BmElsiTbg==
X-Received: by 2002:a05:600c:4510:b0:40f:dd91:2d06 with SMTP id t16-20020a05600c451000b0040fdd912d06mr1006044wmo.32.1707478537791;
        Fri, 09 Feb 2024 03:35:37 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id y18-20020a1c4b12000000b00410723b14e4sm346251wma.19.2024.02.09.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:35:37 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath11k: Do not directly use scan_flags in struct scan_req_params
Date: Fri,  9 Feb 2024 12:35:35 +0100
Message-ID: <20240209113536.266822-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209113536.266822-1-nico.escande@gmail.com>
References: <20240209113536.266822-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_033541_192873_748CC4D6 
X-CRM114-Status: GOOD (  11.70  )
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

As discussed in [1] lets not use WMI_SCAN_XXX defines in combination with
scan_flags directly when setting scan params in struct scan_req_params but use
the underlying bitfield. This bitfield is then converted to WMI_SCAN_XXX when
filling the WMI command to send to the firmware.

[1] https://lore.kernel.org/all/871qae51wx.fsf@kernel.org/

Tested-on: QCN9074 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 +++---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index be04f823566f..7bf5d1068164 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4013,7 +4013,7 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 			       req->ssids[i].ssid_len);
 		}
 	} else {
-		arg->scan_flags |= WMI_SCAN_FLAG_PASSIVE;
+		arg->scan_f_passive = 1;
 	}
 
 	if (req->n_channels) {
@@ -9252,8 +9252,8 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	arg->dwell_time_active = scan_time_msec;
 	arg->dwell_time_passive = scan_time_msec;
 	arg->max_scan_time = scan_time_msec;
-	arg->scan_flags |= WMI_SCAN_FLAG_PASSIVE;
-	arg->scan_flags |= WMI_SCAN_FILTER_PROBE_REQ;
+	arg->scan_f_passive = 1;
+	arg->scan_f_filter_prb_req = 1;
 	arg->burst_duration = duration;
 
 	ret = ath11k_start_scan(ar, arg);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 688ee20528a0..78c11025c21c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2098,7 +2098,7 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
 				  WMI_SCAN_EVENT_BSS_CHANNEL |
 				  WMI_SCAN_EVENT_FOREIGN_CHAN |
 				  WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+	arg->scan_f_chan_stat_evnt = 1;
 
 	if (test_bit(WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE,
 		     ar->ab->wmi_ab.svc_map))
-- 
2.43.0


