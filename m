Return-Path: <SRS0=EzgD=JL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CEFC433ED
	for <ath11k@archiver.kernel.org>; Wed, 14 Apr 2021 21:27:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498966100B
	for <ath11k@archiver.kernel.org>; Wed, 14 Apr 2021 21:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498966100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=syfu+eHbkwWFw53HlbjC/EXQIzhJWjeLjZWB+Bqj258=; b=aML3OM6w78mLd0
	MZvIYjWiHbB+OSwNJB66vgaFsP/R+OfQBRgt4WDwPvmzRzu1E2ao5DSv+aRAL1toyalbf0EMTOWb5
	kcrgRUiFkEf2IxvQlSzMCbqhi8EFP3RNw6qjnUjZzYvF+ZMV3kQuyEIZo9mm2pyW4ANw+zbBJAFlC
	2IfmT9Z7StXyxxfH6l81YVMPzKt0Z3jsYPIjZWYVc6sgmmxRQJiNeQBvMkU3tzl2LVvUnIYLEjU0R
	aW859XwIUizoTa66yJRuUCAYQSBNqwDXYaDhyAmddGyp2ebvNdYBNIPEC/Gg4FSvMFtzlUouwTMZt
	L/RfTav9lfCo0iQsKatw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWn2s-00DroZ-SM; Wed, 14 Apr 2021 21:27:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWn0l-00Dr7G-IW
 for ath11k@desiato.infradead.org; Wed, 14 Apr 2021 21:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Hsf1WdQMYa1M0eYcCnR3IgWp/QuG7Ht12HYRBsW6SxQ=; b=3SdSj+MowZIv341QcJmkLWg+96
 moCNx6PAeGXQ/3F0JdCg4Ny2l79qDB0IrNXe+ywVybhdhHisxK/iHUSTeCWopGIOG25il3r0jCRaz
 9Sg2rHAPhRI94jcjK681pNOiXv2vufDjACzm3tecFxGoyc6ZxD6BDvjqIY9uNnBtz6HZpOmPKZkg8
 zTjtNVCTuei54YxtSjDhPhUBae5orwqSjrBiVI6xHLfcr1tA5z5OVQSUHI7tkaDvMr4V+PwNNBvmj
 7HPJX9aEnge2nwbsZ6GvCiSyotCCXxdwgULl0kHn+TQjAoXozrRDT7b7yp9ToeksOxCEX0XewqmS5
 mZVr8awg==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWn0i-0087ES-U6
 for ath11k@lists.infradead.org; Wed, 14 Apr 2021 21:25:22 +0000
Received: by mail-io1-xd31.google.com with SMTP id a9so11247561ioc.8
 for <ath11k@lists.infradead.org>; Wed, 14 Apr 2021 14:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Hsf1WdQMYa1M0eYcCnR3IgWp/QuG7Ht12HYRBsW6SxQ=;
 b=qqXG8I8f08l0Hx6pfM86wgVFGvc6og7MiAcPTAZMTdp91JzjnIKaIfLZ3x5qdkmAal
 JnE8Zx7tnx1kf3vlb2wvAL8TVXYXINZeRWyojllOfpp3Myc7EYfKldNLKKeMpy/Uh4qx
 NzM0Y4RQKLIX6v0OX170tYmE02dRpei+vS1WOF3X9wGpG6VPxGX1AFdBzgU/npdQ1xme
 hW+yVbBkP2W/4vbCVishN3raOjeyKj/PNGBpLKmWVoWBMbAQJgVrZnQgbg7ab1QbS2p+
 dbKUSiYr0IegNnitDPEjFQT+qcjUqIFNA8MGoKoEWmqkxfG6CrRffqKcaMiBBE+Qp+eA
 S1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Hsf1WdQMYa1M0eYcCnR3IgWp/QuG7Ht12HYRBsW6SxQ=;
 b=cGh08e5m368uxlc7TKynmhQ3DslLcIvUzHTrygtpFD7SqPnEeBTtcy0xL5yB+Vj6eJ
 7ZNCQ3E2tszcBG1WthorHW9U7eUpxuv4ttlMEgJeSb560VggPzJzCZhuoQCSIFYvwamz
 AFTA+Sys/uwbLVSSPWJhWGrqpLrVrvl1UMUS9b1hVjvb/VbO48QQdu2sG9viLcKz8mpp
 wLfbwBllFv1CkcZroyt1YeSLa7AikDvuHmS58eQyRQuJRJWGphiCBRPNFTWlvfu7rxbO
 p0oLEocQykL7HXUE4phr3DIz4BytkTnC2mjx4hUW6NirIfNmaT1OVJ0Vf3g6Jflj5Od4
 nBdA==
X-Gm-Message-State: AOAM530fXlCbmoABMMyg+p8OXClIt/ZdX+JDRVd1niZOgFWqmD0fcAiO
 LzQkRLo/DGKRlBponqr8LMi2O8GUcwVYXNHfD+2n8gv4Job3jQ==
X-Google-Smtp-Source: ABdhPJyA39p0Oy1SaeXRO4Cc7/Dr3UVni5AYvWc/BCmC+hgMc142fIxoSK9mmmyHyoMPm0fOphi4fyyGCzVWoJpA044=
X-Received: by 2002:a05:6602:2f0c:: with SMTP id
 q12mr86930iow.82.1618435517668; 
 Wed, 14 Apr 2021 14:25:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Andr=C3=A9_Eberle?= <andre.eberle@gmail.com>
Date: Wed, 14 Apr 2021 18:24:37 -0300
Message-ID: <CA+D0iCJrHGFREPEgpfiPEHv_WCfV7JL=kaxUpE1p7cabZTOJjw@mail.gmail.com>
Subject: ath11k-qca crashing
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_142520_986520_3B370E5A 
X-CRM114-Status: UNSURE (   7.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,

I have been using the ath11k wireless driver (qca version ie. QSDK) in
a IPQ807x router, but I am facing crashes. Ethernet and WAN work fine.
I can connect to WiFi, and receive an address from DHCP. I can even
send/receive a number of packets via the wifi nic, but if I try to,
say, send/recv a larger number of packets at once (like visiting a
webpage), the kernel crashes. I have been digging into the NSS and
ath11k drivers trying to isolate the problem, but so far my debugging
attempts have failed. I have so far failed to set up kgdb on qsdk
also, so no help on that front.

What is the best way to debug the ath11k drivers for such problems? Or
at least try to determine if the crashes are from the driver, or
elsewhere in the NSS system?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
