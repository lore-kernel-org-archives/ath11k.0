Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF52CD68EA
	for <ath11k@archiver.kernel.org>; Tue, 10 Oct 2023 04:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEoHuzEUPT7QKFUfW+FGeX1YEcBHYsTdJTSnkMY3cEA=; b=A8/72RQTPiOL45
	91x/Y/V0WBnInxPoh6DM/Dr1Vh2NRUABg2YMTFokrxK1JL16bX47YhDonYdsFzMa0F25ynLfI1+1R
	UlP3HI3+XVfSc++38d2t+ym3ASMVZhhpqhrV4JjxoNqOUijsijjKGyl+PJk6qgFLySwVuqzEI72jo
	dsN9aZytbEE8cO6CV+1GAUWDlfESVI+dP/jDxp+pSvf9YTd2y2DsDAOqdPHfMYT+N1dsFRGm5uqZK
	cpd8jsdG3trrDOHL3ZZyNep+nbRTxwE067dAzk9697m/Uxw5Pb4DA+2CmAbhO4W4VHANLk9GoFTpI
	xX9gay/BeKxmPFFEXv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq3yu-00CICR-0T;
	Tue, 10 Oct 2023 04:04:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq3yq-00CIBm-23
	for ath11k@lists.infradead.org;
	Tue, 10 Oct 2023 04:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A2BDCE18A8;
	Tue, 10 Oct 2023 04:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B64C433C7;
	Tue, 10 Oct 2023 04:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696910661;
	bh=hPyKO5DO0BNd28hZ+zGZsyKJb/we6a5TifBIR3rPkdw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YIcBm8kOckd9fqORrM0pAPjiu66dweqjE71t6fhyWEr+WsU7voucx5uOoKLTTl3Bu
	 1gWnodbcq7HxkN6DIbc7YsCR9Jy4PJbROgn9KQAFKN5qLsApwQf8wc/G50pEJX9oPI
	 pBJ8uihsoXPflUnuXb88V6aJtK25Up9AsBG0WV3UdaMcaWNc2BvQHETOU577addU6f
	 Nkwg3zDBARzIzZdqTBC1IDcjEwv5vxDVxmMhvdzknA2yAUCJh7HBXpoOy3ZGIsnkmF
	 Y1KWkV0ui6rrO3axF33HAt8ckXdyeI8RvN1pyo6qzbImCA3Pi8OD30u9nO4DH8bc1e
	 EKjmp1x2KQUpw==
From: Kalle Valo <kvalo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: wireless: ath11k: Use
 device_get_match_data()
References: <20231009172923.2457844-11-robh@kernel.org>
Date: Tue, 10 Oct 2023 07:06:47 +0300
In-Reply-To: <20231009172923.2457844-11-robh@kernel.org> (Rob Herring's
	message of "Mon, 9 Oct 2023 12:29:06 -0500")
Message-ID: <874jizglyg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_210424_870777_2694EEBE 
X-CRM114-Status: UNSURE (   7.07  )
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

Rob Herring <robh@kernel.org> writes:

> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

ath11k patches go to ath.git tree, not next. Also the title should start
with "wifi:". No need to resend, I'll fix those during commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
