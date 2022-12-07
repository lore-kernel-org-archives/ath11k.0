Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE58C352A1
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al9FWuC/BAwvM+yAbrw16G9LSDqZDGK98ezGqgyMZMk=; b=OJqADzTgGFQpu2
	ISZZFb2LA5iehinZhns8mYHQvxZ7dOxQETsSewuVQIMPmfMnatXD7hgvmMYlUQa00iVKOB1X0leyf
	j5X5TAOytr1KKx4Xq2u5F2+cPiTLheyq0z74u+VGZRZjpf6E1jQ92PlbkK1RJGoJnDZBwEJ/rwm7X
	qjvNf2NzhYwAut81L+f+wjvvPDJQTTToJI/H3ZGfDNYFPvAkDnX9JN9Y/vY4N96fsuciPe5QmAzMI
	BJ9u8SLSMHCOvbB6wyENNwkj+iR84uWjcv++0WZs8TaT/JxemwQsKwWQTlC+pxsHesayKjGMYe+Nm
	IahzETnRtCwFZt3wdamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yFj-007OFC-Mb; Wed, 07 Dec 2022 17:30:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yFg-007OEW-RN
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 17:30:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 409F561B45;
	Wed,  7 Dec 2022 17:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4930C433C1;
	Wed,  7 Dec 2022 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670434235;
	bh=30i1vXqRb3fMeCdIQOP0sPfJGVmd4GE1adx1PgZVO/s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=iQX7AiLw9v9RLbs4vo2ck/Iu5vCrtRiV8NS1Ilt8Ei9zPMslNDkCxditq5nGKeLCE
	 O5WeZHJ5XMlJQ1UuF1z9fAMV9loazCwDy/0jCvoWCLhKaOOA2qtJzQm3152u7EiC1R
	 ukXYpViDd19MQbKJJzjDboEW7PY51mTQ1NFIalnBzNtYPU7Qh294eXLbCzx9ZUMqXJ
	 OGijK9BwEvDPZkXfe17YldjKpD7X6qgrRv54aA9cmpx1/iS1bgfI+21TRtC64JD3YJ
	 dGNag5BYmwld2n7oBLoHifVVMcnZfojwt1za/zgs5ZTsLQCaiSt9X8SMi1EXI4AGkj
	 qLEPoT6hw5XHA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix scan request param frame size warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221205192125.13533-1-quic_kathirve@quicinc.com>
References: <20221205192125.13533-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167043423029.3611.17612431328299564721.kvalo@kernel.org>
Date: Wed,  7 Dec 2022 17:30:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_093036_956441_4FA92C93 
X-CRM114-Status: UNSURE (   8.47  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> Following warning was observed
> 
> drivers/net/wireless/ath/ath11k/mac.c:2351:1: warning: the frame
> size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> A local variable is declared with a size larger than 1024 bytes
> this causing a compilation warning. Change the local variable to
> heap memory to fix the warning.
> 
> Tested-on: IPQ8074 AHB WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1 v2
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

"wifi:" prefix missing, I added that in the pending branch.

Also fixed one warning:

drivers/net/wireless/ath/ath11k/mac.c:3677: Alignment should match open parenthesis

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221205192125.13533-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
