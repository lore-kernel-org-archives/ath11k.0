Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9ACC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtzK+IZrzmj5mkmn0SKv+ZI8o/50t8sS5TcmLa4X5hU=; b=lZ4oDz26njgo0q
	mLYkPwrMzOvmLcUqh/1SkkXjOn4SpH4WcswnEYk3qLyQRPtQdIe3saHl5TyvHrndsbDx2VAZGTZAs
	KtL3DFG3T9MgKkhnpIV+u0GewGbA4mqj5AJma2c1IMWe2i9rBIUx1BXZhMTNH8ZGtpA+Rx2S0mf/t
	zER8uaIX8Fj2Dx0nvkhDvE68YmJwVSEPRsEBEGFarD6fKv7K/hcgVXvARdACw5fEK1b2lFl/shEvS
	0XH4cj4ddKN5ClS2Vki3GP/iR5TnWDvpM0f0fKUx8sYNC8BYtNbUJAZHB/8pYwuO37+zpaYf0H+8Y
	g3XVPOufCxDjY9tMp3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvL1J-00GTNg-5i; Thu, 09 Dec 2021 15:07:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvL1G-00GTMw-Dp
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 15:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 229CDB82489;
 Thu,  9 Dec 2021 15:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08874C004DD;
 Thu,  9 Dec 2021 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639062455;
 bh=yUyk/DQFlEUejBdWzLfLiyyUs9+ywlMtyny1127mUxs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=UQRgzOXBF7XOEwQd9gwPReORcf00ZiKAIKMhtdGZlc5AueAPgy9mIdczGPiGTMV4d
 Em4jHdLJs/e9ksXqKb4/REuORjG/wOVXR1B/4QylU2PenuKQIImD5ZeMhq9LERTHqI
 1+S+Kvb8MX5fSWirvqt4FG7ben0L+fIfF8KdWRGpmm9Ci50/B+QQ0z5nTMC/AtYXAj
 GPi7FoDB1snfNaDcHk4RN3U56tsk5Q7WD6DS3tLXPmBbCPktkW7MMm2IDtHhc1Azsy
 3fYUDvl+RPBqbd/SLkTc7hJTR3gD5prL4xsFjyhkuI6eCMg+0NJvfnr3TyjgxyYrZK
 k4ThmmfHKc76w==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/6] ath11k: implement hw data filter
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-4-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 17:07:31 +0200
In-Reply-To: <20211011193750.4891-4-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:47 -0400")
Message-ID: <87zgp9zuj0.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_070738_632448_FAC9C138 
X-CRM114-Status: UNSURE (   8.38  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Host needs to set hw data filter before entering WoW to
> let firmware drop needless bc/mc frames to avoid frequent wakeup.
> Host clears hw data filter when leaving WoW.

Please try to use full words to keep the commit log readable:

ath11k: implement hardware data filter

Host needs to set hardware data filter before entering WoW to let
firmware drop needless broadcast/multicast frames to avoid frequent
wakeup. Host clears the hardware data filter when leaving WoW.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
