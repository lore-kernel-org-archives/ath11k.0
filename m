Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4894C433FE
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/RX+7yLwCZX2u1CNcuqjcy7KjHECE6we0ech+TxtWM=; b=kRq4Q3jP3bDMdS
	fjMjLP9LWdotxS+gB7gtLmh2IjobEH6Jbr2Y4bq53LQ3FyMQ/qAOPyfDoYp0LDYb91k9vPBreCCVW
	vs+wCRpEXjfOQc2D+gVZbMS7kaOp4quZ/ebq3LpMacnDoL9ilpUzjzCQR1e+iKTSRrWs1R1fSI53W
	GjyhzkYwfYQeK5bxuRd8QT8H88zng6DqyGcpOdw/lfHJjWQ0V1y6Jb2ii9zaxgqzlucOHgGyAh3Ax
	aFuSkR40KMcH4MvK1w08I6yKaLfGZuxiIpR8Sx7soUh+inOdEcup43KqOOoJER5OgJmyhibUDSmEG
	WZY10nWyeaoLwVffbXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZKa-00GFKI-LV; Wed, 30 Mar 2022 14:29:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZKX-00GFIG-EZ
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 14:29:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16AE4B81C27;
 Wed, 30 Mar 2022 14:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052CDC340EE;
 Wed, 30 Mar 2022 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648650586;
 bh=l+ibYosFAZMVnF/SNWZtQCCoiX38isg7aiPzFW5YdgU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=tFF6bL9/3ybNM6Rb9WurtOr7kQdFRH4lCO0oE+blSGwakj8hBfi4gmsG1ntN7CsFq
 5G0n0Nhq4KFHGLLR63gT91Z+SdbWUdkqf+gURyATKgklDmfM0SALnT0kQdBl+6Fbzh
 4Vxu+PhxBZmW6NMb7+SGb8Vv6cVVlPNRcb8RSrzacTDbxxPYwchazQ8qOnlah1roiy
 7lMXt/JzDBWyPmnHqubr4zNEmEbUln7cG/dYlXxNXIG7MzoLpzpdjaOr9yamZz+iFs
 J/5k4lUEcWi9r+GJhOsizk53Upw/gjYL/y+xIDbVRgZYSZFEAH8/9ELLmOCVhfo3e5
 6tJrLPBi2BYKg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath11k@lists.infradead.org,  Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: ath11k-firmware: QCA6390 hw2.0: add RB5-specific BDF
References: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org>
 <CAA8EJppG0FXj_n-CdGbX6b+sGrTb0_FG_tCZ0GeSEsCcz0mR3A@mail.gmail.com>
Date: Wed, 30 Mar 2022 17:29:41 +0300
In-Reply-To: <CAA8EJppG0FXj_n-CdGbX6b+sGrTb0_FG_tCZ0GeSEsCcz0mR3A@mail.gmail.com>
 (Dmitry Baryshkov's message of "Wed, 30 Mar 2022 15:57:53 +0300")
Message-ID: <875ynvwm22.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_072949_661622_0759C08A 
X-CRM114-Status: GOOD (  14.98  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi,
>
> On Fri, 18 Feb 2022 at 08:15, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> We'd like to ask for inclusion for the board file for Qualcomm Robotics
>> RB5 Development Kit.
>>
>> Following the questions from the ath10k wiki page:
>
> A gracious question. I have followed the procedure described in the
> ath10k wiki, receiving no response in the past month.

The board file updates are slow, it can take a long time before I manage
too process them.

> Is something wrong with the request?

After a quick look I didn't see anything wrong.

> We'd also like to submit several other board files:
>  - for the RB3 board (WCN3990, hw 1.0)
>  - for the Dragonboard 820c (QCA6174, hw 3.0)
>
> Do they stand a chance to be accepted?

Please do submit them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
