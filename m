Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F22CD128A
	for <ath11k@archiver.kernel.org>; Sun, 31 Mar 2024 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Gvf0TB9gdvM7ObSkO22eqDzHN9gDvcMbJP71TrQx+w=; b=i7uA+a5ew9Z7QmlEZSazGk46Fr
	4Vjtgm0LIv0HCGWy3XAARZ+01n0lcWeTtcafebZXwnWp1edPfFSaSTPSFeA4Y0YhBZruU1/jBJP8L
	/v2wniL6IWpSC7JcCd6FPKKa7kAfP17TCHbOyI67Vl8I12gadB+DjQ5FiRLhgCy5BksMfTtXN20l7
	ugansaDoWO/EDte+DU6cGl1r/sX+wkpiJ4Bmucn2QpNjXRRW2rvPdtTSIT/xlIbFkN31EpRg/7Ph/
	MuMGFQoxgwdqomE5wn814MLX6EOuzkTbF4g1AnIwOTwOLLKmR9IRJRbl9vNicGVjV/g0zs5MWVvOa
	6LBLcO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqxRH-00000005df9-0O8j;
	Sun, 31 Mar 2024 15:49:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqxRD-00000005de2-2URt
	for ath11k@lists.infradead.org;
	Sun, 31 Mar 2024 15:49:41 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d80baf621eso9998061fa.1
        for <ath11k@lists.infradead.org>; Sun, 31 Mar 2024 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711900172; x=1712504972; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Gvf0TB9gdvM7ObSkO22eqDzHN9gDvcMbJP71TrQx+w=;
        b=iY26lMPVzseUWKbj+1wsL3As47xq5Dyg0x2cjBzev1qUE5byTCJsdk5S8ajkdCDMHp
         xthfFM/KmufroY26s5PkJ/+1ykJuSOVl4q2/Y8MMoW3k0D7t8qmxpv6vyLbqZn3dkzH8
         VM2ZpxNw2szJ2kArUTr8I272LckyJ9rpGpei2vL/FaBni/VzavrvXtS3QC5RN2lQtnFg
         e6PVQ9aVcc+axShUnj+xnRfuqyaiT+p19fHGKozEO6jMGDfOQfSTwWYjsW9NINMloOmv
         pK/Z44OgV2uRxArs1oSc+4Fc9t0vT+h8PWZubi1IlkuMceUvSL9O3M8w1KQwR+ZtAznA
         mzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711900172; x=1712504972;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Gvf0TB9gdvM7ObSkO22eqDzHN9gDvcMbJP71TrQx+w=;
        b=kFU+DizCFWzLJ+n/48a0478ekZZveB1RKgjxBfYJdWaTFyOQbTCUy4QDgz/YL3SINV
         w0vIVGiZgq3PeM6Pe5DgiLP1L42GHtN2IT8VjT2pr2kWD8rU6Neg4e49UIIVAe0A0F8C
         Pdgt0irAHiGGBqNJpnxfNzPjaElbz7tMfYL8e8eFxspJpTR00tAgt3yFqy/NukXGT2XZ
         Kw521SinscITrwV3KWEVzIrXs4YSoRzLJZHDn4rNMfmnvOW6wyMvfBaCXIW+rndxDqJz
         UATvtrJHthRJ3+oDxnZTpK8rw29aQj1mt/jEbtPA9cFesXdUHlUzMwuE9uxzviicQMfT
         UILA==
X-Gm-Message-State: AOJu0Yyu1Wp8Pg+lNYRaq4+ne/uJdKwxP8//KpWoRfU60F9BTCOv7f0q
	iOv3vrNdhxEdRnIxkfI14IrlowIZ7f+Z9xg5WUvAcWLeJ/N3a1G6q14dKHCdxFQ4eauwA3HPfTC
	pr7NOzCPZiTlRT/4uUzyOUs56GmVujsjcDTA=
X-Google-Smtp-Source: AGHT+IH76XgXzgbuilgFPPT4zdOl8iSSBzFlAJ17qAnX94+aHmKlWtYS9RzZIVkW9fY2yI8fJO9zCXc+erUW7R39JU8=
X-Received: by 2002:a2e:9a91:0:b0:2d4:d50:2358 with SMTP id
 p17-20020a2e9a91000000b002d40d502358mr4400375lji.18.1711900171587; Sun, 31
 Mar 2024 08:49:31 -0700 (PDT)
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Sun, 31 Mar 2024 17:49:20 +0200
Message-ID: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
Subject: wcn6855 2.1 - slow download speed on any pairwise cipher except CCMP
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_084939_661985_DB8D1737 
X-CRM114-Status: UNSURE (   6.75  )
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

Hello! When I tried to switch my OpenWRT router from default CCMP
pairwise cipher to any other, supported by both my router (Asus
TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1), I
saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
is good, though, for all ciphers - 1Gbit/s.

Initially, I thought, that issue with either router hardware, or
openwrt driver - but, I tested the same settings on another laptop -
T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
was 1Gbit/s on any pairwise cipher.

This issue is 100% reproducible for me, it happens all the times I'm
switching to any pairwise cipher other than CCMP.

I'm on Linux 6.7.6, compiled from sources on Gentoo.

Here is my dmesg for ath11k:
[   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
0x78600000-0x787fffff 64bit]
[   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
[   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
[   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
board_id 0xff soc_id 0x400c1211
[   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
fw_build_timestamp 2024-01-12 11:30 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
[   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
Country regulatory setting
[   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
Country regulatory setting
[  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28

