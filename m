Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F1EC6FD18
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wugBQlhClYluphwklzhtwfhmTm4ymwf9a3kjen/oWig=; b=04tGZriKFNNMZl
	nSMk1C/7KeWmyPc1/Pzwx1d15H3YazKFZJJAf5FSs00iUnceEiPOgzAF7lp3tcQrdfhOE+SRY9LMV
	c4et6Ny7p/5x4ynFKlmKvPur461FA+Q0fA78Q4KVMcMmMMmD8+4e0OJyq1tBv3RQXiGcZkKf/U9At
	Ypy2bnJcatrLz4RU/rxJIxbjlhejQFz9XlJHbcJzjzLI1/4MBliZ9bg3ajmTZ7OZV+O2YjMN9T4bo
	PBBLwj96zGbde7sR7F+ukqjCcLYZ3P3gmBQQP1XZ2IORov4U30JRsRAaFMCv6LJWukD/RAq+pE1jl
	9c3Z+84Kbb1uLt3/MA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8mq-005fa4-2Q;
	Wed, 19 Apr 2023 14:27:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8mn-005fZQ-1K
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 14:27:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C164963771;
	Wed, 19 Apr 2023 14:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F01C433EF;
	Wed, 19 Apr 2023 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914472;
	bh=gWx+QASjkKFafxQB5xDEyDa4ePFAJmevoPkXkrErHlE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sL16OfcCytZToDgGENVBX+ixCL2tBubPsvP2YOacxBAdZrT/VEtcwt15hNQLC43Um
	 zRBvdSzoDb0lqOf1Iu7VpjKbvIv8hrJX2+xfPoXt1hr8QjUYT5CV0bCTSqW0KgGi9t
	 zXjr56llaXmT+EnE8eePFym0KnqlPrAzep8LpFMb+wW7VVdFusoYTk5iQdvXv+kQZP
	 bkZuuIb5VK3B1DvBAP0fqJR67oQ7W9Gvb719jShzE2px3TMmHXj4xa/FUCHBwCX9I+
	 CYF3eIsHRmAQixr6OZXmfdwfR5bCDWoneb2XSuchI6rSwHlrjFOcL8qG4p8A2YbNsr
	 cLeyGHFbTlZ0g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Remove disabling of 80+80 and 160 MHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1681762947-13882-1-git-send-email-quic_msinada@quicinc.com>
References: <1681762947-13882-1-git-send-email-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>,
 P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168191446902.4082.1552676324698320209.kvalo@kernel.org>
Date: Wed, 19 Apr 2023 14:27:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072753_490097_FD3132D1 
X-CRM114-Status: UNSURE (   8.85  )
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

Muna Sinada <quic_msinada@quicinc.com> wrote:

> This is a regression fix for 80+80 and 160 MHz support bits being
> cleared, therefore not adverised. Remove disable of 80+80 and 160 MHz
> capability flags and assign valid center frequency 2 similar to
> VHT80_80.
> 
> Fixes: 38dfe775d0ab ("wifi: ath11k: push MU-MIMO params from hostapd to hardware")
> Reported-by: Robert Marko <robert.marko@sartura.hr>
> Tested-by: Robert Marko <robert.marko@sartura.hr> # IPQ8074 WLAN.HK.2.9.0.1-01385-QCAHKSWPL_SILICONZ-1
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217299
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b100722a777f wifi: ath11k: Remove disabling of 80+80 and 160 MHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1681762947-13882-1-git-send-email-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
