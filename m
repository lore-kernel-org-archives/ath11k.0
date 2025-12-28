Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713F5E784BE
	for <ath11k@archiver.kernel.org>; Sun, 28 Dec 2025 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Apfn0KmQlrxsfwtcbU9O/5I4jLFTnnC953VYvTwKvak=; b=zQEJPx8hq8rRF9Wqof8YUp6/xt
	K5fAeugUsoaod28W9AWYWVjR+ZNOIF4wrooODoiZari4KekOc4TztwaNuiOw+wXGbLQofcNMOaU0k
	XAMI1p+YPDvweNUgFEMNxDVkKr8xkvBM5RtP4W5IVVrTDeDjD0Eh7GjGi+cB7FwEqBQtIwG1Op90H
	8yo5TSMMLuukgDO//uWSyBVeWnZUNzQqIGz8I3ioypHEwfAs2n0zgF/WCIZo0DwWQjiWG+4T3Tlil
	t/fOkgWjC2SRpB3yIEEWLfu962QWZy8RssN7bFe9l/Rfi54g772lYrLkc2U8uzvLZ0yiC95KKuOHR
	s2dD3w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAc-00000002rTJ-26bp;
	Sun, 28 Dec 2025 15:59:02 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAZ-00000002rSt-3r7b
	for ath11k@lists.infradead.org;
	Sun, 28 Dec 2025 15:59:01 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7c6da42fbd4so4577320a34.1
        for <ath11k@lists.infradead.org>; Sun, 28 Dec 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766937539; x=1767542339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Apfn0KmQlrxsfwtcbU9O/5I4jLFTnnC953VYvTwKvak=;
        b=Q8KDweQq+nj/e+gbBUlI7XgYEyAlWflYmpqMyTmfTcIOp2EikXMSWlwchzzRzMGxWy
         icz6+l8+pDoTxg/rNwUCREmP80h4YOiCVfkKWBHXhy0cj4k6sNxpRU8/lGNI2/Uv3g66
         kMxW83arezIrB4bHfBtEe1c8Pn759Xd7E83nck08vnR14I0NCim5mXdpYzotqOYZ7l+a
         LgZvRa9IJdZXu5VM1TNhXefM7Dq1INswwoZnI/baqpKLJ38yanfEoHwkfT52RPixda4F
         OgHg8+z/nZRMXSIAkVtgE91qNAEyTbTsGxA1LuWvzQ7Oue0VaPT/BYIHCiEgqVb0Fuuj
         ZhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937539; x=1767542339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Apfn0KmQlrxsfwtcbU9O/5I4jLFTnnC953VYvTwKvak=;
        b=dpO4hdmXhmB14AkoOkd+VObDfQS6mz9rVb6M4lm+QqADxPH3BZv5982/hvwVtVr+kf
         WrkVZrWsQVDV5rO5eygStMIlLsbtZf5FYFuaWFzkDLsVYFdc6LEraShDzBMHiSqPcvf0
         OK+GpV95fFgk8v3uLomG+nS93mLSR7QOpEWQkLQuk7UK9g7xePRJmr3v/psaRikt2/cV
         lw8qkgw2QLZ4tPHzAuTyC7umshf54/XpGt117xyghL9QADz5yxhRAaSTXG11iwOGyv4I
         Xkh0ocTcm3/Txt4RClPd90RYWWxQsaoSwGtFBVA2bHkAmWsMH+YkzNe0xUeJU79NF4Uf
         gZMg==
X-Forwarded-Encrypted: i=1; AJvYcCX+hAHhJRY51UalG6U9tJZidM25bqNgJ3FcV4jiaPzmBO/sxWFCtqjNdNOKiQGBi2/PL5Pm06A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpw4jgCqH6czai3bMyySFNM9cDdMISl2/aaBFFB54Pi8TOqOl/
	Z1Qa9TlOKkBfsn7BO66WTcverhfLVLPKI5zfkKce7P1I43v2I7xdJ8Zt
