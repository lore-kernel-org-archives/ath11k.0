Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BFC54EE9
	for <ath11k@archiver.kernel.org>; Tue, 20 Sep 2022 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NN+5BkSQTEdgzObt9eUABZXfqBkPaoVi9qDQXfx9zL4=; b=KdZef/uLraDY8v
	oHzZVgVQNxfbumGrRKbLZdElNCQnpZOjU4FoPwkYi1vtKmOAiH7D7wW55SX05Kp425q5HS/BGgMXl
	XwGx6J60H7D6o/ZZ1ZQPSTJ54rn/AvQboB3pI+lpEnjz+070FtdNUy5lWiM9E4XnfmonQYjKQwrfB
	jouoCZDqz/kAo6By/BcSKVJ9FOECUI+KUZ3R6QuZwWvA/esGDmHRQ8E2maJn1g+LqLjviMsB8Yyb1
	aM2fn9w5Hlra6h5xW5KpVXElifif0emG2lP4c2Wd5bkMr+4KpqtRuOLJRfTWQxR+K321I3191b8hm
	YBhvCjjxjP4vSj5qeEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafNm-004wlK-1P; Tue, 20 Sep 2022 15:41:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafNj-004wji-4y
	for ath11k@lists.infradead.org; Tue, 20 Sep 2022 15:41:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13333624FD;
	Tue, 20 Sep 2022 15:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8556AC433D6;
	Tue, 20 Sep 2022 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663688513;
	bh=xwaNLR3zy/gM+Md7cONa8Nz3ctOtzfq3h9C4O32E7Zw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=d8xJ0LkfKQ5bIsvzen9/PCAaYl0rd2p2r/TmDk6kPtcA8WtQyxpD2Q90E+KhYB75B
	 2jS96JU72nP+M0FUSBm/nTco9+fchntnK+RvIwAFF7WiCqUSphvDny5hahe3vo+eyz
	 0USzUlRRQ8o7WlJ7JN41D2GG+M1XXGu+Hxh8/ximvguUC9zUCAF3aE3tzPfKXkksan
	 5urpxFSIeIceLUJvIigDG243cHjiE0ujYY9+mLuFbdAfAPCJnq7wnqw8Tiqlmh6ICv
	 4CSUZpDy93lafJ1t1LNyqHQ98eVLrSl4O0d77IZp5obB+rsE6UiWrbeItMjG3VuLZJ
	 8Lc/jlMr87d+g==
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Add spectral scan support for 160 MHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220725055001.15194-1-quic_tamizhr@quicinc.com>
References: <20220725055001.15194-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166368850044.9716.11466525208875594011.kvalo@kernel.org>
Date: Tue, 20 Sep 2022 15:41:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_084155_359357_059661CD 
X-CRM114-Status: GOOD (  12.74  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> There are two types of 160 MHz spectral scan support mentioned below
> 
> 1. Fragmented approach
> 2. Single event approach
> 
> In this fragmented approach, single 160 MHz will be split as two
> 80 MHz buffer. First fft sample buffer will contain spectral scan
> result of primary 80 MHz and the second fft sample buffer will contain
> secondary 80 MHz and here cfreq1 and cfreq2 will be mentioned.
> In case of 160 MHz on 36th channel will contain cfreq1 as 5210 and
> cfreq2 as 5290. Chipsets which support this approach are IPQ8074/IPQ6018.
> 
> Replacing freq1 with freq2 in every secondary sepctral scan event to
> distinguish between two different 80 MHz spectral event data.
> 
> In the 2nd approach each fft sample buffer will contain spectral scan
> result for whole 160 MHz by mentioning cfreq1 as 5250 which is center
> frequency of whole 160 MHz. Chipset which support this approach is QCN9074.
> 
> Host will receive spectral event from target for every 5 fft samples.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01120-QCAHKSWPL-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01120-QCAHKSWP
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This added a new sparse warning:

drivers/net/wireless/ath/ath11k/spectral.c:682:43: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath11k/spectral.c:682:43:    expected restricted __be16 [usertype] freq1
drivers/net/wireless/ath/ath11k/spectral.c:682:43:    got unsigned short [assigned] [usertype] freq

I fixed that in the pending branch. Please remember to use ath11k-check to check your patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220725055001.15194-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
