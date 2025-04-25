Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BCC369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 07:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Te3ksqRJ+7OlpUSNfGlJHaCjELIs2UO0MQxGmKigXE=; b=s+T/Lgil8dQTxJbxelA6RM02OJ
	etjEeBoC7lXg/M+OF0P00FJ8qHILZl9+e9oXkqklq7C2TeB6QoyQ2cRweotNxcE9CITht9xLR8x9L
	DPvnm5u+x3dWR7X356uO1BLr6s2ia1DojOITQu03xAbkUbSw1Hlh/aVxsnAfU36HUlxT62z5/5Opq
	LL6p6TzixuQ49dorUtG5E9Su7zId0bRH6h6L57Fnicv+Mzs17XImioew6BsVHjrRqmcFg+VOfWS3w
	w9XM2g4PbZS3qFnxSFzugK2/VHlXj+vZLHtpuzhWvhM/gAOrN1eH0JAAiZ8MaVnI098Pp6MdSi1Wm
	L0dFsIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8D6i-0000000G8Dm-3269;
	Fri, 25 Apr 2025 07:04:20 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8D6f-0000000G8DE-3nhK
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 07:04:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301302a328bso2632863a91.2
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564657; x=1746169457; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Te3ksqRJ+7OlpUSNfGlJHaCjELIs2UO0MQxGmKigXE=;
        b=iQ+hFJgMKHJN4Ss5CYzSidtpvEwMTrhj0D9ed8av62BWweyKw6mK3jIha1q8UNdiiw
         GFnT7fK0Y+vj3Fs+7gAlVJ2AiyuMjtbKY9FnmB55miCZb1xwv2O4H2TKHaESTxFp9m4l
         65qr8PLtgNDBFLAO82uwl0CyQ47GMBEV4q/IpH99P6ZkunSjsFI4pXuIdeUsknpnZIDq
         ONfk3Aatgqo3SBBVp7kOhITeP7Ts/j+eHLMaHRzwohm43fVvCDrxXVwajnOxaBjc2JOj
         5JPITbhb4paS6OMMmCQS9hizJH8gGv0eDNOAl1t6somfoh96Ggta0nEbUqM8ZiZHHaMZ
         kZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564657; x=1746169457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Te3ksqRJ+7OlpUSNfGlJHaCjELIs2UO0MQxGmKigXE=;
        b=rJs/6tuCBTEM8zRD6ustMvaUI/rhsbikZCYJxuzhaqfV/wt+AhAx/f0DTmxJb6Dq3z
         4WNFhjSymj+HW6GioOyINnIw9+qRlumDFHHb0yPWg2qaIht5lLtZV8kUk9Plx14PIvJQ
         uUat299SMJajS2f9LXAsubSOqsMfAnXVJuHV7+vE5RpERSvFUmSmoLR6zNS9dFbaReM3
         qKSs2quvCVRnqsXa6CnC3ZZzJVkgWiYRvBW8nIZ5exmhPSP8tvSpUftexIkA/pDT7zUM
         8H8n/sj4b+J83ajsrWkh5WO/0U1mGwFjCNCr9NUgfTY28VH4GmV8C9C7e3oMrDFMMe+i
         OoAw==
X-Forwarded-Encrypted: i=1; AJvYcCVK4jVDvrsia38YuaozGO29OU3SEeVMCySZfEilbKOYLZjuOgrGiN07hFqWmsWU3R/K8P7/EE8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkP73qKebQR51EJk6DLAvFuXFEKVsnFXmhjPUXR7rScBv9l0Il
	O6osecn34HzDRkbY/5BTM0XciGZOBkYJFTquAdorxz3YXzuZxPd5wZ5W5j4eJQ==
X-Gm-Gg: ASbGnct3zf/ajm5gl4x3WjhMgOalShXsnpgyMWKb+6ZwYGp2Nm1yecYk0/5KVDZOeq3
	WXtbFDib1mXkyDTBStroO+52MSQMJoP/t98KhgCsI+IELscct61PGsY63sctZ/e63gFLnJUpAt5
	2h7U68vobg1ji/j42E/tdwfpIlShNAy63RtqfQW302fiPH7yjP9eNtFoQ8DU5akT17ynXvANnBS
	QD89c2G1hGJ/vHDc02I8bF6cz6pcCNpXLMhjbrF5Ycmw3R/KIJvzDE4tyBRXjkrjEJ8TM8xDE4I
	Df72cHK8rNK/36CHRE1TBcFkE61kgzhDQ74nRQP7Bw4hu4AA8oI=
X-Google-Smtp-Source: AGHT+IFprbi4xKoK9kQYGafLrF0iV6P6sf27aP6lhIQIfke7L6VaLDQhys8cFeKJ/FRwTwPktrq5xA==
X-Received: by 2002:a17:90b:2f4c:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-309f7d99200mr2192871a91.5.1745564656964;
        Fri, 25 Apr 2025 00:04:16 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm25163355ad.190.2025.04.25.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:04:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:34:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410145704.207969-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_000417_954116_6526F900 
X-CRM114-Status: GOOD (  15.06  )
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

On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation. There is a crash report where at resume time, the memory
> from the dma doesn't get allocated and MHI fails to re-initialize.
> There may be fragmentation of some kind which fails the allocation
> call.
> 

If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
workaround that in the device drivers. What is the guarantee that other drivers
will also continue to work? Will you go ahead and patch all of them which
release memory during suspend?

Please investigate why the allocation fails. Even this is not a device issue, so
we cannot add quirks :/

> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Here are the crash logs:
> 
> [ 3029.338587] mhi mhi0: Requested to power ON
> [ 3029.338621] mhi mhi0: Power on setup success
> [ 3029.668654] kworker/u33:8: page allocation failure: order:7, mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted 6.11.11-valve10-1-neptune-611-gb69e902b4338 #1ed779c892334112fb968aaa3facf9686b5ff0bd7
> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024

Did you intend to leak this information? If not, please remove it from
stacktrace.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

