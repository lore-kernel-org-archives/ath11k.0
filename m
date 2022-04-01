Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A0C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv2OfQQOeR8WU4vHTF/+qfuQYqUuHd83c/b4Fl7xVyc=; b=MnsgIc6BXXvGdY
	ewKXRdsy+f7EZ84C+niHJwYKWX1jwR4/4nq5npJTrSTiI2JfdOMItbj2gBuDv8qy30tD5WZd87pye
	z2fYxRNtEfTat9MH9HH/EomoQWYQq771+4nhNJ9Vww4FK9Ut6hMjFbswNFAbW0lH2WMbALLsqBdTv
	t/i8D2p7ATjFBUx1YqAnji6t2/2pVfMhT/vk3YgM/jk5vCb/qhOJIjyh1NBucq5LBoFjLjkwMQNzn
	T1i+RcT7o/t+InDJ7TJ/nYMy6jWa7Qt87Sc+lhbQ/sJATpXsy94cOgwCoNXSGI2uTvzcljycfgGek
	7dhf+ZORJ2DFbfKDggpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFZb-005Nq5-KE; Fri, 01 Apr 2022 11:36:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFZY-005Npl-Rs
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 11:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AE4F6177B;
 Fri,  1 Apr 2022 11:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF25C2BBE4;
 Fri,  1 Apr 2022 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648812967;
 bh=Dn8GxYYoKdiprWzq8y1aKENiOHr1hreiRmk3/mdeR4Y=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=s5csr6uaZk87fztZKT22Sb/VLfAtsgltmgrvT0saTr6IeFNe+9hNzOjbMJlwoCdVU
 e/bZB8c55E16mKtYownWFIE8nOQi4i+SwExZLUQpymX53Ckrn6syjDdFVe1lHNu30D
 0cZzwAIIFmeBAFv7bBKNAc7gPSncD4/CAj9dVfOHiJ9il3IHMCDeRC33Mf2tECaB4A
 P3EB40eAREjB//ss7Hlz5lc98WziMHc3Q4bMtKj9UidiGN/cbffuTJRReOp0msDM4u
 jFbXiZd332veK3OdFC4jZgR1PPkLuiv+eTHxhjGtx1An7W3YIN2lzMnsyPswrKPaco
 TV+cDuiJZIcfg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] ath11k: Add support for SAR
References: <20220401073142.1195018-1-quic_bqiang@quicinc.com>
Date: Fri, 01 Apr 2022 14:36:01 +0300
In-Reply-To: <20220401073142.1195018-1-quic_bqiang@quicinc.com> (Baochen
 Qiang's message of "Fri, 1 Apr 2022 15:31:42 +0800")
Message-ID: <87a6d5ujby.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_043608_988320_0C4636CE 
X-CRM114-Status: GOOD (  13.51  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> This is to add support for SAR. Currently SAR is enabled
> only for WCN6855.
>
> v3:
>  1. rebased on latest ath.git
>  2. add Wen's patch "ath11k: add support for extended wmi service bit"
>     to this patch set so that there will be no dependency for the SAR patch.
> v2:
>  1. rebased on latest ath.git
>  2. add base-commit tag.
>
> Baochen Qiang (1):
>   ath11k: Add support for SAR
>
> Wen Gong (1):
>   ath11k: add support for extended wmi service bit

From looking at the timestamps I'm guessing you are submitting each
patch in a separate git send-email call? The problem with that it breaks
threading in email clients. The preference is that all mails are
submitted in one run, like in this example all patches are in foo
directory:

git format-patch -o foo master..
git send-email foo

In other words, run git send-email only once per patchset.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
