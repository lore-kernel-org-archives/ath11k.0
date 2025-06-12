Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607D5C7113E
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 06:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ScgjUpaPfHbqDIMCPtaXg6Ano9ZrKG6mzFmgIhysYwY=; b=p+X9FbO2uu2fqlxozmkRH4lAyN
	3z9692xLdOrhy5FXeZjSmZJDVuCzpz70RdGgB/G6t2Vqd0kSakcOHl+KkHqtNQ/2lw9QeDTkKZqHI
	c4JyJrDj/+WD5Ku12luDR6ZHSYO1BfRnFGuID4wwa+HYFQ9thZBJftM/ZzIkUr1ncrt+hUZ1StcpD
	4622wjgulrjAuj78hiGCVbE8CblBuVE7XYkMfKoCmBmU0K1SlKNoIKkvU/huCWZPwdvjZeWNjuNYq
	CXt3QFpt6yPKPYR86NIzsmN8ZVa+cVMTvRQkRCi2juys7+Emii+DuhD2WmHx6DgSjtqETjGCaG4Rf
	Roinw25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbFk-0000000CIc1-1lcv;
	Thu, 12 Jun 2025 06:17:32 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbFg-0000000CIbC-0iqn
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 06:17:31 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so4542435e9.3
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 23:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749708985; x=1750313785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScgjUpaPfHbqDIMCPtaXg6Ano9ZrKG6mzFmgIhysYwY=;
        b=KK19J+2q2/tvlC4bTWrEhES7gonNNokVzOWpKM5DKGMfF9wSiwqRNh/S/C0/u9hP57
         28TYhFMF0dJq+w/O/GG/HBIClxDfNu0+sIrG4TYsHLa+0Tjdt0kU4U29h+dwabOjlrIh
         1CSwk3gjOBxU+HLlNvFR93DzKI7fJgZZ5kJ8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708985; x=1750313785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScgjUpaPfHbqDIMCPtaXg6Ano9ZrKG6mzFmgIhysYwY=;
        b=TyHka2XZlHCz1neDjTI82fVqnoMyxSbYHI2z12dRy9vAJS8jsV1dq6Soi+EmBFVvCN
         BURS8P+fXAJuEkcAyJW0aSszM8a+kyx76SQmaNQEv+N7F6enjK+dBPteLQaRpc3YPVK8
         lOPfurlmOL0LUDWPj4lkGSMbXpXrN5XYprTwvGwB0omgyY7mxiCWBMLDKggewTW++16U
         oZWpbNipjqQzUCj105j0VmEVpG+z/dlIalSfITrKQN0D7XsmETOB9JFNGAU1jJDKiup6
         2j1PBcqzEIq3lBz4L+TD+wlnXdMQTcHbrMXvn18z7EhDEV7NsNgIUFkInzFrPO4TQnik
         PsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI2EtsbtRGImInrKIGRunAT0n9HGfHpTX5L+Rcpn0EOHXQcgm22wQUDHa+JMLRyR+TGtptSzg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXHPOEoJpE5a0b/3M8sp9rCDiSbORXAsvNG9ipFj8VoMhnNwv2
	e8PNhgLsUzId/+wKawAxBH5fL+MTH3k7cnms6eU278DE2Rr/Sv141E2+1ZSpf4QP0x8=
X-Gm-Gg: ASbGncuDl/8KN4nDIbw1cogYyi+wS8UBVMHte5V2frLJzeWyhKKaDgWbOgRQVnjr9vX
	gYL8i/JaQqv39bfBipygw0dKVK3crc+da75S0KfHou2idGy8aHcGYfvzjTMJDmJfxAOw6NN6jIa
	LWv70k5W6LF5dRRCBSXdevJJEyxuFM82k2mSP/O6pchK8o+0Bzsga0lwjZd409bxphD71Xv5SLv
	ADqqD7j8gC3Qqpiez6YQj5SbVtupMDQ2DPZF0tOaqoF3/K2mtDTC68/E80msIs7KRE74rhopTHL
	sc/QMytyXYYPuHgQlJgT9FQoFWjS9vUTHFExW8e6eEzYYpH9QuTzVacF0j//OamEBF4P6Er2JaN
	YS//pBogVI87fZw==
