Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14735C4332F
	for <ath11k@archiver.kernel.org>; Fri, 15 Dec 2023 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jA7kr4VhjG0pv0BPt4d10eeQToLYzy58gQ2rjyi0wY=; b=S+t9dhrmGSwLeXCOhn3iJ+8syc
	9HLUghfYXRG5UsSi3W6c6dVEsObRuluA+pi3sm7HMp21og+yqq0SUvSnKdl7HJYf+9hClI1ixci6w
	3C72CI/pTjvTtZxj2uYggSbRcW18rjdm11OAJvn0zUL4CYsx2w15HVzYPJzCD8DRMuNOlYmhZP8mL
	HnLdiO2or8Ai0S6VZz9JSqsCXodq6WWzaC8pmbic0gjTxkXtslYnDNUTdqkSmKxYBEUJOe7c8krmG
	sIyB+utMHM4pBcTIxpZSbfVFdzXQa42+TIYhE19ZnvZRHsCZlb+Nacrubbe3PEvDp9/2cyD29K7iO
	Q/Yi9R7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAaj-003n96-1y;
	Fri, 15 Dec 2023 15:59:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAag-003n8n-1n
	for ath11k@lists.infradead.org;
	Fri, 15 Dec 2023 15:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0348CCE25DF
	for <ath11k@lists.infradead.org>; Fri, 15 Dec 2023 15:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF6EC433C8;
	Fri, 15 Dec 2023 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702655943;
	bh=GhGX6p5fY5yn/kiJvEGNAHpMjIe44xbBAOgiPpDCRdg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TRnyJeQ0lT7YobcnukUhEnB5maG3BUEl8ROLNCmhuEGPHTP0E3/a6vY3wSUffKwd6
	 m3WNlSDnpwS0CLENNjWbWK2kDWfkE0OoAeZEH0TvNGg04h4IdBkkCZGkafehIkXeDn
	 OTmjs7hDJ8xNugW4rMDwDj29EFJlcNb48N4m2p0H51CaFUZ9MFmi+6LeqHJoP74VYo
	 NT9vL3z/FT0+5kf/CXE0KdSoDNKgY1UyCLgH27jLh1gXbNkRUzyN+JHkzaMGHpa7p7
	 IeQonlmKKvWpoCRBanB7MMm+bitAMaCYH93RViT3aHvM2phb0wAjvOTO85STEfuJbm
	 0ZcOvYLwcwVuA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: workaround too long expansion sparse
 warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231214161740.1582340-1-kvalo@kernel.org>
References: <20231214161740.1582340-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170265593947.1834402.14524206742930296560.kvalo@kernel.org>
Date: Fri, 15 Dec 2023 15:59:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_075906_850304_F6D2FF35 
X-CRM114-Status: UNSURE (   6.37  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> wrote:

> In v6.7-rc1 sparse warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion
> drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion
> 
> Workaround the warnings by refactoring the code to a new function, which also
> reduces code duplication. And in the new function use max3() to make the code
> more readable.
> 
> No functional changes, compile tested only.
> 
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fd6ed1772b2c wifi: ath11k: workaround too long expansion sparse warnings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231214161740.1582340-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


