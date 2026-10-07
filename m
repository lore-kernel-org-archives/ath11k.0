Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95A1CA6002
	for <ath11k@archiver.kernel.org>; Wed,  7 Oct 2026 17:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XylpUE0I2nGeBgwFtrUE5wzNHACJyMShQ047aik0R0Y=; b=X5/SoFyJBvdWFq+S+rriITfouC
	0cZUJbYBKcCkbFf9AehAmYu9zxSriTsSeFvljq3/oclCwJZUaixVLsmoavh9/vrnBod/s/fAp0P6x
	Ec5dLwDFu2C+tYvx053wb2Cih86ZcaZOOu+xvWW86zW9rKAFIEsIkBqZq4LSyik7p2T6pSPjRfLm0
	HJZPFb1169Loo7YQgN+0/zdvMVDtQ80PLcnHpKeoJrIU7laU6iyyJe8mM8tkBEvXPo2RckjIPxjzC
	N11Xev7DxtvUxrHJ0Xz2aHniO660JQsqh1pHF4g73wF0EXU0s7G5IwFNFTNBHtVSBJRvQFNo/E9l3
	aM5/CFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVdw-00000002ody-042Z;
	Wed, 07 Oct 2026 17:41:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVdt-00000002odg-351b
	for ath11k@lists.infradead.org;
	Wed, 07 Oct 2026 17:41:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so6203111a12.3
        for <ath11k@lists.infradead.org>; Wed, 07 Oct 2026 10:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394883; cv=none;
        d=google.com; s=arc-20260327;
        b=cRYroD4wX7cSGzLakJpZBPZvEqh4cescmchv0gAoF2J2Esn6DE+28Ghy2LYiQafjsK
         Hnd0dfyFLl0PehwU9BXTf6lUq6uq8H2pyLLhoIZzcXfsJNPxGx8ZACH/cCp3//0SWmw/
         cMhPejNSIfXmMz4UI0FvWhLuPmyhW9ta+eIlGVKCLAvb/c8pag16LIImQRDyzKUedRjT
         WlLs3/89efUn7x5LsUv+Oa6y9vKH7PdF7K5y0HQOG77av0tX1FJqV+gEbXWpuNrfUIhV
         REDR0Gh5Z0jltlf2AR5sqsuxUn6ybGki/V1ipN88GpSm1BIjzIVdG6pjoccsLH8+LjVG
         PfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XylpUE0I2nGeBgwFtrUE5wzNHACJyMShQ047aik0R0Y=;
        fh=P8JnnWkwNLrKSKxnDbU+mi+UbCTIFHcZgGeDERvZPL8=;
        b=FbS580VWDefEHTJLQH5+86BkkINtUMCp0aQ93RZ3PajlL+/tsL/iwj7z2T6dxTzniz
         j856Q70s77uzJ5gROi0ypigpDID4TIsgcQGqB65U8g0SRD9yZPXKwz2lbfPOgzfEetjw
         ZnFzjMpwPESVHqZQKg19OVxhYgCfpqcMKNbQp87xFQXQf3ndneqk93/Yxou56KJEVIqI
         qEDTP3gDpM4wEGiq8FF9HZ0F6Y6szj3we5vFxE24by+ih1uyiDH9HZeiU4B1qAraH7KB
         8Q8VPDY4/cgWgRFxzRL0m586qO/RFx+SHT8YjrBC6B2CHg8MUnSwyvFTT0rzpKZjYszI
         fOvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394883; x=1791999683; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XylpUE0I2nGeBgwFtrUE5wzNHACJyMShQ047aik0R0Y=;
        b=U/2IdGTts61Lbgy8JDOfI/KZcAHF850DZjp6GnY+closbIQhLeWeW1qskymZ6IQGZx
         iF9OGdBTrAU47Tu/U2SNLO+DBRgEQtJVYRKCWefU5eI2W64SfQ/jmVUYNNiP/ZIJmH5P
         Zk8fTw9DzGd89YdRqg2AIultKk3+SxUMSm0NXY4lK8EhqEYOvlN6LMBiOk11RocIDVZ5
         UdWovNW5v0l/wwRkcKyoj8/7B2WEPQWYIaADvLMufehWIX5ti0LlmEO4j7iW/Tg9MF1O
         K/JIMMPnKR/VZIWflYjWGmwmizyXPKdqM3VEM5Kc+ZBm53DAculUecrCWUMcTpL1Q9j5
         iHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394883; x=1791999683;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XylpUE0I2nGeBgwFtrUE5wzNHACJyMShQ047aik0R0Y=;
        b=bx6LbQHfEVTlLSS/NSTAM7F7aW591yhDaHEciKBWnI/YWrroSbbWQjX+mhZ6LLWY5G
         /qpIhH7egBQGAsDWzDCdCVO/8ogiiEzY8UV/5dlrVp34yo8YPAow0Ubn97709jsnAZ9j
         TH/2kEWnrvxvD4HxE2JlVTc1YDESUTQi7oD3OzPAnsBoBo6eqFkPgR33Bf6xR8QiAkSA
         gkovGReU1aZ/BaXaDStxxAhqwVqcUb6WKE80YXQhTNSfynixnb6nEOXntu638byHeeU4
         4fQgPeqX8EihQbAcsizoSGQJYskHMHpHf3S9HiXR6NzXeaJHK1CWLHS1LNKR0hAp0oAz
         s98A==
