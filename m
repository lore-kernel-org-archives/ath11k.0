Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76657C27C65
	for <ath11k@archiver.kernel.org>; Tue, 11 Jun 2024 18:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOzPA6N1aZZfTAt4pcXIYkrSOn/jNPfKaBeVytXsrHY=; b=B4q6sUCuTYUJmBpXLIa+jUpleG
	TLxgklGzCcrXdOhA9mrbVLg9iyAtQwsRJpw5vO5+bB60tbJY+8sZBtc5N2tMq3E3WqUqoQOAfl9q2
	eBB1zAe8RXb0B8xvY+gFfFLThwLr/PP3VstcV1z7Ixfa2dYLryXrg+rIye2X9MGiUgHX9t72WGmpc
	9if+8uAUN9/3A/gq/+cwZzhA3lf5apTmDWEmxA4mOW2z/b/C6GU795eHu0jnoJVoKqkPZNDudPFcG
	zeLvRDqH6l+nlgjY0RxXoOGcWM7UOKVat/CK072FQYaYZRrVljqCYKPbt3jJso+DS9QELhCjxDUEU
	Nr4dcM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Qt-00000009sWw-0no0;
	Tue, 11 Jun 2024 18:41:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Qp-00000009sW1-2LXz
	for ath11k@lists.infradead.org;
	Tue, 11 Jun 2024 18:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76BAACE1D01;
	Tue, 11 Jun 2024 18:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE79C2BD10;
	Tue, 11 Jun 2024 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718131276;
	bh=P0+kbGBViPVlXWHNujnSAalb1rK+KEqJYTwnL+IIEfQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FOrgfbbGeCvpAnkAhL/PCPu/D+j2PnA/UhagF/dWDyEsiNt6Hs295i2fBilB8jTlT
	 rt+TFahXScTYiZKR9BBiQal7BvBkIXpTsWAKUv+yXRIgTDz5Zxk9POqcL+/iugn+9g
	 r/QBlzWgNcf/HG+Z8UyI2kWX9yCDd6my8FWB7/DntU+hWi7spuFWvk8413cC5J+IIK
	 YH/PySHue4hED+9UF4f7nSjJFOHfQUaRUYAFFNCs2J5ElpMlzsHXmTltfjUAroNPgB
	 7Cuvt9siTM3am8CMU0eCE5nsuqNuXPEkftfGkyXHeaZFiWT48MusSGf+lypHRNZXFb
	 /WcMP62Jflfcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] wifi: ath11k: use 'time_left' variable with
 wait_event_timeout()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240603091541.8367-2-wsa+renesas@sang-engineering.com>
References: <20240603091541.8367-2-wsa+renesas@sang-engineering.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813127345.3564613.1259429079165785453.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:41:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_114119_817622_7A0CB353 
X-CRM114-Status: UNSURE (   8.04  )
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

Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_event_timeout() causing patterns like:
> 
>         timeout = wait_event_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

65a8368bf34e wifi: ath11k: use 'time_left' variable with wait_event_timeout()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240603091541.8367-2-wsa+renesas@sang-engineering.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


