Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8F606A325
	for <ath11k@archiver.kernel.org>; Fri, 20 Nov 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+8CBqqY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FOXyi8RR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=; b=w+8CBqqYZ4gzcyL1bqct9DIpTg
	3j/srfBZ8TEIkf11XeE2Jeyk5ZT64UFyQtClw4xVb/5m3bE9QfA83k7777TRCrTVx4me4acHJIO8O
	6OsH6xbe/AnJa0gwjV758L1ovHB7/amDe+piOT+E1a0iFgn6MdMtvK6Fmtt0ir6w0HpK86zc8XFmz
	rPCuLEyukIRQ3PxQW3ohaBtOjHyKK9UPxh0/Lc06WwbfT18g039+6TJ7hxhKoYB3bTRZAtITP4HG2
	xv4CO63h6Khz6RhRExRfCEj8XU1z0L7f9hpdHczjocir3NghU8tR15yJiNtK4fwZ5SJiW1nXXrA5y
	EGOLt9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ0Y-0000000FJjr-3pUF;
	Fri, 20 Nov 2026 14:54:34 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ0S-0000000FJiZ-1qwW
	for ath11k@lists.infradead.org;
	Fri, 20 Nov 2026 14:54:33 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5eab93a9862so247865e0c.0
        for <ath11k@lists.infradead.org>; Fri, 20 Nov 2026 06:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186467; cv=none;
        d=google.com; s=arc-20260327;
        b=D2yr/nNme6yYsFODOomooV/O4fNStj+5AWd8SdKXrWcfEmt81lsMWfr/1eQ6OSUYc1
         s/JCYcn6hPYS+dzIeOU/sarUaiHAMpxp0M3WvIlECRBVgE+k55i5oeu/AVa3TQ4ZkHCC
         lgOLAl76PXGA6s9uGv+iplDtD0JdzNk13hlgQb6AixlFeWYpCzvawjtL/JVG5ukbKAc8
         YdZtLhnLxdlrNlze/A+DQsPM3475/YcDIMFvOpqnm07zoz6V99iUE24VUjKwzDsG0ywy
         HkC0HJxBh8SRMp2c+SqWvl/wmi75tGZXvSNnaLeGr1lWWSzgikNN7YDxT6aUvmrAUC7c
         lY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        fh=6cbl+D3NNyud4jXTd8ezym50NAZEqu7/8Jrox0wa7G0=;
        b=kgyc/NAriTPR/K5vV9VgmTkwTepchyhHsf36HMaY5qtOWnnE9ztcVFX90XDk7f7QDs
         ej77CybqSWAqMj70bo6SFjen9oFz4Xow3lEwSZxBUwse6TlhyAIiFNACl8TGZsd4mNEu
         MoGZtL174lDw5Tv4nZz+xC4XyUZSf08d3Hl4KwzqPUGDQ4HCeCvFFANSLbUK1jDPH+WY
         wZuxablqeDRJpVYG6vVJXza8i2UbeM14JSkQL9VF04AHfJ9FB+h7MtpNQtTB+dtBCBJN
         /CeFPt5r20aAvqrZ4PoJxA/kfp/SmBNldI01iPnwZDovzhQJtO/klipqiy0mlq7WqOUR
         nNmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186467; x=1795791267; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        b=FOXyi8RRgJllpH1l8nrnIIcGWzLDe7NGPWGhjFmQCnrhrKM1O6G1eJUE+QwhL/dHuz
         yWKjEFBiCtDDlhVi/JXlBDn5/jKj1jXbtKh0ccwvRGSvfxKwYgAUHJHPRvt42p1m4HFA
         X+UY82CPr2cJ0f4YGwc7oWc+1JqpwGKqZueEBO/ADndMFNfLkjtp27FdMLYgqwvtNjek
         FAB16Fs/tV88qcC0RiG2iJaVl6UmfPYtwHCr7EITE7d6e02Ig1d+DS4c0mlCl629V77/
         zPX17IUsPZE3u+Nvg3QCEB01EKtldycOJBSTKq68BEkoV8w3XOWWXJqzSNzjKiMgS1L7
         6kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186467; x=1795791267;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        b=rLCiua5wHVtoj+KyWx0JkneTDS2q8Ds1FJCNorncDhEEmPtLEDASr4n7g1KYI/dbPj
         qgeagB3XdR7hBQl30lRCk+EyM0hMoXptSX5crtpae6cT47o6M8rIabijgU1u5SJ7VcvW
         8rtEJZKzOOEzvchH3RHdzM7YnFEiGTe1RhELaIU3ifEEGWwJB7kTaenzI77Uv10MwRML
         6mJkke+87Zr11cyg7MHKKipOoz+z8U0f59jnSVFNItD/cIzXAWWkO/n/WW5rTu/gUMBZ
         Cccx5guq9fPwMQht+DzF5HZtUmrmQsfxoI118XrzbyQHR/SFO41A5ra6blpY6Zy7CWSn
         L40g==
