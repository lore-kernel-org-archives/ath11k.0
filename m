Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1FC4167D
	for <ath11k@archiver.kernel.org>; Wed, 13 Dec 2023 05:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMozYmyrpBDcUVp53VLKws+VAK5D8XirLcSDIRN90D8=; b=FvVELdREGVsXh2qQZNqKy5ZoTh
	yHKnoxTUEHYTLKvvVOYx1Ii7jAHejMCSkv/N1Uj2v6Eve9VeEq2w7o1UBQ6xbRy6sZMgHLF5QiPnc
	4KxtMnXMP9OysCPxHtlFFLf4UgIf2+1/K8sPCayuLfnX1a/QGqaR41Z/GYUVxWsWEgAWljSAVMG8T
	hqn1HO1ZeDeZuyVKMrbuCGWgv6XPjACEdpaiYNOBQ1cHgXEYPQ2L9qpfQO2C67bMyrElQn6qbZX/Q
	SBp+XJKjnpqBa82irmTMhaVwldYsSkef56FEHL2w0OUodLtty+qheGkc0jln3nc2f0ScDGyU4gbGJ
	Z8APNdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDHcN-00DdwG-17;
	Wed, 13 Dec 2023 05:17:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDHcK-00Ddvr-28
	for ath11k@lists.infradead.org;
	Wed, 13 Dec 2023 05:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96339619AB;
	Wed, 13 Dec 2023 05:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46DFC433C8;
	Wed, 13 Dec 2023 05:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702444616;
	bh=umo1bSRQLkZg65zD+C29cx9zEDQlgLLOekKyV4KKBLk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ULfCzkLW6EKmMZhInPWUOpgHFTbZI/tU26E5hGto55mxAzPJkAYGNBuwa2ftNSpZw
	 L60mGMycYeF5z35b4fjkNC91eoVdzlVmFQqyC+2uTpPRjA8MZhdLPi3js5sNNmpDUS
	 hNeGKZpk3pLAfOHYL6gBXSLipFNE8wVAczBnoN7/XhkufuEcAkq5rr/7OWTeYjCUZ2
	 pVdQgbUlRTnyZscj8tccogzyxbRcAZGi+lk/Vy7BnNL1pIzlyVLKh3X6CECEsRDS4C
	 MlgEfyYbTxMEExxxkh8SupPlsXfthd0SU7g/qP3DMxsRUGqXxFyh8ruIYzrKgzJ092
	 dgsk9I7nA30Ww==
From: Kalle Valo <kvalo@kernel.org>
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
Date: Wed, 13 Dec 2023 07:16:53 +0200
In-Reply-To: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
	(Yaroslav Isakov's message of "Tue, 12 Dec 2023 19:15:25 +0100")
Message-ID: <87a5qeof5m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_211708_758742_E5BA1FCF 
X-CRM114-Status: UNSURE (   7.88  )
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

Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:

> Hello! I found that my new laptop, Thinkpad T14 Gen 4 AMD, cannot use
> 80Mhz for rx - even though AP supports 80mhz, and tx shows full 80Mhz.
> I reported it as https://bugzilla.kernel.org/show_bug.cgi?id=218246,
> with all the details, but, there is no comments in it, so, sending it
> for visibility.

A team in Qualcomm said that they are looking at this. Do you know if
this happens also with the stock firmware or is this openwrt specific?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

