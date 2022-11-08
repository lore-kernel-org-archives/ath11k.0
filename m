Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8BCC433FE
	for <ath11k@archiver.kernel.org>; Tue,  8 Nov 2022 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SntdDaf9e5WXMODi/B2fh8hlTySGRmP030SMImmnkkA=; b=5D8Xc78HNnbt8i
	SJGO5fIXXiJONpHOazsQdUEtxGriHLT4tYLPkXu+2+zdAn6ZWfdbpVNkheAPxqwBWz6OdTIGexbsi
	ksHOefXvYPz151JCD9Ftjkslg8FFuBYGvzujhPYuGZF7TcKBnwJZYIyA/1yHNTsRA/B/x7HD1QZDb
	GPB4CyrM5ENx3YdZgNGL7BGd5nNB3qUIC2zT1YVY6pZpCW0u0m2AWVmQPmZlGPek2T+ywR1lBvslc
	kUWmHJ3EhMuVCjaKIddkKx2BURcwFnAbTGEq+TASnLTXCI5s3cBnzcGu/tDDJK760DtQ9no+QK5x+
	FdnXEBbczsMjgNDBu1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSKw-0070sw-MG; Tue, 08 Nov 2022 17:24:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSKu-0070rW-Et
	for ath11k@lists.infradead.org; Tue, 08 Nov 2022 17:24:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 26471B81BE0;
	Tue,  8 Nov 2022 17:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA76C433D6;
	Tue,  8 Nov 2022 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667928269;
	bh=3I2an1duxohv2+c8cwYzYE3GreFTHQqmioncGIw5CXY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RRkeyAlngu16woa3Ip9iR6+Rnuf99/z8u53ayXiByCj8558mDTeR69SIJ7rai+twB
	 UkPZ+jUjWOYUWTPcfZHGSXl8Z7v2NJhklCepECtokGW9sVIfesk3UlhczcX6Kssuil
	 Ig6Eel2ECX87BEZbM9A10Ue4aTn3HW0RSShHgieh9iWDgM/J5mErc/NZhXo2ixEaYx
	 OwpbmTWovf20WbVvaJsYBLR/z6HLhdM1mm1mR7/JXxG8HRNtaquWMdKOMmUMWFMZpA
	 369950n87l2IubAjpv8HOs7ONDb4bXb/+CbRXXCr5e/QpoucfrFPvTkMyLP7gUBM9k
	 xAGTV3zZ4vaWw==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Robert Marko <robimarko@gmail.com>,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  gregkh@linuxfoundation.org,  elder@linaro.org,  hemantk@codeaurora.org,  quic_jhugo@quicinc.com,  quic_qianyu@quicinc.com,  bbhatt@codeaurora.org,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
References: <20221105194943.826847-1-robimarko@gmail.com>
	<20221105194943.826847-2-robimarko@gmail.com>
	<20221107174727.GA7535@thinkpad>
Date: Tue, 08 Nov 2022 19:24:22 +0200
In-Reply-To: <20221107174727.GA7535@thinkpad> (Manivannan Sadhasivam's message
	of "Mon, 7 Nov 2022 23:17:27 +0530")
Message-ID: <87cz9xcqbd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_092432_661115_C8F26172 
X-CRM114-Status: GOOD (  18.00  )
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

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Sat, Nov 05, 2022 at 08:49:43PM +0100, Robert Marko wrote:
>> Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
>> will cause a clash in the QRTR instance node ID and prevent the driver
>> from talking via QMI to the card and thus initializing it with:
>> [    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
>> [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
>> 
>
> There is still an outstanding issue where you cannot connect two WLAN modules
> with same node id.
>
>> So, in order to allow for this combination of cards, especially AHB + PCI
>> cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
>> QRTR instance ID offset by calculating a unique one based on PCI domain
>> and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
>> using the SBL state callback that is added as part of the series.
>> We also have to make sure that new QRTR offset is added on top of the
>> default QRTR instance ID-s that are currently used in the driver.
>> 
>
> Register BHI_ERRDBG2 is listed as Read only from Host as per the BHI spec.
> So I'm not sure if this solution is going to work on all ath11k supported
> chipsets.
>
> Kalle, can you confirm?

I can't look at this in detail right now, but hopefully in few days.
I'll get back to you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
