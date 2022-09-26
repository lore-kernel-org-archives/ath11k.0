Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00633C32771
	for <ath11k@archiver.kernel.org>; Mon, 26 Sep 2022 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8ptqn4YqiGyu3brLGyMj+M/b6BP7WpzSopUd2O6QF4=; b=GmCIcuR+OHu3Cy
	gPLszFeQws+KlYIaVMnqmkDDnKr7b2gIcRln5LVyeRo/EYUI3t8Fj1nFKOEfZYN54IxiZq5w+13ui
	/Hlf+0nICbj671/fVgE1Yk8OuOYQLXhczvGL/Ix/ZENsxNRllMSErdV4g7ImvcgtqUfWcNxB8ihFu
	RZanhR9+15n6saxy+UcaCiRnfo9xelhAAZ1nnoBThwAo3Atn/4kqwLBgiJC0ssftDpP8W2rErl0aA
	S0Pd029SFDs9dPPsnmmf7k/uMZKy7Y1PEW/3BZCFMhhVeZkG9h5kfk8d+kcf/hFHNqnFJwP6uCp4z
	L+dq2acY+h4f1Eft4ypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockmm-003oGc-2I; Mon, 26 Sep 2022 09:52:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockbA-003ibD-8F
	for ath11k@lists.infradead.org; Mon, 26 Sep 2022 09:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7580D609E9;
	Mon, 26 Sep 2022 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED64AC433D7;
	Mon, 26 Sep 2022 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664185222;
	bh=YuJrJQvn7eAFlcWAnDADbd79XWhQ9EoxPA3mdG1pQSQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Xtr0H0ALERc1vQZE8oLjvT6RdvFNkzwIJcRt7SAHhCEkOAdUuQ8HRjaCSjNxyDaeR
	 AQu6g4AnMe2OOAVxHcXfRJFmAIQO9Ms9V2VREdy/2A1kUvN9EGQMcSKivpV1ffh9vQ
	 ASOAVlEYvOkGOTw21R5V9KuMhG/DY9WAKDP0P2vPeA95mhqb31Kyhbc4t4grnmXs1i
	 7mF7T44UeCbqBLYcmX0nD7Gqoypc6wT1Z0IfbirPY9aqRm3SjlXW2Se3CKaOkN/JXa
	 n+G5HvH4V/zjegFiVY21phYy46XrMf59HsRntaV7uQB8mRthTvZtDFQN+zoJQs3rZY
	 qyXPodXQ2vR0g==
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Add spectral scan support for 160 MHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220725055001.15194-1-quic_tamizhr@quicinc.com>
References: <20220725055001.15194-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166418521856.13691.10782071280432195867.kvalo@kernel.org>
Date: Mon, 26 Sep 2022 09:40:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_024024_392049_B69B8F5C 
X-CRM114-Status: GOOD (  10.75  )
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

Patch applied to ath-next branch of ath.git, thanks.

c92f774a95c6 wifi: ath11k: Add spectral scan support for 160 MHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220725055001.15194-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
