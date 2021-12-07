Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F82FC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhPASoMmpEqoKfXBKQS9p2F71ZpsJ7uMxUCYyudokzs=; b=XtM9ap+yT4NV2M
	zaDoiLVlgU8QZRFBbbFuTP210gzG2NZyuGEJIiunIbwbk1VTTLXmF5vIv/kL0wZ7UxenNX0EYSesQ
	9PtOU/e//LlvwBxI445kFJrXYQ/A3Yob2M97onVVuBLu8rYetQfGwhj3nuHUAwizkHJ9S2zWu4pJD
	585yaYiF1rI3XRdkv53QMai9wAhbIBHta0wOZeO6Aa6LUSMXBZmXNZHaZ/Nfpke/XtkGEcEKT6lvQ
	xsmKRi4qyj/I+sXGQp868Eg7NyECgWYHY/DjE7/W+7bvTuLoemVgiJLvwhVW8Zk5IbAjWA93IwiT+
	PBbJNU2XUZte6lfJ8Sgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucQH-009EMn-Ng; Tue, 07 Dec 2021 15:30:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucGp-009AiQ-Pd
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 15:20:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 954A0B80782;
 Tue,  7 Dec 2021 15:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F14C341C1;
 Tue,  7 Dec 2021 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638890440;
 bh=xThCXqS9vt3UdmlM3luV8ZihBgMS1KXQQ6vBmJY3ZEo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=KYOpsO0hIfbNqOXrZ2uG2yr7Cn6+rwmfhm3LBxzsfue0fCnn6RnpRSTYqjqZ6H9GK
 /nHtWAF6y3FyO2UfCD59sME/uHc4UsqhUTZ8X/UDUA6wWJPExJM+0wYjiezOoV+Mm1
 fClwHYs1BvjsA5AhOW3MkFFNj6qeH87pLfLCdp+c+AgDayO7LvqIcwEdxlJ9uoUAab
 qdcTTdykK6XgAVjhPKGYVwehggMmB6JJezDr7bGohOFUekrN2Q4rqbuqbfoUIYIZfd
 VV5eLJqpjhK0kJRuvYAnf3iO1pMn/o4Z3SIyI8DUMn5ZxUnNWFWG1keA1gxYtUNbtq
 0oTRfM5b1UWGg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: change to use dynamic memory for channel list of
 scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211129110939.15711-1-quic_wgong@quicinc.com>
References: <20211129110939.15711-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163889043476.23771.17333304212606374426.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 15:20:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_072044_045118_B46B4548 
X-CRM114-Status: UNSURE (   9.00  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently there are about 60 channels for 6 GHz, then the size of
> chan_list in struct scan_req_params which is 40 is not enough to
> fill all the channel list of 6 GHz.
> 
> Use dynamic memory to save the channel list of scan.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

cea7f78d85f3 ath11k: change to use dynamic memory for channel list of scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211129110939.15711-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
