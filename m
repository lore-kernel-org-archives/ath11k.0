Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417FDCDB47E
	for <ath11k@archiver.kernel.org>; Thu, 12 Oct 2023 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+FaPqDze+6u/iJkOyROadkseRMFyO3yyl6FQXEaVKU=; b=SPr6jdsEl/6lo1
	EgBVApt9PBnamo/F/N13nGrX7lzNpoNk+0aHx9u/6sXtEnHY4Xj4D1TDqk9zOnC0REkvTQfwct1vh
	hXl5TT0WEDh1QlEuhD5HZVKj6KBCUsysRMH8brUxgfg8QzJ3Bj42cMP+b8DsIpQGviKkOUXULZnZY
	CT/tl7uVWDTLikqulYUDCVGXHuCc/5zBgAsjc8wNM7GMUAoRWNXpOhhNypxYc2nuRQuqS+9C6FmEL
	/dJu52P9bEwDmujJIgSujcOF7U4JjjQEYsEUBtN2zh3OUOLMqDYBXiX+mokR/dRlIz7isKjzb5wz2
	/fd5nyDc7KAHjG0W4plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyEx-001Mgi-32;
	Thu, 12 Oct 2023 16:08:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyEv-001Mfn-1K
	for ath11k@lists.infradead.org;
	Thu, 12 Oct 2023 16:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2825BB82399;
	Thu, 12 Oct 2023 16:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44987C433C8;
	Thu, 12 Oct 2023 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126923;
	bh=WyU9XAjD3B9ziyuyYmadcf6A83tJF/r6+JldUx4J6k4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vJIpcU+8lFVMrB0+9NB9EOFaYhBF5ZoeaoBXMvDGYQeGcP5TY0HW5M8bZ7yvNQaQy
	 PBVoCzDMuR1LKz9Yem8VzxIIqVztMe8j8WDJ10nf5/Y7KiRt8irnmU62D51XtVXUxv
	 qvDY1izlR7shUVG9/4mps0ZL4zocF8xXrO1MjgSk3netYAsx7DoaWaiicEmQOz/nvm
	 WC4J+Y/TpsukuzpKFqUZKCb9vAm0Wb+Uop3e6FQnnvKlDKAypfdtbP+FKGmhdi3Bre
	 0uvFOiQOFxemVdHMae7Xg+K1QiQiSxBxly3lqE/MQ/fnFxlzUk9RIO0imCndGhjsQ6
	 D0E7PJ+n6ZQJw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Introduce and use ath11k_sta_to_arsta()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231009-ath11k_sta_to_arsta-v1-1-1563e3a307e8@quicinc.com>
References: <20231009-ath11k_sta_to_arsta-v1-1-1563e3a307e8@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712692043.3501995.15122826028111120811.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:08:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090845_586008_86515BF1 
X-CRM114-Status: UNSURE (   8.59  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently, the logic to return an ath11k_sta pointer, given a
> ieee80211_sta pointer, uses typecasting throughout the driver. In
> general, conversion functions are preferable to typecasting since
> using a conversion function allows the compiler to validate the types
> of both the input and output parameters.
> 
> ath11k already defines a conversion function ath11k_vif_to_arvif() for
> a similar conversion. So introduce ath11k_sta_to_arsta() for this use
> case, and convert all of the existing typecasting to use this
> function.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

10c65f97b424 wifi: ath11k: Introduce and use ath11k_sta_to_arsta()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231009-ath11k_sta_to_arsta-v1-1-1563e3a307e8@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
