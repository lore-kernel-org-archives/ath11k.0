Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48F6C7619A
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:References:In-Reply-To:
	Message-ID:To:From:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Np+TExzs6Jy4mR6rA97VeYG7UISSaWUEdqkFWya+h0=; b=U+3FHllucfUaBc
	XOic71/qRdK+kxUFefIbQDmzgskBXljR4GKEJ9mfjeyBxfcliOlwUfpaYKH2dwaYQBJ5J4ocix9c7
	Mzw1s5KPGMC0FtOa4X+0yVEjOHbGQpWzXhQz4tozc9dQgE7zhIWLurHHUt4AUqvc4XWXITdMf+CEf
	t5QtaDVctXef3FFPLON4yF63n/oOLItnpID9pJumFtKx1fJoC+PMZQP0y6PLnUxxIq/4F0PBhS65J
	EcSajOmAdtXoW4RF4ahuprDIBJbUlkAZJJEb/6ydVXT1I6BGrXsEb0+wGKk47KU7tx9X1fNPlkBwA
	tbcCj9XgWEBZP9FFRujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyS2-003mDU-0a;
	Wed, 05 Apr 2023 08:25:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyRy-003mCM-2O
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 08:25:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD30621FB;
	Wed,  5 Apr 2023 08:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9513C433D2;
	Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680683100;
	bh=y/wyS1wybskgY3NT3qvYlhAj/QT7MG9Mf7/tNstaFbg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tEWPde6v5O5Fpb4rSsKWNahmteWdXVmcqIQnoQ4mWFU8EFg3tjnBCjePa1W7YfFW1
	 wOtRDKzzA2vvHSG3hWLcBuWa1j6twfuBpFNOpBfrHcV4poYkgnmaqFOvsfD/spUBv0
	 HC96N8MlsNxk8fVQMucVjiOXEd6c3cwfAN0A/juTC4NR7Ix4U5vCRTbymXQMnhf6mG
	 YcSEWkR+Qoj2frXvxKZz5ssWroCV0jQnIAzq3yB/ZSWCVgan22KJzIRrZQsrqyEfKU
	 ksblnsJxWJ36GRTMQsVgLwTN6BffEL4AdMMU/J4dfwpVvwWpy4RJBB/LkiHwF62Te9
	 Q4n8GwxFFFoOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B9FFC4167B;
	Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
MIME-Version: 1.0
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, linux-wireless@vger.kernel.org, 
 quic_msinada@quicinc.com, ath11k@lists.infradead.org
Message-ID: <20230405-b217299-ec3c4e9b0c8a@bugzilla.kernel.org>
In-Reply-To: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
Subject: Re: wifi: ath11k: push MU-MIMO configurations to hardware
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Wed,  5 Apr 2023 08:25:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_012502_842225_84528C73 
X-CRM114-Status: UNSURE (   4.93  )
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

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217299

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
