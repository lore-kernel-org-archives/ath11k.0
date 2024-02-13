Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCABC48260
	for <ath11k@archiver.kernel.org>; Tue, 13 Feb 2024 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDIAilYB59+yQVyo2XKtPqnznr0hKBQ9kFSAsXlOHxk=; b=elu/Bgs8DwCxGXwJwuBFmdwpF7
	XRzXlKmOQPuAfXiLanJ7O1Hcd9Tp9RbNfJFz1fhAZVUldP5i/eb2zxEFqJzXD+vVjtShRs/fKQxU2
	bhKX2U8Jk0qXqz828hlNzjQji08RrdsdPp9cjbeA/Jx5BkhayRuZzFlxL+7Kpeyvo8r0UUw4+6p6z
	vAhQYfI4LBMHLC41ziaeumbytNb6EpGhrmgNKgyWHxeZxT17JuNlB9VEqzQL8vUxeHgzmodxL5tt+
	z/5pMlLoMA5MxN3QUqUYwuj24vxkQMcXfOdNygDBSCvAeAiYbF+Cj5UbbbNSU89Ywf92kZMCPP7Ba
	Bu1mvY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvT8-00000009vFA-0ahj;
	Tue, 13 Feb 2024 16:17:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvSz-00000009vCF-14vV
	for ath11k@lists.infradead.org;
	Tue, 13 Feb 2024 16:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 442836156A;
	Tue, 13 Feb 2024 16:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D32CC433F1;
	Tue, 13 Feb 2024 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707841024;
	bh=U1hlxuuGM31EsFxR96p8z5hGYfThQsiQscHYRLeJkRM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fBDiVsLPvXkglEu72avpNr59iWLOAb3NhQ2REWCeQGlyJdrfLppRy+PqYS3GMSrVL
	 QTN4ULOuXcNhfC4qwTw0x6EvGkr45sTcreQ+fUBbUqypEaASXKeCsBAVphqXMplhmz
	 3MXoopb2hJVPvWA9BRaaa7wIeWUkIHwWowvEhEqzqG3nXE6WJUGfeKJ2ccA6hhC0TW
	 e+ZptPHuo/ob9iMi5E7uZE9YcCexyMZ5UgY5+sPOKdzyDFWkYOgTla2mv5xG/QQMe7
	 /hilfIMXPbC2YZXRoUAWsmZTTBE+lnTGzqkDKN2YPVxj3it5RobKwmpsX056ye9rVj
	 rttm8MJutH3cQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
References: <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170784102087.3076911.1922636810071020971.kvalo@kernel.org>
Date: Tue, 13 Feb 2024 16:17:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_081705_527619_EF7C6007 
X-CRM114-Status: GOOD (  10.17  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Add hardware parameter support_dual_stations to indicate
> whether 2 station interfaces are supported. For chips which
> support this feature, limit total number of AP interface and
> mesh point to 1. The max interfaces are 3 for such chips.
> 
> The chips affected are:
> 
>  QCA6390 hw2.0
>  WCN6855 hw2.0
>  WCN6855 hw2.1
> 
> Other chips are not affected.

Sorry for delay. I have now added this to the pending branch, there was some
simply conflict which 'git am -3' was able to fix on it's own:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=43b8e99e19e8126e113eb9141621cf7e4b32d4f0

> For affected chips, remove radar_detect_widths because now
> num_different_channels is set to 2. radar_detect_widths can
> be set only when num_different_channels is 1. See mac80211
> function wiphy_verify_combinations for details.

So removing radar_detect_widths means that DFS will not be supported on the
affect chips, right? I think I should add that to the commit message.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714023801.2621802-2-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


