Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF328C4828D
	for <ath11k@archiver.kernel.org>; Wed,  7 Feb 2024 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDsDKyeW/mja3Z6KGz0c5DYeWWyJqtsN77THGc4QFCw=; b=OExZCy/hj0C+GLoYVSDSZZorB7
	BbUpMINNdPmramgG2MdOzubUFqRvpRJloiXltqHi2B6X358RVKdOYv6wwqQ0otUt7KbMaowzKo3Ex
	I93tF1nDTxxW+m3hSxQdl5fIBKotvqs+39Cr0tLiay4Gu8PsKqfWOjB6M5aqwucQwEyRLvOlY3PrY
	/G4p8y6+ipe0FyI+n12xM8SoaMgl2Tfzz4wgI1o837AM0fTYW5wDYkfcahEazZw6fSrgVcwBxR33Y
	+X/ymNjynSGn2ndlTziDk/dqXA87WjQzpHt2HJPitJPbMdAQUom94z6SiZFfVF5jHOzejga2W+pW6
	j2xIru5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgEd-0000000AVVw-1EVa;
	Wed, 07 Feb 2024 11:36:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgEa-0000000AVVb-1CsR
	for ath11k@lists.infradead.org;
	Wed, 07 Feb 2024 11:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2FD061799;
	Wed,  7 Feb 2024 11:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BD9C433F1;
	Wed,  7 Feb 2024 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707305815;
	bh=2kT+IqXV0ECgRppChGjeBbVLSna37EXyo89Mgeeveg8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Xpl1Dkk4+oR2AwR2SUd8VVzjiLNfvgk/9zuw5O1FJdYaC/+5W0ALt84tuAbJeDvFU
	 sNcXNzvf/iseB2lQ+CySH9vXrpbdtxV8YElgDYkUOKf6mSY1DO/fwt9PHGaHtvcNct
	 XvXu7tgF9NYeeyArpFYZs60/yhRwZNvKoatRoMqK68t/0RzBdg44IXPcKNOoh+jK+s
	 QmdOt8MDGFRP3cJkVrxCIVCke7T+lROeuM73FNPCVPaR7sP9iHs/0uTtVvvikF6tQO
	 dMV5J8AaroVLTGuViLNV0Ah8IWVb2ZtFsXEg1rf6MzEvOk9x1rdXrMgTV2HELYGWJS
	 xK86dfKHmKLIg==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: ath11k@lists.infradead.org
Subject: Re: [bug report] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
References: <14df3ef0-b86a-474e-b0b7-92f9bf434410@moroto.mountain>
Date: Wed, 07 Feb 2024 13:36:53 +0200
In-Reply-To: <14df3ef0-b86a-474e-b0b7-92f9bf434410@moroto.mountain> (Dan
	Carpenter's message of "Wed, 7 Feb 2024 12:52:02 +0300")
Message-ID: <875xz0qze2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_033656_389981_5CEE4346 
X-CRM114-Status: UNSURE (   5.74  )
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

Dan Carpenter <dan.carpenter@linaro.org> writes:

> The patch 92425f788fee: "wifi: ath11k: fill parameters for vdev set
> tpc power WMI command" from Jan 11, 2024 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/net/wireless/ath/ath11k/mac.c:7751 ath11k_mac_fill_reg_tpc_info()
> 	error: uninitialized symbol 'eirp_power'.

Should be fixed by the commit below, right?

https://git.kernel.org/kvalo/ath/c/b82fb7ef690b

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

