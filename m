Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B605C64ED6
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoQVpz23ueHBRLXKzlpfzhAbiuYFKDutje4iyGbOEH0=; b=EX3qPstWn25m4c
	7E4SvZo2G0qRuW+o2wmoTqhaW3VioWZsj8m0dVBdZfczrbr5x6JQFhejZaQJwadI43pnidwqiNYZ7
	wrmsnw3M7ok0Hgrbg9wvz64fmiymO15NuWpBKciqvZvuDRmmOzjbbsbYvShpKtcGzcfZ/ZXbRq7oY
	oyDey3khJwv70j9rWVO23sk0ryWNuIMV3e4W/kYSgQ/2AWg5NUJTgHtRJMa7erf6BTY+V/EaalPtF
	rBhYADmhAcDcmHYJrDFkkRHj+AVW5R5DXALneWH6bTP8Os8ymW/+oDpLTB+0x8R1T5S+86Pvpc0Ht
	swMdoOGU6cYKcma+6oiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcBq-009Vd0-Sd; Mon, 27 Feb 2023 12:01:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWc9t-009Uw1-Pq
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 11:59:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E84CB80D1D;
	Mon, 27 Feb 2023 11:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCC1C433D2;
	Mon, 27 Feb 2023 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677499145;
	bh=J1blplwPa0aZoNLKPB/GZBMFK3yDQyV1wzJAbyyKUGE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cApfinZDsVDBAJakIKHuMjjVGGZ8fEeMzdQ8A7dzPCgn3YcyJpIN4OZOhqnwZrHFm
	 t1OnoB9W4h/+O81ScOWocmGkOHIUCp02mv4KiYx9XgUN/5h+le11ptAaYdSEjQ8ICY
	 F1MAugrtUmbXRd8F1jbszNDgN72UAuGpG0OecXQPMFTgMyjvZuaGERaNEE71QF1vP3
	 aU68PzfNswzj6WTsVLnwBWbHx2tNB4cFzLi1FyU5P2g6g113PphIQCLASMYa61urcE
	 +EapjoGuSY3KN2pDh7MCgRY1YCKgH2q9w3GAjqo00Rcf096x6KGAz/5O0Q9zCUN9dl
	 DJqQkxVgOQcow==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] ath11k: Enable low power mode when WLAN is not active
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
	<20230203060128.19625-4-quic_mpubbise@quicinc.com>
	<87cz5zruc6.fsf@kernel.org>
	<9efc2082-d46d-5d57-d275-1cb47277f639@quicinc.com>
Date: Mon, 27 Feb 2023 13:59:02 +0200
In-Reply-To: <9efc2082-d46d-5d57-d275-1cb47277f639@quicinc.com> (Manikanta
	Pubbisetty's message of "Mon, 27 Feb 2023 16:19:08 +0530")
Message-ID: <87v8jnqpyx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_035910_120163_8C18A407 
X-CRM114-Status: GOOD (  14.49  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

>> Also I want to mention that I suspect eventually we have to always power
>> off the firmware during suspend to get hibernation working:
>
> This patch will power off the firmware for WCN6750. I'm not sure how
> to get that working for other ath11k devices.

Oh, I didn't release that. If you can, try to clarify the commit log on
this part. For example, "for suspend we run command FOO_OFF which means
that the power from the firmware is complete turned off". Or maybe just
read them too hastily, but still having clear (and simple) commit logs
help understanding the issue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
