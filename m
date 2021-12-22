Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AB3C433F5
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfQjSAGFerdTX5QGNA/zEACwMsMXcTPExcxCZHNLkAU=; b=3FUegsN9UMuQ5G
	d/8Fja+Y3F+XE+GL6GF/vn528vMGBqO4YCzRMa3LP+HOGLfUpAslRGTOUDVFxZqhkQBpyXH6OYPfA
	dCUO/jU+o4o/z1WQPASzFYH09d044MRGfnPgLIH1FD+9vE3nYYuyv69aYNRgkrgOc6QAk0D4Db9RX
	m+G9Ch64SgQWhtSWtoDfjziP1XEw+WWZlFbfFhoZEJguvpXesxQFe1CW4VxRnZmA/UhFlVhldYl4W
	H6zLeX4a+jT+jFScOI+QDMwsPzXE3d/mlSBUEKfIMw6YuUegkTKaZO8gEcZCQJgl+zncVKbVp6TML
	XOWiB5tcLfYfozDcWDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzui7-009IYK-07; Wed, 22 Dec 2021 06:02:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzui4-009IWx-EV
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 06:02:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 340B1B81A5F;
 Wed, 22 Dec 2021 06:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C29C36AE5;
 Wed, 22 Dec 2021 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640152961;
 bh=E6qzX9u92PoJMrIOXKLOmI6ylwQgEE5xeTtwjCDDyW0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=VE+1Z2T8DQwAP0NWGbrVBaOrqDUuHFPhYJJDyO/20rrbfBgOmlWWXhV9sjqIB7Ymq
 koqlB5u4cxyJM08LvE0dogkgwnEzBL+ElvDSYt8RSnMzGiWhA0b4lfJkyLmGSY/3gI
 5bsHJkrQ1RAl/KH0nAvtOd4INhLkWvYNQZFqLOEgF7spVoTVqjlGFrRT2Vs4mPp7Zi
 ka5dccEeQ7tew6fno+heVL/Q5jpCv5e40+v4iCCisa65k8nyIyPae2sZ0isNjobmkt
 ZVWjNyJm9OPASgnD4iETPx0qVCYs89ArPmMb9J0VNVzRl1/gxi6OKq0G2OuyaTRVRX
 zvdhWjHmA0XDg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k:  Fix napi related hang
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20200903195254.29379-1-greearb@candelatech.com>
References: <20200903195254.29379-1-greearb@candelatech.com>
To: greearb@candelatech.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ben Greear <greearb@candelatech.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164015295930.20356.10535530063354087568.kvalo@kernel.org>
Date: Wed, 22 Dec 2021 06:02:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_220244_662263_9BB6A088 
X-CRM114-Status: UNSURE (   9.20  )
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

greearb@candelatech.com wrote:

> Similar to the same bug in ath10k, a napi disable w/out it being enabled
> will hang forever.  I believe I saw this while trying rmmod after driver
> had some failure on startup.  Fix it by keeping state on whether napi is
> enabled or not.
> 
> And, remove un-used napi pointer in ath11k driver base struct.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d943fdad7589 ath11k: Fix napi related hang

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20200903195254.29379-1-greearb@candelatech.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
