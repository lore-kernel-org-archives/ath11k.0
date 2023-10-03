Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32EE7AD60
	for <ath11k@archiver.kernel.org>; Tue,  3 Oct 2023 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdj4eircC3ZIGSXbqwAeaAYSF0JYq9s2+sXxr0l1iiU=; b=V4utpZ2kPK4zdm
	J76n8fpcQWyKdgcN+uy6uwIlJZT4QrCnPDrfB03fLdgZhnQEsZp7zOsbnsJPlK0KQbgn0oWbA9RNo
	9gWEaZvmTzHp3ediNipGsENGJwDJ5Cg2lrBPrEYOee561Ib7EcpDuvXsrBAHkezksIJO/qFqRTivF
	5h0oHR4w9LKQ10dVPSyVjybO3GOK8w71+RFdEnWS4K6Cj6rh49cK0olaaJ3oWAQfHfXwFFMwU/WvC
	X4bK5C34nNTM+wIGsxA1NckWXkOJ4uf21b8qd9TwJiHU985JOLTicMRbyijXktoZcv7xDODpyIz4V
	+sdBKne2E3nUFxPrfbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngRQ-00Enpa-1S;
	Tue, 03 Oct 2023 14:32:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngRM-00Ennh-2x
	for ath11k@lists.infradead.org;
	Tue, 03 Oct 2023 14:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFB48CE188A;
	Tue,  3 Oct 2023 14:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09B7C433CA;
	Tue,  3 Oct 2023 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696343517;
	bh=R5knwHQOjR4bemaMdQJFUcGFqhQhw6tbKDueE1VtNyI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JQVeDhfVTRwSCypU6Hx6PhuZkTJYBvYmUWu1tDnhTTDR5G7G5xzVIcZi00rh7LpfU
	 xfLk9JO9u6uU8e051oVzbqQdp+2TYi3rSVnhiaGr4jPtvwruNCrHflev7KfNtdvqEI
	 zCbVKyPw5RZd40Z/Fkv+kJ3Ru0YlPeBgpvSWmrBRrNGS8lLWI7GMwsHJUrkU2MN+Hz
	 LHg0G5t+7l3lYX+to4DLSfmDRf4bTZV6+8d/OSJCUw7fR93NfuOrXeR9V4CH11kz4d
	 cDPPmAAevmSsHM+eLj2vJJY5UpfMu8T9Bzhvx9juHDRCmqA5v5rfDEBmJbE8f+SqUM
	 eUMoG8W1iuKRg==
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230912051857.2284-4-quic_adisi@quicinc.com>
References: <20230912051857.2284-4-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <johannes@sipsolutions.net>, "Aditya Kumar Singh" <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169634351476.120947.13624704208026863471.kvalo@kernel.org>
Date: Tue,  3 Oct 2023 14:31:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_073201_148600_D5C2598E 
X-CRM114-Status: UNSURE (   9.61  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Tx power is fetched from firmware's pdev stats. However, during active
> CAC, firmware does not fill the current Tx power and sends the max
> initialised value filled during firmware init. If host sends this power
> to user space, this is wrong since in certain situations, the Tx power
> could be greater than the max allowed by the regulatory. Hence, host
> should not be fetching the Tx power during an active CAC.
> 
> Fix this issue by returning Tx power as 0 during active CAC since it
> is known that during CAC, there will be no transmission happening.

The returning as 0 doesn't seem to match the code. Should I change the sentence to:

"Fix this issue by returning -EAGAIN error so that the user space knows there's
no value available right now."


-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230912051857.2284-4-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
