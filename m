Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1FDC67861
	for <ath11k@archiver.kernel.org>; Fri,  5 Apr 2024 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p3/nt0HPMXG8aoNmtG875gZ5EQW+1CWKXZLRdkC3kPU=; b=AJTqFwo/bpil0ftkAu8hVUOHlj
	/rPhXcIDcwr0e0O/2chDvPlT10L5QQ1qx/tRSIyHVfFWp/0YOkt8qDTa8jMi+PXh71buk+ME9XAwf
	xm8MYI4TA+WxuLzRyX7LKd4QorPBsbbl9WMkLDeu0c6RUkxuxod6ZEm1tbJiCzeqmJrxkii9lUzLE
	NobF1VP5AiwOBlTljsluDLi+OoNp2wwAq8BLM7fPMoH3DOVyjjgDBP32ogF5I9lK1Jo4hgNElgxwG
	NO1WMPjjieTEIKQFjdX4XyhBRw33heDB4OHuGYzQ4fKz5cHGgvWQcDDSUechsOILj2qqYyh4j34y5
	B3Oc+/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsib0-00000006uVk-39vx;
	Fri, 05 Apr 2024 12:23:02 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiax-00000006uTS-3zDR;
	Fri, 05 Apr 2024 12:23:01 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a519e04b142so121461866b.3;
        Fri, 05 Apr 2024 05:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319775; x=1712924575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3/nt0HPMXG8aoNmtG875gZ5EQW+1CWKXZLRdkC3kPU=;
        b=BdO6L6M/Hy5l88Hgt3EG3SnQV77abze+4TmIUbJdf8bhMuCYHpF6TGbBjx3gfkC4ow
         UM+twDqWkpOTGs83kQfsOUMa6YhLTmFHjhDMxe41LvhejDM9Bh0aj1AeFdDVReGBz4Z5
         cl7ZxGFW1ktkC9EOiRXB9DTAYuq8ZQIEmKe72EWcb/7fOku40V+1PE2zdL2oqqO8E2Sz
         phJdRmF3bz5calA4V+c2a9eOnTJ7T0ArCG1jofcwWu4MdeA33UfJa0vcBGz6sZg+mwmO
         7Wmn0s1QZbELdDiO4cEGFsvhMl4Iqo0kCWp5zxmP0cpgZ1Ke3uKH3n4ivbkBYCf5cKvx
         lWYw==
X-Forwarded-Encrypted: i=1; AJvYcCWGzaCAveuXjNd2eAZ3v4GUtqSxqTI8zXeXfQnGMAuPX513SuOalvUmrcMFIi1o5iLMCp7zhfxIwPNN4o/YQMFYI+z9xxWg5dcSLuVdgF6JdK5Uw8geT3O6xcA4XqBHxsJa7G78NwU=
X-Gm-Message-State: AOJu0Yy/3JusI3UDqHOcJ8TsEhLkny/f0Jc45wcdRXgDSdm9c0qX3QQ8
	q1x2sJkBZ0axp3da7mdjrH+/nVsifli9eY8VK5aQq9ZCGSxY5MaqZj76MnVE
X-Google-Smtp-Source: AGHT+IGzns9AtViEj1GDmp1+cwDZ17HecKDitxqIN0xXVXQF2dM+Tu6JfhMb2iexyCWmd+mYOw+N+w==
X-Received: by 2002:a17:906:cf90:b0:a51:97df:16fb with SMTP id um16-20020a170906cf9000b00a5197df16fbmr1013435ejb.41.1712319775282;
        Fri, 05 Apr 2024 05:22:55 -0700 (PDT)
Received: from localhost (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id jt2-20020a170906dfc200b00a4e1aa345f6sm770369ejc.115.2024.04.05.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:22:54 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	ath11k@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	imitsyanko@quantenna.com,
	geomatsi@gmail.com,
	kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
Date: Fri,  5 Apr 2024 05:21:15 -0700
Message-ID: <20240405122123.4156104-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_052300_095484_90CF5F6B 
X-CRM114-Status: GOOD (  10.43  )
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

struct net_device shouldn't be embedded into any structure, instead,
the owner should use the private space to embed their state into
net_device.

This patch set fixes the problem above for ath10k and ath11k. This also
fixes the conversion of qtnfmac driver to the new helper.

This patch set depends on a series that is still under review:
https://lore.kernel.org/all/20240404114854.2498663-1-leitao@debian.org/#t

If it helps, I've pushed the tree to
https://github.com/leitao/linux/tree/wireless-dummy

PS: Due to lack of hardware, unfortunately all these patches are
compiled tested only.

Breno Leitao (3):
  wifi: qtnfmac: Use netdev dummy allocator helper
  wifi: ath10k: allocate dummy net_device dynamically
  wifi: ath11k: allocate dummy net_device dynamically

 drivers/net/wireless/ath/ath10k/core.c        |  9 ++++++--
 drivers/net/wireless/ath/ath10k/core.h        |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c         |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c        |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c        |  4 ++--
 drivers/net/wireless/ath/ath10k/usb.c         |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.c         |  9 ++++++--
 drivers/net/wireless/ath/ath11k/core.h        |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c        | 21 +++++++++++++++----
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  3 +--
 10 files changed, 39 insertions(+), 17 deletions(-)

-- 
2.43.0