X-Forwarded-Encrypted: i=1; AL+hErGYpSmN6aqiNfaMRwIZaquuUuTqxUeDje1H85smVTPcOXMSvEOOPtLKLGwq7NgDbTG7oebbjzo=@lists.infradead.org
X-Gm-Message-State: APuU4Z9dvXJHt83AWv2bIA7wH6dXOvxiTY0JjBuks4p5Vms+ZyLh9+bV
	yNZEnfbBbsmCuXij0lIolLkzIwAWmdwtYx3Y+FEzbgAMSdFEQt7MFl00zGZ7yd9EFC2BD161I7e
	9ANNqdMo327B+RXMpKA4oIh7fKK8cRkg=
X-Gm-Gg: AZFdTZcsftnZKUGqQfL2J+HJ+ch5KPalhYhMAKwbfEI96OmZLJq3KKKF0WpWFrc7R2+
	tEQ0FgJUNYhuuPONAchJnmjhOHruuKPLYt3Q/S5Slu2xpoRPrgk/pVAQSIaHLR83HuBzcZM1Q36
	YEIxmRHKRbLHJZecUxBCGijvz56eIkZeLyFjs7nG6TMC4Qq66FMc8ZVHM58zDPCXPSlm43jodXn
	uzYDK15dycrrE1kl5XonNI60MspMirQJeBKBycpSmBpZ3aajUmcNyWWqsYDbJgI9lBZw5GpOvGV
	c6OJAELbbcDktLg6JIrAQ2qxfLoo8p1QE9zTPt818WKmDJOWfi8XQKbwJ3aHFcpyHOEVMMurpge
	KADFT8fDrvNGxnCJBvNBfbJEnpT9dOjC7teVzHVFfM6nrKcVqF1Viz5v9gjKoKs5GcgrulvV167
	NCNUczJSj9XXfPPsGDnA==
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id
 71dfb90a1353d-5ee8ade9b3amr1350725e0c.3.1795186466579; Fri, 20 Nov 2026
 06:54:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Fri, 20 Nov 2026 08:54:15 -0600
X-Gm-Features: Aa3M54oeS5uX-0Ck4ISDiMv4gz1OVwu_ru9ceyr_rXX6mPr_8kmYpVXPxRxJ0eY
Message-ID: <CAKobHXBMM5CL1Vqaate=+DrXunEzcjKFbSSx1r7a1Oj+7ziMwg@mail.gmail.com>
Subject: QCN9074: HE SU TX A-MPDU stops at 64 MPDUs with a 256 BA agreement
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_065428_619763_6F73C50B 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Baochen, Rameshkumar,

A firmware question on QCN9074 hw1.0, separate from the boot problem in
my thread "ath11k: QCN9074 public firmware stalls at QMI cap request on
C-360".

As a 6 GHz AP (160 MHz, HE-MCS 11, 2 streams to a WCN7850 client),
the QCN9074 never puts more than 64 MPDUs in an HE SU PPDU, although
the BA agreement is 256: ath11k sends WMI_VDEV_PARAM_BA_MODE 3, and the
client's ADDBA response carries buf_size 256. With full 7-MSDU A-MSDUs
a PPDU is about 2.3 ms of the 5.484 ms allowed, and with preamble,
RTS/CTS, BlockAck and backoff about 15% of the air goes to per-PPDU
overhead. Downlink stops at 1.82-1.83 Gbit/s TCP.

Numbers from htt_stats PDEV_TX (mpdu_count_tqm / num_data_ppdus_tried_ota),
iperf3 TCP x8, 20 s runs, client at -37 dBm, HE-MCS 11 on 98% of PPDUs:

  WLAN.HK.2.5.r4-00683            64.0 and 64.3 MPDU/PPDU, 7.00 MSDU/MPDU
  WLAN.HK.2.15.0.1.r2-00004       67.6 and 63.6 MPDU/PPDU, 6.99 MSDU/MPDU
  2.5.r4, A-MSDU limited to 2     71.0 MPDU/PPDU in a ~0.7 ms PPDU

The last line suggests the limit counts MPDUs, not airtime or bytes.

None of these moved it (each accepted, status 0, one at a time and all
together):

  WMI_PDEV_PARAM_MAX_MPDUS_IN_AMPDU 256
  WMI_PDEV_PARAM_SET_PPDU_DURATION_CMDID 5400
  WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID tx_aggr_size 256, A-MPDU, with
    and without the 256 BA bit
  WMI_VDEV_PARAM_ENABLE_RTSCTS 0
  peer_max_mpdu in WMI_PEER_ASSOC from 65535 to 8388607 bytes

WMI_PDEV_PARAM_AGGR_BURST 5400 made PPDUs shorter (~31 MPDUs). Setting
WMI_VDEV_PARAM_BA_MODE to 0, 5 or 6 instead of 3 also gave shorter
PPDUs (~40 MPDUs) but RTS on a quarter of the PPDUs instead of ~60%.

Two questions:

1. Is 64 MPDUs per HE SU PPDU a design limit of the QCN9074 firmware,
   or is there a WMI or INI setting that enables 256-MPDU HE SU TX?

2. If it is the firmware, could a QCN9074 build that sends up to 256
   MPDUs per HE SU PPDU be published in linux-firmware?

These cards only boot release-branch builds (2.5.r4, 2.15.0.1.r2; the
other thread), so a build from such a branch is what I could test. I
can run any build or setting you suggest on two QCN9074 cards and send
htt_stats, logs or a capture.

Thank you,
Christopher

The tests and this note were prepared with Claude, an AI coding
assistant.

