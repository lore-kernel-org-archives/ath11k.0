Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B617FC5475B
	for <ath11k@archiver.kernel.org>; Mon, 11 Mar 2024 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFcYXepz6KGUsLc0H//I7h81li2Pn8VxA9WDhMt1bTA=; b=qqPIvNBjUvd/k0eLuJhZeE7xH4
	2zfzWFLVLxhSg4zwwOn9a2UPKrAM9wj1q+LvYZ4dSMRYRIU2dQMFOb7lDWLK9GDoy5vRWhLsNYFyu
	0iTC1Sg+fGWsl3j7K7fiyoB1qpW7twASz/Q81ks9K32DwVsXISlLd1e+W9B09G7ZPxA906LUPHRDz
	e439a5gW1b3iiEajnWPwjkCGepALmELIEIt6aF6ih0EMQHKG931PU+ooyZftYpYG8mm9NmSBx+KmG
	SB748CkGTl8pISzvVMTQsKZV2vS+xVFk6VALOu1L995fjzxpxLVmPpysgkCbb+KXJdWYIxz/FgIno
	PlFskNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfAR-00000001WMb-1gUL;
	Mon, 11 Mar 2024 12:54:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfAO-00000001WM8-2Gtz
	for ath11k@lists.infradead.org;
	Mon, 11 Mar 2024 12:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAA1E60CFA;
	Mon, 11 Mar 2024 12:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B395C433F1;
	Mon, 11 Mar 2024 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710161647;
	bh=MmRmSMYDdBBytU1bQlovE5mbYXTLKDuy1pvF9chw3b0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CahyvtN6pceNp/tgBfiFYWCL9zQG0RRmPuFNBU77kBNdhgHT6VMtN48ndf41GTpCI
	 I+CJOpBz6oywYKYkgY7RA26N4CrzCcHbQTJYxB9oxZQnb6qObzVJ4Sq1WRL3ORdAgR
	 x+Iqx2fWvMRkcG0oldPi64ZPtgkdQ7u6xBhoOzikNe4RcBI7GKhf3MsYfKfgG1pHt3
	 d7+e4nts+lLHfmvaaEyjX+4mmZuGHXAwlW9KoaO3qPkSN/ztPGsFnsAsoCUMuylYc4
	 cyp09VeRh3oOSDIwTUWS9be8NC22VfKZX3Z3YhhMFoIes9ZoUePhn3N7nxto7hl/c1
	 YoSim1JoHKAvw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: adjust a comment to reflect reality
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZeWEqGVibkMg2APi@ns.kevlo.org>
References: <ZeWEqGVibkMg2APi@ns.kevlo.org>
To: Kevin Lo <kevlo@kevlo.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>,
 linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171016164435.1596381.210173282754394983.kvalo@kernel.org>
Date: Mon, 11 Mar 2024 12:54:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_055408_689434_3573D433 
X-CRM114-Status: UNSURE (   4.91  )
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

Kevin Lo <kevlo@kevlo.org> wrote:

> On QCA6390/QCN9074/WCN6855, MHISTATUS may still have SYSERR bit set
> after SOC_GLOBAL_RESET.
> 
> Signed-off-by: Kevin Lo <kevlo@kevlo.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a368b0a9854e wifi: ath11k: adjust a comment to reflect reality

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZeWEqGVibkMg2APi@ns.kevlo.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


