Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA01C43334
	for <ath11k@archiver.kernel.org>; Mon,  6 Jun 2022 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqIvwDw45F3O9vx8+QLKxt8zDzVuZONM+koWnrEoaKs=; b=t7bskzKUbWMW87
	8WI5VQVDavlZqz1+7hVKaR0Hh9gNGzp2+xpx1XlAxhMWnpBLqY/l70ETRr1XeoCv/gezKKDAdj0Vp
	RlucnApBQS5AB1Q6jhlJIory0FY2GbLV6Yej5qMB8HF9ih4lxi2cYMKs6bJvbjitG4boBRG85p/Ay
	dLlqi2S0Yu2OlLWglA6vUu7uWUbWg2i7nfkrFORzHZHvpO+kqN3i6ww37XXnqmdgQZZFzJEJbwfXo
	fTb9g4OEfXXecHFJPjl8Qxg3Tjj6pICkT5okA+yC2sOTnbIkCSe6TN3rCs+aL+4d9YXrR/kwWXMU/
	hxtzhBmfAWaTwDK0WRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDOL-001RqT-QK; Mon, 06 Jun 2022 14:07:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDOJ-001Rpa-2i
	for ath11k@lists.infradead.org; Mon, 06 Jun 2022 14:07:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AC3F9CE1B8E;
	Mon,  6 Jun 2022 14:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE6C385A9;
	Mon,  6 Jun 2022 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524445;
	bh=tMeKQ0wXvAI3qCeplV2raWzXVOm0eYF7/LHEWAjhbTE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KiGOJWIB5gd1nYJXdSjfXvd/H5zZ10lGtxHEFp0YW1AnkDaYp8UKLQUuW94KsYstw
	 O7KxAkBH6CXj01EoPMdH7qsl76DoUWflR5xjECWj4cX4vKBzVXfadqfzutvMJH41Cm
	 RDBiy6KWrIjCl+zQCbBl/bd64F9202YLphEm+mky0BlREC9jt81+gV1+8GMKxh+O2q
	 iMH78f1GTKtwa70BuAhDcqA4+vdvcUhVWJkg4DtB6LK+GHBfTU3CzBs/qLOp65NQ4M
	 LD4KNc2sxG7bC5eIuQ2YYPC7c2FcOOAtVPYxR1+/oG0OTS3dSSjTXsM7xKLKl1lGMe
	 JTvJV6oKm/zbw==
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: fix missing skb drop on htc_tx_completion
 error
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220528142516.20819-2-ansuelsmth@gmail.com>
References: <20220528142516.20819-2-ansuelsmth@gmail.com>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165452443982.15301.6395234457917940547.kvalo@kernel.org>
Date: Mon,  6 Jun 2022 14:07:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_070735_338775_0D9E780E 
X-CRM114-Status: UNSURE (   8.33  )
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

Christian 'Ansuel' Marangi <ansuelsmth@gmail.com> wrote:

> On htc_tx_completion error the skb is not dropped. This is wrong since
> the completion_handler logic expect the skb to be consumed anyway even
> when an error is triggered. Not freeing the skb on error is a memory
> leak since the skb won't be freed anywere else. Correctly free the
> packet on eid >= ATH11K_HTC_EP_COUNT before returning.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e5646fe3b7ef ath11k: fix missing skb drop on htc_tx_completion error

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220528142516.20819-2-ansuelsmth@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
