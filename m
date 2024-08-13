Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B91DC52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6DZBreZD9t0CvjbV4WAYjHl6q02EOaqwNbDL97dgJA=; b=WHjnv2h24868rfNzw3W+Sd32L/
	m5IPDFwDZNyRwxw2p5ieTn9AjCtX1GKDMbP5t0sHvOir4EvJf2SWwzpGeDR5JuyU7jPGZa0a5YiL1
	mO6qKFYA0zlHBdz99814KWCze3b3qAv1rMWJ/l2BBYthTCxr3TAUHa3lYQnOGtLVWzvWik5a3P1pl
	kAnaOccLCIKtbBAYSV11qjjqp/cREfNUG7YgE7B2uecfHE2LD+W1XD4dMAtrMe+1DZ4uXGZ3LK6f6
	K9ZI0LBkzm/zXk3NS1rQoBT0/mNk7hZAlPgps8yDcJA2unaUK8wi2r6X8vQE4I9I1lcgblD3aNZmO
	g9p8Hk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoC0-00000003Cq5-1bf7;
	Tue, 13 Aug 2024 09:51:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoBw-00000003Cni-2RUX;
	Tue, 13 Aug 2024 09:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD32ACE125A;
	Tue, 13 Aug 2024 09:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD36C4AF10;
	Tue, 13 Aug 2024 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723542706;
	bh=g+ist62yHFCep9m1MDDybMsQEi8sSZA4kAS3d50JRPc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ntkdBQ4DvU0W8SiG6tlz41Kq5sNp10jzwJByhi7MzQkGPsKVTCzhs+YxqgXfktWM5
	 M6VRmbJfIDGalbw6hNsWijIfaoOJAD1ClOHOcr2uNinQmmeV5OMtI0BV559H0+348y
	 Uu8aEqV2gpEzhIF9joJXlD90zUZE3NT0Qy+UvFhSe7OMItC9ba7QykayztgAyA9iPP
	 wJuZQdlHuRNbkz0BXMqkWkEQk4LBVG+JF+yDJqoRQ5m0TDfIctYnjHWn/yDP+O7fof
	 Nx8rIE8fmc9vewfEjIijwAzsBpLL1fld5zgvIutPIy8ed5PDDfc7r1JoHrls7iVqg0
	 4NMBA4Uy5KjLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-current-20240812
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <7c3b295d-3d5e-40ee-ac33-c92669f29d51@quicinc.com>
References: <7c3b295d-3d5e-40ee-ac33-c92669f29d51@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172354270280.696913.4904457179910192763.kvalo@kernel.org>
Date: Tue, 13 Aug 2024 09:51:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_025148_950273_34884A6A 
X-CRM114-Status: GOOD (  10.95  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:
> 
>   Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
> tags/ath-current-20240812
> 
> for you to fetch changes up to 38055789d15155109b41602ad719d770af507030:
> 
>   wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850
> (2024-08-05 12:28:07 +0300)
> 
> ----------------------------------------------------------------
> ath.git patch for v6.11
> 
> We have a single patch for the next 6.11-rc which introduces a
> workaround to ath12k which addresses a WCN7850 hardware issue that
> prevents proper operation with unaligned transmit buffers.
> 
> ----------------------------------------------------------------
> Baochen Qiang (1):
>       wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850
> 
>  drivers/net/wireless/ath/ath12k/dp_tx.c | 72 +++++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/hw.c    |  6 +++
>  drivers/net/wireless/ath/ath12k/hw.h    |  4 ++
>  drivers/net/wireless/ath/ath12k/mac.c   |  1 +
>  4 files changed, 83 insertions(+)

Pulled, thanks.

e37a9184f270 Merge tag 'ath-current-20240812' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/7c3b295d-3d5e-40ee-ac33-c92669f29d51@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


