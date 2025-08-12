Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2E4CA0EE3
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42ayFRPT6aNxOO7jhq6Z5xBdQJ5wshjj1ZEEOkKamCc=; b=V3kWHXgg6RNI5ufG6vHbHKLHHd
	eudcbYj/ovAKBtIf6NrX0VQeIYCOT1iC3MmOXbzKVQRAOGN04xDFDAdsBqsOIkL3X9psQTSm6Hz/E
	BM2N347dA+3RygXxWjGtrsPXPGrkejPumO/osmmdebVcrMn/FQCLbyKzcMNXxvF66BBzMHim4TTlV
	o215k1TfrjdlFQ5TH6KZHuCCjP3bpEzOWtbGtVYqDh3LqER3kfKKI1yvICinDzW0NfbGu0p0+wNdC
	2Le3plWiuI/ZwOpYxXQgzzKvPWxXrDwzeELcqW1YhjLTmkYuafrLdNAdF2oSF/OYbMyYeEk7tj1Oz
	cWlVviLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsqA-0000000BZXF-22ns;
	Tue, 12 Aug 2025 17:31:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloKi-0000000ApBa-12J5
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 12:42:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-af96524c5a9so703864666b.1
        for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755002546; x=1755607346; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42ayFRPT6aNxOO7jhq6Z5xBdQJ5wshjj1ZEEOkKamCc=;
        b=TBfXA9lcMrupLOkmigcn5OHb/oVwdH/5t2rULzsxv66PIZlA+8eh9v4K0wQMU5t/ej
         dXN3cb6dfNYgyln0J6wAuQP993E263lI0/MQXhzGxCzm8flgDPM788XgV1BZMwskqM7V
         clSK3WWpuQ2HL2tY75jJzCX11zeA3ZrkZ5LaWm/LbRzzhqI/SHybFN64HiVoiLOMapr6
         tyMdLSKrvhIOQomrdgjpW0YfL+t/r9ebxNaucLsPIsvQDqS1VCA7VAzKs/IFywMdlFFf
         usZtWhGXcU0MuiwJfA4jneIjXFNUdroZY5Hm13sO0n+1r48HxtPezSS1RFWtTtZZhd2C
         0btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002546; x=1755607346;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42ayFRPT6aNxOO7jhq6Z5xBdQJ5wshjj1ZEEOkKamCc=;
        b=sNepmrWZbGQpzAHHn7l4bRN7QPSrP1riuP2AHfeVhahlnu7E74wcMDs9kIx612hPpR
         VC26XEfO6yq0XyvLgyrISgzFY5m6hUrIYe3Wn5D9XtBtvtYDvML3/3eObiklxqQvaT7v
         bRJ2DtcddaHsgb4/kBOsx5l10lbAuIxnl1/QqYEWfHzueu6kYr1BtNFF/wuqpXMAyVYc
         563S6KPWxjwtZG4SIZ7wwpstB4Bv3cTWsykEfJsdhmtANGG3ouqpGaWlQbhIDSYq7Pm7
         FOHhJLV+dit38AYJhpwRKb4rmp7j2jeTAWwM5TNr4ZukPkFaAB4uP2p040pfu4nYF0Ie
         QPmw==
X-Forwarded-Encrypted: i=1; AJvYcCVZJXSMJxRa+riuZtqO8KERp+/IGIFwfYG/wVgs8gsF067Hb1NN9R776+k6DdgGKfWagy4nzc0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEcxhVBV/O63rAclZRYqoDTbPTf8Jqvnh9/wXB1p2AKiHF6ADQ
	4pDMnlepbdLH9E7Iq3BBvjBlvpZ9N3ijYDWENG2IpqjUmOsh7GVPOjzlQj/NGA==
X-Gm-Gg: ASbGnctKdjFSZfWL77dzl4lgqVEI3JcXvPAVX4gRV+6KS1pKe8HXENdArsGDXKCKhWq
	4MsPAVF01JFteLjYFwfYV7WwkR/k4k0VK7JU4dZzcQtYfshYJof+plbaIkcwkiNAiBS+6rjkXgM
	/PKhp1xkYgLRrF5//0QrGK8Cw3JZ1jRGRQynvS51uMUTh42CFeT/849ndznbsesuoqpCU/55mD8
	KFdgOI6hVodZNM5o0mddGU2h/vsdtsvqgwDotUkiL/60uICfgHrJtHmiZvSyQYMgAu5iUwUauvx
	hrPoEUNAj1Z6blnRVomYnzwa3h8bU9KFP/Bp+rqz9DyrGAOJIQVfwKdBqOQM2RBS5pIvmQVZmcI
	pRZ5smN1gXPkunPgJQkTaOVfx1Otl7+SA8WXdDOsv
X-Google-Smtp-Source: AGHT+IGehJbnB+OBaiScVaVRsVwqbQ2E/AdbTXgEuigH5+pk3WC5SfmkgvYVXVsb8amFtKB0t73rPg==
X-Received: by 2002:a17:907:72c9:b0:af2:7ccd:3429 with SMTP id a640c23a62f3a-af9c634faccmr1446529266b.9.1755002546213;
        Tue, 12 Aug 2025 05:42:26 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3149sm2189511766b.38.2025.08.12.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:42:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 14:42:25 +0200
Message-Id: <DC0GHB14QA8H.3K1CYOEI1AXNY@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Steffen Moser"
 <lists@steffen-moser.de>
Subject: Re: [PATCH ath-current v4] wifi: ath11k: fix group data packet
 drops during rekey
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_054228_286570_2127CECE 
X-CRM114-Status: GOOD (  20.79  )
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

On Sun Aug 10, 2025 at 7:00 PM CEST, Rameshkumar Sundaram wrote:
> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
>
> Under certain conditions=E2=80=94especially under high load or time sensi=
tive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key=
.
> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
>
> This issue remained latent because the host's clear key commands were
> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
> keys properly via DISABLE_KEY"). That commit enabled the host to
> explicitly clear group keys, which inadvertently exposed the race.
>
> To mitigate this, restrict group key clearing across all modes (AP, STA,
> MESH). During rekey, the new key can simply be set on top of the previous
> one, avoiding the need for a clear followed by a set.
>
> However, in AP mode specifically, permit group key clearing when no
> stations are associated. This exception supports transitions from secure
> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
> are removed and the group key is cleared as part of the transition.
>
> Add a per-BSS station counter to track the presence of stations during
> set key operations. Also add a reset_group_keys flag to track the key
> re-installation state and avoid repeated installation of the same key
> when the number of connected stations transitions to non-zero within a
> rekey period.
>
> Additionally, for AP and Mesh modes, when the first station associates,
> reinstall the same group key that was last set. This ensures that the
> firmware recovers from any race that may have occurred during a previous
> key clear when no stations were associated.
>
> This change ensures that key clearing is permitted only when no clients
> are connected, avoiding packet loss while enabling dynamic security mode
> transitions.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ=
_LITE-3.6510.41
>
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba=
7fcf20eabf@steffen-moser.de
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.co=
m>
Hello,

I've just confirmed that this works well for my devices. For the record or =
if
someone else wants to check it, I run an AP with a short rekey interval
(wpa_group_rekey=3D10 in hostapd config) & run a continuous 'arping -b x.x.=
x.x'.
Without the fix I loose broadcast connectivity from the AP to the STA like =
once
every 3-5 rekey. With your fix everything runs smoothly.

Tested-by: Nicolas Escande <nico.escande@gmail.com>
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