X-Gm-Gg: AY/fxX7fM/oalkYzudqcCKg8mE60C6TfHvwYLhM4z65GgZooCjuy/hi9DK9FA/nflI/
	6WvRT6xjCkBCha5hAadvdfBM/USM8+iCAsLlLMStvNBVGz2CydFe3wdIskUmT7EzfdUDvTLt97z
	DTLQZ4P9P08kcrXYQpD+gxJ/ENYnGFFsHZBeTga2okCDDLokMryAatxa8zT8pkTMk+NYrNe0V/W
	LfJmArtYhJW3mVESyyY57I/ak0JEkG6CoNJI/DZ6CJ1k+i011i4fh9CeQtzCnFjm2Ot+NW7BurC
	GxH7sbXGHBwjq9j369mPmiCNoFsmGhF5mVrBTAyIw/Evqz4m0ZBcPjac6usCvXhfJeDf3ysyw4O
	bjB+KrYqfcifCV+uJ9uOR2nujG+UGg/RiTuK+A0y/Q269K/ZlBsn0hbwHau8gcWecxzkjvpl+BB
	cfhOmM3+gCsF95foR6ajkR4HIth1c3Xo18dQNxP32JmYJyQfUCXWwrnGgkOtPLgYYDJJFFqiMXX
	MrST/LKqeth+X8I8g7iOcuzfx/ZZD7ZE8ey99Y=
X-Google-Smtp-Source: AGHT+IEPnuAVgrQlyTcCck/1MSYHWZ1binnrypX4kIGAcjnHnqwbQcKWspQ2QoMzsrmBQt4uFsy7cw==
X-Received: by 2002:a9d:4798:0:b0:7ca:f4e0:9ca1 with SMTP id 46e09a7af769-7cc668e14bbmr12009180a34.14.1766937538664;
        Sun, 28 Dec 2025 07:58:58 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ecd6esm19004434a34.25.2025.12.28.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:58:58 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 0/2] ath11k: support IPQ9574
Date: Sun, 28 Dec 2025 09:58:50 -0600
Message-ID: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075859_984290_D1CF0E11 
X-CRM114-Status: GOOD (  10.12  )
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

Hi,

This is my attempt to make ath11k work on IPQ9574. IPQ9574 is intended
for wifi-7 devices, so it seems the exception rather than the rule to
pair it with a wifi-6 chip. That's exactly what my Archer BE550 does.

This consists of a wifi-6 (QCN5024) chip connected via PCIe to the
SoC, but exposed to the OS via AHB. The Q6 firmware [4] requires
remoteproc support introduced in a separate series [3]. The QMI
firmware interface is very similar to IPQ6018, such that almost no
new code is needed.

I am not including the wifi@c000000 devicetree node in this series, as
it depends on nodes from the remoteproc series [3].

I have been successfully doogfooding this for a few of weeks in AP mode.
There dependencies to this series. [2] is a compile-time dependency,
whereas [1] and [3] are needed for full functionality. I was adivsed to
leave [1] and [2] as separate patches and not add them to this series.


[1] https://lore.kernel.org/ath11k/20251206175829.2573256-1-mr.nuke.me@gmail.com/
[2] https://lore.kernel.org/ath11k/20251228151408.2116108-1-mr.nuke.me@gmail.com/
[3] https://lore.kernel.org/linux-remoteproc/20251219043425.888585-1-mr.nuke.me@gmail.com/
[4] https://github.com/quic/upstream-wifi-fw

Alexandru Gagniuc (2):
  dt: bindings: net: ath11k: add IPQ9574 compatible
  wifi: ath11k: support ipq9574

 .../bindings/net/wireless/qcom,ath11k.yaml    |  3 +
 drivers/net/wireless/ath/ath11k/ahb.c         |  4 +
 drivers/net/wireless/ath/ath11k/core.c        | 82 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h        |  1 +
 drivers/net/wireless/ath/ath11k/hw.c          | 51 ++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 6 files changed, 142 insertions(+)

-- 
2.45.1


