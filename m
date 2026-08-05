Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180F4C56201
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvEJw99p8ayWOXHnBsyaDzv0WkQm248L0elbcOdHRLQ=; b=ZJcVTkiFW0pfh2c3ZAxNTcj04A
	hTuddOVHvFVsf6mZf+jNqMUxTbM9XHEBI2ICA9C6BSBpxgcw2BeO2ihGTjBAFI3IM4v60dvlP8sp8
	ZQ54Tpb306XxYJgaBfvujjFSwxh/pG8QVxSSG2bN8gf6q5ukPHDISjNU7NKRxufciGrFvZ1AOU3Sw
	QXACAgBtww3a+dHvUbGllunKYpKtYaaNEwELxgGQxpFvgwoMcd/TVPL5u8EjXv7z0D/YTZT69+aYC
	ocyYJPRzp/Zjec+P/FgKYJWR39TLFRHpjY9KhLjupFgqZgGCfd0F/OjPdCloSQDcyba1IZ3QsrFDm
	0KH4uVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZAc-00000003lzr-3V3I;
	Wed, 05 Aug 2026 10:48:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZAZ-00000003lzX-2ruY
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 10:48:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso1413838a12.3
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785926897; x=1786531697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvEJw99p8ayWOXHnBsyaDzv0WkQm248L0elbcOdHRLQ=;
        b=gFXCtKCu0nMFXaHqkkhrGZnbjGccoHyMLgnBp/F4vQjnqb11lGsRgC86UlUzE+UV5U
         Bh2dNsQQ3Et8Jth3cgCkafOqNtAQqEEM6VE5UKcA6Djl4132gduV8gXvi+wrKtn2MO8b
         MLS1Kw7TMhNoadWoYE5ST1BeG0Zc0euN8fWMIIwONC9mlt8HatDw8pbNgpPYVHoxhxiu
         jEFL9OjvIp0vy4Y/jCujEj1UbXHRuckfexhqt8j6t1zuSVa0qwN2HvzvQGFxek11wR17
         Z5uTBd1nT6wNqAXiJyr3F1irhbpTpk9t9WVwIoI3tTkhjGvl/MKm94vbdDvwYCq55bXZ
         7Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926897; x=1786531697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvEJw99p8ayWOXHnBsyaDzv0WkQm248L0elbcOdHRLQ=;
        b=m5VTX+lyK+drCoo2F7Dm6pcIhYoF6+F7Z94nzMec0lDoEt5hMPE7wfION+FSBvPtrG
         lKFVxb1UKUVq9b/nhkeqneBwgjkAGrQwpkHchjU+o0fHHFuLDvrZpBOyn9xwK5225iaG
         n4dLQQomc1xZpViNh6lcIWX1tj0ZGlvXyPFxsHDRtBlWTa0WoCiwV5Z/iIaXWXEirT8q
         JUgFD8o25erfP4FirwmT/MgP2BHOdDZVb1XMIY8OqqIIBh+9ZEPpNpENid56AwLV4HpR
         9HkF4yfbtQW0YQG0kjnvWm/Edavqw+yHSzXfmvcKapNDD01BW3dFZBtSW+ZuRh/gyrBH
         8HZQ==
X-Gm-Message-State: AOJu0YyNa8rFrbFwuIaLazq99mCAPNbBWocdcby09/bH7vHU8WJKjalI
	2VNn390NwtFlroHsBd1chH462xK4z2M903qMTVYOnQquQN12Akhr9QuoN1z033LqoA==
X-Gm-Gg: AR+sD10SeEDjD4YIj4alyPG18sGkyYqvLcit+I1OzKFm+yn/aTq44Z88ju9ZqT4y4mv
	gYij8+YR7TSMmYMOGiZ+me2GnowOQybW9qJHUKIW1poUC9tnIcVa+RnnHqV+KZrpKVXxi/32UcJ
	GrbxBUNXxBlqy5FfdSxIcKLuDX/659YJZw3gCGR6jKuHruYdB4HgmRTRW8hZFCtdEzTpIpU+h05
	DFwoEjh2RDWr5OvRMZ481eqODfUHMc5svyO2rwm6Iz1kui25wWVT86UsKJAMNdkpXzckrZvBjuW
	PswdA3jGFwOvSiTkf/PW1JedN90cO8lL4membLRvtsNZIXfGEF+zOzFLd28gchrYU9F8SydsTmO
	JuKVAx9Fz81OyVsLJQQf00SJcsGEV8a1OYMNUmC+GfTtcJE4N5VPtOaP3c8oDj4elLvsd9Re+ST
	TuYtwdb8Z/jRM6ewJsU0QiYpFT1+W9PwQ9ket1G661DEl6JA4iUK0CYOvTFcRX9w1jNdbgEwFEO
	RvNlgc3xZHcJRyhpC4oyQ9HA9CnLBa5qDfdOpZaloBROp7J/Bz3fZ7ksD0yJkdo6HOdM2i42K+A
	Ou8Qthsohv5pFmoAKRWj0ZCgrViI2v6hZmDppCYT/ctaMc8ihdIjb8/XF/QmRxmVzK/BuEruvFU
	Ix0gJAJogjafjwGVvJi3iYcwRTpK9acJhGgAukB3MIHz52ykUqXSsNu7kY1VNQfiHyQr2cxyWQw
	KhcSyD+yezDeeu
X-Received: by 2002:a17:906:ee88:b0:c07:43ed:1b3e with SMTP id a640c23a62f3a-c2039901c40mr314065166b.0.1785926897008;
        Wed, 05 Aug 2026 03:48:17 -0700 (PDT)
Received: from Desktop (pd9513f50.dip0.t-ipconnect.de. [217.81.63.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036426ca8sm91267766b.50.2026.08.05.03.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:48:16 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on firmware crash on AHB
Date: Wed,  5 Aug 2026 12:48:00 +0200
Message-ID: <20260805104800.576058-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
References: <20260726221908.104873-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_034819_761509_DD5435F2 
X-CRM114-Status: UNSURE (   8.71  )
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

Ping, and some extra data since v1 only had my own bring-up tree behind it.

I have now reproduced this on a stock ath11k with no out-of-tree modules
loaded at all, on an otherwise unmodified OpenWrt mac80211 backports
6.18.39 build for the Xiaomi AX3600 (IPQ8074 hw2.0), firmware
WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1:

  # grep -c ath11k_nss /proc/kallsyms
  0
  # lsmod | grep -c qca
  0

Driving the debugfs simulate_fw_crash 'assert' trigger, panic captured
via ramoops:

  without this series: 1 assert  -> panic, SoC reboot
  with this series:    5 asserts -> 5 recoveries, boot_id unchanged,
                                    both radios back up

The panic is the one from the cover letter, verbatim:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
   ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
   ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]

So the AHB crash path really does reach ath11k_core_reconfigure_on_crash()
with the interrupts live on a plain upstream driver, not only on mine.

Two things I found while doing that run, both separate from this series
and neither ready to send:

 - the recovery leaves a list_del() warning from finish_wait() in
   ath11k_wmi_cmd_send(), once per recovery. ath11k_wmi_pdev_attach()
   re-runs init_waitqueue_head() on tx_ce_desc_wq on every recovery,
   under a task that is still queued on it.

 - once ath11k_core_reconfigure_on_crash() takes its err_hal_srng_deinit
   path, nothing calls ath11k_hal_srng_init() again, so srng_config stays
   freed and every later restart faults. A recovery that fails once looks
   unrecoverable by construction.

I will send those separately once I have them properly narrowed; flagging
them here only in case they are already known.

Thanks,
Julius

