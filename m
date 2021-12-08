Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA34C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 15:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjYZ3nqoLuqag39WyEcS2esxcZgGOeEI5XrQRCOjzPU=; b=iHAZ39YgNANyQg
	rWXCZogGg2fFSiK4ZHQKcS5vP9CWKhW8UU9jfDtSN3UcBn6/H/Psj0O9G2rAbrR6TGz5ZVnJF63oO
	gzuShcJ+aC/52XhaDSA1AGNSI23jC75I9I0AmbERVhdkKteQnL+OAK64RiKlQsGI5nrqMTPDYK9Tv
	OIo7y1NzqNy6H+ehj94rBZhFHXej9hPaRq7nZqULDCULCSgMQ9BEfwlBFz3O7lT+On9264f3/TbF3
	s4duhtM+StG2QWKk/0y8rVgqNs5mnof13U9Ymh55ZznJoiwQYXswsgwnSMDXXyqZEls0b27iJEu91
	s7V96hjs8wQjMqIw6PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muz68-00DLNN-MR; Wed, 08 Dec 2021 15:43:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muz65-00DLLw-Q7
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 15:43:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7407DB8169E;
 Wed,  8 Dec 2021 15:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD197C00446;
 Wed,  8 Dec 2021 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638978187;
 bh=usELxSoclQFiIbGRgPMrNIlE84VvZ9zfgJx6uERqWiY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=J1XCoAYk+CH8U240OlRBxy9L4fIRl2IyDfIvTiSB/Lr8YzmTG5UTUwqE5mR+2nytd
 kts4iRrNPY95JDPZDuVsbk0+y/JaRPbFRb8YP/9gKXKVCumG6vFLhRCljyO5X8iteB
 HSl+tBKE5ZCUuRA+PiyTLXzgD3qPLgUgnYoKkYU3RGKlBajCSDv+c0iZplPgfWtiZa
 6Cz/jE83tPPyVkRWEPK4V1qr51VcE1p1eCMrrvavmshnzyiwMc1WvKL+dPpd3UTTvO
 fqJ+fEuREXqi0/PMblsLI+V2bKPKfzKc22XGuixtzpAhf/aWdHvxdcJMUkaD+S2eJG
 lqrg92aBqucxQ==
MIME-Version: 1.0
Subject: Re: [PATCH V6 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20210408011225.1989-2-alokad@codeaurora.org>
References: <20210408011225.1989-2-alokad@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, John Crispin <john@phrozen.org>,
 Aloka Dixit <alokad@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163897818415.29276.10960298071615382240.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 15:43:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_074310_043211_90C7C9F7 
X-CRM114-Status: UNSURE (   6.95  )
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

Aloka Dixit <alokad@codeaurora.org> wrote:

> From: John Crispin <john@phrozen.org>
> 
> These calls are used for debugging and will be required for WFA
> certification tests.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00680-QCAHKSWPL_SILICONZ-1
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

Doesn't apply anymore, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:566
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:128
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

12189609 [V6,1/2] ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
12189611 [V6,2/2] ath11k: add debugfs for TWT debug calls

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210408011225.1989-2-alokad@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