X-Gm-Message-State: AFq9FYLQPOTNbcSCPZkIO4YOcchY1rle1jbMriCuddz0LWALUdWBQb96
	S5QsJYtKdB8OSiB+S5gOyr9lq32FlGQxWPIpZ9rW88UD11qr4pannQpEBgj8FZlZOtXLnJNbW6F
	8RwYZGWMiP0F5OlqIfGIRqVgBKcopmKVAFA==
X-Gm-Gg: AYBFou0yliEUjncqurqO3TYtyruLUgep4INaLhui1RAdxjrHe4aN5L4QEx9MCEfekbt
	OQzGvXfyYqlh4C1aEhpgZ5T15NyI8iEgnwxfHVeWZIoAAy6HBdc7y4vZkz9uTQ3c8ipzlsxnKQV
	x6p8QFWc1Q1T8Wi0LSIoGG5uwdVSVvLpvBgmAI0kNzFYOGDo10FPbaHoCOiYMeMHAPT5CSqDFUA
	INQcuWpA7E0qF8nhPv6gy1sXycHUaAQPyIgbgDCUUAQyBGtIZdDugYlifZDs11ilMRwzVzwn3D3
	z4AWh/KDqjxg/cKqHJ3IVBapLTd6lMzBdcq0Bj+S1YqdXw4okk/y3g==
X-Received: by 2002:a05:6402:218e:20b0:6ab:81e:e827 with SMTP id
 4fb4d7f45d1cf-6aff441894bmr2332913a12.43.1791394883309; Wed, 07 Oct 2026
 10:41:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 10:41:22 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 10:41:22 -0700
MIME-Version: 1.0
From: Zephyr Madera <dencity7@gmail.com>
Date: Wed, 7 Oct 2026 10:41:22 -0700
X-Gm-Features: AclHuK8Pxavj5AL4tzu3fUd_5x4Qx9JoVZa7mcyYokAr-1cN1zJq2Bx2A_FU96I
Message-ID: <CA+KzPsr0G_1tpEDyi2Dk_1ZF_JVeGJL5Y6_A0aCe=dY+5ufq+A@mail.gmail.com>
Subject: [RFC] IPQ8074 v1 / Netgear RAX120 v1: interest in support and review prerequisites
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_104125_866787_BCE6EA30 
X-CRM114-Status: UNSURE (   8.19  )
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

Hello ath11k maintainers,

Robert Marko suggested asking here whether there is interest in supporting
IPQ8074 v1 before preparing a formal support series. I own a Netgear
RAX120 v1 and have an experimental OpenWrt port developed with AI
assistance. I would like to make the useful source work available for
review, without presenting it as upstream-ready.

Linux socinfo on the unit reports:

    machine:  IPQ8074
    revision: 1.2
    soc_id:   323

In the OpenWrt discussion, Robert explained that this early silicon was
intentionally left unsupported, differs in peripherals and clocks, does
not comply with the final 802.11ax standard, and lacks publicly available
ath11k firmware. I understand that successful local bring-up does not
resolve those concerns.

The bring-up was rebased to OpenWrt main at:
    edc6b8f160c798cd211893bc5df25aec7cfca838

The tested base uses Linux 6.18.55 and mac80211 backports 7.2. On this one
unit, recorded checks include Q6 startup, both internal PHYs, LAN1
management, and four client cases: 2.4 GHz and 5 GHz with WPA2-PSK and
WPA3-SAE. Those cases covered association, LAN-side DHCP/DNS, ping and a
checksum-verified local HTTPS transfer. These are limited bring-up
results, not standards-conformance, sustained-load or cross-device
qualification.

The source work has been separated for discussion into:
- Two candidate generic ath11k parser corrections: host-sized MAC/PHY
  record allocation and bounds on READY MAC-address array reads.
- Secure WCSS separate-M3 loading and its binding, retaining PAS6.
- IPQ8074 v1 register/descriptor/ring handling and legacy firmware
  startup/event compatibility.
- Separate RAX120v1 board, image and upgrade integration.

The generic corrections have been checked against the pinned OpenWrt
wireless stack, but have not yet been rebased and validated against the
current upstream wireless tree. The v1 development sequence also needs
review and reduction.

The working setup depends on owner-retained HK1.2 firmware and this
unit's calibration. A public, repeatable firmware acquisition path and
redistribution terms are unresolved. Source provenance, attribution and
DCO certification also need completion before formal submission. No
firmware blobs, calibration data, private settings or flashable images
are attached.

Could you advise on three points?

1. Is there any interest in reviewing IPQ8074 v1 support, or do the
   hardware and firmware constraints make this unsuitable for upstream?
2. If there is interest, what minimum firmware availability and hardware
   evidence would you need, and which tree should the initial source
   series target?
3. Independently of v1 support, would it be useful to submit the generic
   parser corrections separately if they still apply to current upstream?

I can follow up with focused source-only patches and sanitized test
evidence. Local button and diagnostic customizations are separate from
this proposed hardware work. I have the router available for coordinated
testing, but cannot claim testing on other IPQ8074 revisions.

Thank you for helping establish whether there is a useful upstream path.

Regards,
John

