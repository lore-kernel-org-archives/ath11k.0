Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0370DC433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SJ6X9fVm4klTu2k/FPrJyoZ8SqBseSSgKxi/Ku6eFk=; b=ZVlQdwtPWnpU0z
	H4Q9FN01xNdYbYDVZ5qPlkiz06fq0vshirLnC3Z1zizw1Sg4+AlZvCeD8qnHuHT5IzSqwGdD293h1
	0w6TT7fy9Z3gFZYyfj43xYTMP1fkC7cxK1iAnnSdOrpnstiBieHvf4m971DEcvZFL1GzAkT585bch
	mVxKgZFOP+OXKOjC8zVeNQ6AIqSwSHgycLsBaxx5RA3o/5fCLuNtNTUVXzQNBzqg9TiX2zWnWK93E
	DOrxtuuelRnZfVGAE/Alj56oKo5/ybPEzuTH5RUlCIvH98zNxsfiFRzgFaM3uxdhMUr+ftEAfFDH2
	l9JwtHn3bSv4ueIcYteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntDL8-005e4u-7n; Mon, 23 May 2022 19:03:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntDL5-005e3u-Dp
 for ath11k@lists.infradead.org; Mon, 23 May 2022 19:03:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C15761208;
 Mon, 23 May 2022 19:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661A5C385A9;
 Mon, 23 May 2022 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653332612;
 bh=PwbpPaawIX6nShLpvjVPFYMb/e2PU/5rHBUKFQwfcQQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=mvt21geFFUqkirtTJT3/NF+0TPEb6xLlVDwlMfhr1IjTA6Xh4sCy4e/NXmZgXt+cS
 hM0FuXJrsIxiQC0c/Q8uXf7/39NvP+ueTbykhzJHEelu+Hbb8gIV6vvFtbuJt6kumZ
 36wCiwD7YuA6YX0TBqSw/J6A5E65niL5RxdfFH8TdBeoS1LKKqNxCdgOBQu0wUNqaM
 eCqPSQucX8DY53AIoFBCiRMibRuF+dO6dk8KM0ExnSJ0CX/cur4DquTcEAkMyn/0LS
 gVCmEGCGb5mBATsi9rX560fU9c5h1YjXKJ7ScbviYiCXm6Gqw+kN3oZamtLSzMoTc8
 bWHFuzHMc1TVQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath11k: fix IRQ affinity warning on shutdown
References: <20220523143258.24818-1-johan+linaro@kernel.org>
 <YoueemdqqRCwtk0z@hovoldconsulting.com>
Date: Mon, 23 May 2022 22:03:25 +0300
In-Reply-To: <YoueemdqqRCwtk0z@hovoldconsulting.com> (Johan Hovold's message
 of "Mon, 23 May 2022 16:47:22 +0200")
Message-ID: <87a6b8ysua.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_120335_544371_95660776 
X-CRM114-Status: GOOD (  11.79  )
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

Johan Hovold <johan@kernel.org> writes:

> On Mon, May 23, 2022 at 04:32:58PM +0200, Johan Hovold wrote:
>> Make sure to clear the IRQ affinity hint also on shutdown to avoid
>> triggering a WARN_ON_ONCE() in __free_irq() when stopping MHI while
>> using a single MSI vector.
>
> Forgot the tested-on tag, sorry.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Thanks, added in the pending branch.

>> Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>
> Let me know if I should resend.

No need, I can easily edit commit logs.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
