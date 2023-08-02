Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A93C04E69
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxRNk30zC3yiYFfpplcO8Jlr4HenSNXZc9WKgV+nqVE=; b=FZmA1S3KNXynza
	pjb/YQfW/pbMjER8fgPEcSFqZ6JsFd5cVDQtgnBgae5y2TJur28HLuvThJqGZfpCMdbRtDbwsYSi3
	Z3nFNb3JleiWdY+9PbRswjQoKL0+A7VXdDwjLeZUlUByQQhup7LqYNFaX56xJ2xh0WCQWhzbdH6Ze
	IfHZ0+KfbHTr3J7K+Zw65U1mY6uuCDLGoHSebr4U6d9Q/55K4LORcXXNwya89I8RnllTMyMw8bn6H
	EI+IV5FJ/hFHF5O52Bcru6zZbszrxQNfr0uhqSNfVSXtbE4qYkP0cVp1h2fQeL4KaQpkrvRJVcJ+o
	Uz38rUNkiz0AASDCP4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAJc-004psC-0K;
	Wed, 02 Aug 2023 11:46:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAJY-004prm-35
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 11:46:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BC1661939;
	Wed,  2 Aug 2023 11:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03809C433C7;
	Wed,  2 Aug 2023 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690976811;
	bh=5yK34ad/T3Jg2QEHhRuCarIVLq7/ED+M2l6b1OU90f0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rVYnivjT4a5jGrDPVvdoda7FiLqtamsC2oryPuAmK7tB5kQfigqzWQcEVKax9/LL0
	 /nS9t0kUudVHYHOnRFqFELol2JGTBAE2TM4bw9RDVIfq6cMMIrcPr0Ipbu/17YrkEv
	 BSxs6jjk8DLwTj5nxsh2pvQbJerMv8grHSVLRna4ULXdaHjZszGmXHj9XGKi+nLPWi
	 VWhT+2vpVGx5ByN1LhZSl1q6uLY6eH56fFFSUYBt1VpGXWW5fpFZhB6jbspYWutszT
	 U62an32WfLidcNQQHVSU6PG/t5wleAdkxinwrGxLliUidO+kh4tk4HBOYNmhnZlopx
	 NtHNri4EXDDXA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] wifi: ath11k: update regulatory rules when
 interface added
References: <20230607094810.26707-1-quic_wgong@quicinc.com>
	<20230607094810.26707-5-quic_wgong@quicinc.com>
Date: Wed, 02 Aug 2023 14:46:49 +0300
In-Reply-To: <20230607094810.26707-5-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 7 Jun 2023 05:48:09 -0400")
Message-ID: <87r0olvf86.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_044653_054671_D8A6F8A7 
X-CRM114-Status: GOOD (  10.03  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> When wlan boot up, WMI_REG_CHAN_LIST_CC_EXT_EVENTID is sent from
> firmware at an early stage, the interface mode is not decided at
> this point, then ath11k select reg rules of AP mode as default.
>
> After interface is created, it is exactly decided AP/station mode,
> then ath11k need to update reg rules to the exact one.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

What about mesh mode? The commit log mentions nothing about that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
