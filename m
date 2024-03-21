Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3859C54E68
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap3bhGZxiXIDqmkbnajnK9vhh4EMOtPx5lI7xq6fj9E=; b=mCvc8g6yl/1eIWDHBnbbHpooBY
	usvnst+F7J/p2caY3Qb9CUoRmx2Op1Ta2VHQCrKhFjL/OjdAjE5TFQVHnIG23R/NiEIX6KQNibbHv
	QZ5VEcKJda9COqeXiKXeceTDXcN3x16PopZFweuN0mdjv6HbWgJIBytYMsuWJcVKNDf2IQWsVOI/3
	DDWDte2rB7sStFaOsPbs9tDXuhfwZ0REMFd05UHX/N8kJ68Zl2iL59sUjw8qxdxqc/3kreVnNsbBJ
	A/+5TxdW820S+dR3HGcX1N3WClqDd4QsvENCjmAl46XiGpa5v975Ch3f9eG/5S6XOMY3lZjo2urx7
	FMz9lA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGnH-00000002qjG-2quD;
	Thu, 21 Mar 2024 11:41:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGnE-00000002qi2-3IJK
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 11:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E284ECE12AF;
	Thu, 21 Mar 2024 11:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313A7C43394;
	Thu, 21 Mar 2024 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711021266;
	bh=dhXj0sMSbf3W2sui2Z1tSKMD7c6sHo6XgzPWyJjdDzc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kAmOERZE9L8ANnSwBtQIOwO7pPaoK9/Ebm8h+6gXt/D6xUSHaB4YRJ9icVWIQKF0/
	 /mQywf9X0BJAiZEvIOyR7K0h4+0PfR75utSMBrs11aGxW6WwxmlDpu51ZxN/0HLpME
	 a5ttC1OCbTsefqYeayhf/9cET1zVOtc1PRnKV72Dp1iFXoBDKvcisAy1Y09vcyVBvN
	 9cQoFqDhWLpzZClLgnWoNMBYxZMxgcD1s4YDf3V5mMhXx8TdUkYBUfRCmRjQEAXUhv
	 UkTJkZxBvdewwneOZpUqXG7gmskjGiVb2DyF0yTCrRNzFl1hAA3uYP73AMO4JDl7ev
	 J/EmZtyyG8rGg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: remove duplicate definitions in wmi.h
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240314021654.304451-1-quic_kangyang@quicinc.com>
References: <20240314021654.304451-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171102126347.4024062.3271271155664462733.kvalo@kernel.org>
Date: Thu, 21 Mar 2024 11:41:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_044109_049126_2E7CBFC5 
X-CRM114-Status: UNSURE (   4.48  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> There are some duplicate definitions in wmi.h, remove them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3b8e475b27d7 wifi: ath11k: remove duplicate definitions in wmi.h

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240314021654.304451-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