X-Google-Smtp-Source: AGHT+IGm81iQMqozoNbGvUNa7Ii3Oga/QDuCjWZCS5lp+cWSAZ4nkHJS8aNtWeIEjp0Xmo8H09kLdA==
X-Received: by 2002:a05:600c:37c5:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-4532d2bd72dmr12505585e9.2.1749708985332;
        Wed, 11 Jun 2025 23:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:b34c:fa23:a49e:c18c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe840a3sm53716255e9.0.2025.06.11.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:16:24 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [RFC PATCH] wifi: ath11k: Prevent sending WMI commands to firmware during firmware crash
Date: Thu, 12 Jun 2025 08:16:15 +0200
Message-ID: <20250612061619.22094-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_231728_206632_EB562971 
X-CRM114-Status: GOOD (  14.69  )
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

Set the ATH11K_FLAG_CRASH_FLUSH and ATH11K_FLAG_RECOVERY flags when the
host driver receives the firmware crash notification from MHI. This
prevents sending WMI commands to the firmware during recovery.
We want to prevent the laptop from freezing or becoming extremely slow when
its firmware repeatedly crashes while attempting to connect to a known Wi-Fi
network. This often happens with routers that intermittently fail to reconnect
until the access point is reset. While this solution doesn't fix the underlying
router issue, it would allow the laptop to select a different Wi-Fi network and
significant performance degradation during the recovery process.

[75795.712161] ath11k_pci 0000:02:00.0: firmware crashed: MHI_CB_EE_RDDM
[75797.738073] ath11k_pci 0000:02:00.0: wmi command 262145 timeout
[75797.738090] ath11k_pci 0000:02:00.0: Failed to send WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID
[75797.738101] ath11k_pci 0000:02:00.0: failed to set vdev 0 OBSS PD parameters: -11
[75800.746321] ath11k_pci 0000:02:00.0: wmi command 20488 timeout
[75800.746344] ath11k_pci 0000:02:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[75800.746358] ath11k_pci 0000:02:00.0: failed to set vdev 0 dtim policy: -11
[75803.754345] ath11k_pci 0000:02:00.0: wmi command 237571 timeout
[75803.754360] ath11k_pci 0000:02:00.0: failed to send WMI_11D_SCAN_STOP_CMDID: -11
[75803.754371] ath11k_pci 0000:02:00.0: failed to stopt 11d scan vdev 0 ret: -11
[75806.762259] ath11k_pci 0000:02:00.0: wmi command 28684 timeout
[75806.762281] ath11k_pci 0000:02:00.0: Failed to send WMI_BSS_COLOR_CHANGE_ENABLE_CMDID
[75806.762294] ath11k_pci 0000:02:00.0: failed to enable bss color change on vdev 0: -11
[75809.770916] ath11k_pci 0000:02:00.0: wmi command 172035 timeout
[75809.770930] ath11k_pci 0000:02:00.0: Failed to send WMI_OBSS_COLOR_COLLISION_DET_CONFIG_CMDID
[75809.770938] ath11k_pci 0000:02:00.0: failed to set bss color collision on vdev 0: -11
[75809.770966] wlp2s0: associated
[75809.771051] wlp2s0: deauthenticating from a0:95:7f:45:e8:47 by local choice (Reason: 3=DEAUTH_LEAVING)
[75809.782908] ieee80211 phy0: Hardware restart was requested
[75809.782932] ath11k_pci 0000:02:00.0: failed to lookup peer a0:95:7f:45:e8:47 on vdev 0
[75812.842136] ath11k_pci 0000:02:00.0: wmi command 20488 timeout
[75812.842153] ath11k_pci 0000:02:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[75812.842164] ath11k_pci 0000:02:00.0: Failed to set CTS prot for VDEV: 0
[75815.850227] ath11k_pci 0000:02:00.0: wmi command 20488 timeout

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

---

 drivers/net/wireless/ath/ath11k/mhi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index acd76e9392d31..af7ff4fc794de 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -286,8 +286,11 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 			break;
 		}
 
-		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
+		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))) {
+			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			queue_work(ab->workqueue_aux, &ab->reset_work);
+		}
 
 		break;
 	default:
-- 
2.43.0

base-commit: 0f70f5b08a47a3bc1a252e5f451a137cde7c98ce

