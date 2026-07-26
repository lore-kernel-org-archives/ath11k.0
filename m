Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296CDC5321C
	for <ath11k@archiver.kernel.org>; Sun, 26 Jul 2026 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9fcVVwyHbUhNRIUxOg0dRn9BUzSneLTHuKU2xQuQd4=; b=lZzcggLfiDUhQ8A72Q408AKKNV
	n0OMEC0vn4EEvBKnqdSlgkwc/P9+4/lmx5Vaqa0i7Y2zdp0SKboIJ87nHZmHhUHx4l+z7jhtY/IJs
	qhUCvtbVz49N+qO//I0lbbBxjb2vD5pw4Cx5IR9COxVIKCo1Jw9T8ouoHLdCJvRE3ZzE+iePKyI8v
	VpaipIye0OIerbEZccj6mfTsPCVi1V3JstVV9gTVmLGrgov0frk8M5he639tVIpqRSezoHdJJEyTU
	fXe2o4HKmHomy26TbTCi1XHAJjzwhDek1I3bzvHUakLLysW/GIZmP/nsF1juXmPD6c7XqiwZRSF7M
	2N+D725w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CH-00000001ghW-4Bnp;
	Sun, 26 Jul 2026 22:19:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CE-00000001gfr-2ILg
	for ath11k@lists.infradead.org;
	Sun, 26 Jul 2026 22:19:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15e03c2763so400488166b.0
        for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785104385; x=1785709185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9fcVVwyHbUhNRIUxOg0dRn9BUzSneLTHuKU2xQuQd4=;
        b=PSyHK4QY7A2YUPhZXwEZeJPxoXNMbF1aTgZ2Wubq/XIopn6fZPOkJ6WrUIYUGJg76/
         1geDY5ox5WdZyhd+Btvowua4hol8qLvSByGiVGXOzgEWF9QrKj/zDIXPP1qisAE34HhU
         U2eZxEcNsIGzdJmo15YTcKWCN9oERAu6rhUk9FjHI4NSGIhcfqRcGW8PRjS5oUsKBOru
         oD9Ugrxiy7Ci2dm9+LruvHs4pA8MpYAOKz4FIqctHnFMPddADg3z9M/PyOxzmjHmZLId
         fpWGi2q3UPuWWMGSyOH+OR+ynl4nC6cjer37w+b+AKskQrqhvqZg41QabOQqOdzok2/o
         wd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104385; x=1785709185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9fcVVwyHbUhNRIUxOg0dRn9BUzSneLTHuKU2xQuQd4=;
        b=R4SF2EPjJhQoNbVffliBhU8XC87v+o7b6F0TmD8UtrDym3OejZIIW4vbeIN3XyJcKy
         FK1NHtUzdnNO5smuMrc4FNVHKs9QakoNTewf+UXfqc97NmVguGzgkqg2nxCH+tVxpBJ/
         2ph6/z1Pwr+5BG3N+7gnsYfncuPyIQhpjUNaQKggNTF5ka6HHdy/HLXbzEbyIGk0kA6+
         ppt8qvSWptk11abP3pE1TV7G+gsEt37wTD3V3+BbRPgSklGp94cyUEw/B7UKlfx9A8bd
         hWQiRlWmbJVPvmBp+yVKMy9XOe56oT+Hm6WuU3NlrKbxQ7E2T0COd1+uhwXh91/jqwMs
         Gosw==
X-Gm-Message-State: AOJu0YzN2PBxUyqBOsmdgcpT2ssnOqTwQDxuV8UzBdG+aoiCfIR9BsQz
	eim1621dOYSp4OUiSybF/Jiqz9D6j+GdwftFMRgQp2WrNfDW7VQ2Vj0Xx6hY0YJTeg==
X-Gm-Gg: AR+sD12v88bNUZgSoduCEF+Yhms5FmdnQcI236xdivHWPNb8+ARW+fzFobh4nldWlUj
	2AhCMpFt1vcDqBQ2hLes8Sw19P459u3p+FsLgZmUPYSSWhSsiwkz+cVpzFucCDOfaB86Ev9Vbw6
	o0tTHYD6UqbUHxTOx3drHJ/V//3g1LTIB6LRmy4g21Vr5/OPr+p5sDslLG9xCwpY4GIe256wvtY
	p5dV9f1sor+dyO4K4mzeKQzJGOhrqjyJIrnja0oxOvYYGFOjqB0cVdFFZQ7KJF080yF6LsIdV/H
	xwtnsBzwSRwbDrmYUjHYXW5zQwzy5lb1HQwkj5zeYJlkTPuVGcTX+evi8xsvcUbeKshAd1BSJQV
	WZQbmThZi7TBrZ2y/ScGvk0AV7rnpC/G2yVQqXzXxQ+SBrDq1QHQcFg70ED5kH+CT2BDQeUjwqe
	MjZSm4S2WwuVEroYsGNHAzRGC5HFLvw/ZYHeSgknnZ/unLDhCyfAWP+tkTdCXTM58ddTxm6r9kD
	fsngcAiPHnia7riGBKpLvMd2YzuVj90aFqAD/mtiBi5Vw9XxvQVI7xj35zBDS08LJq1YsPK8sHV
	YEYOD7j7pA7jGUQLags1whCibfKmyRhKEeIUHS0y96St2Ol2RSYeNmsabHCFPJAw2xtfAhQAryc
	noORM9VSq1rQKkwLLvuita/HfWaPzNCQ=
X-Received: by 2002:a17:907:9286:b0:c1c:1fbf:5d18 with SMTP id a640c23a62f3a-c1f13388df1mr379927666b.3.1785104384611;
        Sun, 26 Jul 2026 15:19:44 -0700 (PDT)
Received: from Desktop (p54affe4b.dip0.t-ipconnect.de. [84.175.254.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fecsm561599466b.8.2026.07.26.15.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 15:19:43 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during firmware crash recovery
Date: Mon, 27 Jul 2026 00:19:08 +0200
Message-ID: <20260726221908.104873-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
References: <20260726221908.104873-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_151946_601532_F4E94AB8 
X-CRM114-Status: GOOD (  12.96  )
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

On IPQ8074 a firmware assert reboots the SoC:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
   ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
   ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
   ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
   __napi_poll+0x38/0x188
   net_rx_action+0x120/0x2c0

ath11k_core_reconfigure_on_crash() tears the data path down with
ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
which memsets the ring list. The DP NAPI is still running while that
happens, so it services a ring whose address pointer has just been
cleared.

That function used to disable the interrupts first, until
commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
moved the disable into ath11k_core_reset(). reset_work is only queued
from mhi.c and from the debugfs hw-restart handler, so AHB parts never
run it on a real firmware crash. Their recovery goes QMI server exit ->
restart_work -> ath11k_core_reconfigure_on_crash() ->
ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
anywhere along it.

Disable them again on the crash path. The reset path has already done
so by the time it gets here, hence the ab->is_reset check.

This is also why the debugfs hw-restart trigger never showed the
problem: it goes through ath11k_core_reset(), the one path that still
had the disable.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8039124e7832..d2ed6a0ea7e3 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2334,6 +2334,16 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
+
+	/*
+	 * ath11k_core_reset() already disabled the interrupts on the reset
+	 * path; only the firmware crash path reaches here with them live.
+	 */
+	if (!ab->is_reset) {
+		ath11k_hif_irq_disable(ab);
+		ath11k_hif_ce_irq_disable(ab);
+	}
+
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
-- 
2.53.0


