Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37108CCA481
	for <ath11k@archiver.kernel.org>; Fri,  8 Jul 2022 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTICn1TzGhOx3Q8bOQ1sN/pWjMqLjnZPJPaFoPJRwSE=; b=IFplj4lWLoywS0
	zbY18edSUuckKV4utSYeTAEGcwXYOSn9uVxqK2z/lt6qvS2HhZ74w+teaWl4fn9eH0vY+dXkH2N29
	LI+2Je50qG4OkTqghPbiURd/4f+UkSmaznSjSNaEik6ai3PQR3RoE97ZYZjfi0qh/9MDROELmkk+B
	lNThx2kkrRu7WG62EPe4axsKrTiY0tdgVcr5Pl9QKXAqCxCRy+QFxPNcJ6fcIk1VHiYdpS34E3iv2
	rSIRI6Wwcws1QgGGu/BHsxhsJFOqRndWf4/d+UBcu+ph8UwCoo8/hUMdKoiOIYGsLDdnh24mzxVNy
	3QRnn6AEILCj+GafNWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oPW-0040Ag-Kn; Fri, 08 Jul 2022 13:52:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oPT-00409h-U4
	for ath11k@lists.infradead.org; Fri, 08 Jul 2022 13:52:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 59B38B824E8;
	Fri,  8 Jul 2022 13:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C84C341C0;
	Fri,  8 Jul 2022 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657288361;
	bh=dWgUfcl57UvS0TwOtzEgblzBsozkUjqJ4CbUIdLRBdc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HoXSrgvoH8IJbmahKM7OZa/dU6/k/6AVvRp1NVATCrH5EeahyuG9m/hgQZQ8i4YaJ
	 3DNLvPqepGiYWY8jjRXRZTQ2F5R9vi++m2Yd8Pm4Jw5Yz7u5SEWT8iVwQMf/gXlcam
	 g9NdNKhNxZvqOn/F3nqQeJFOMhwqQTfT8829UTZTV/DJXziYXbakLdkwvW/eM877bx
	 SIE1ib2iLc2O8ST8pT1W33/AL+dTz5QM1TqJAt8xWI6Lo4LLBzPEIELAXZpLKgo9VI
	 8VsqYco4lGLf7BZYXmPyc9yEmq7vyrj8BQLt+7jFqPChbkzf8wabdq/w8OxSqYeUCY
	 L/5D+u46hx+sA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix typo in comments
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220704030004.16484-1-jiaming@nfschina.com>
References: <20220704030004.16484-1-jiaming@nfschina.com>
To: Zhang Jiaming <jiaming@nfschina.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, liqiong@nfschina.com, renyu@nfschina.com,
 Zhang Jiaming <jiaming@nfschina.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165728835557.16445.10510816476274107000.kvalo@kernel.org>
Date: Fri,  8 Jul 2022 13:52:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_065244_150607_1546DF6B 
X-CRM114-Status: UNSURE (   7.26  )
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

Zhang Jiaming <jiaming@nfschina.com> wrote:

> There is a typo(isn't') in comments.
> It maybe 'isn't' instead of 'isn't''.
> 
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7d1e59a35ffa ath11k: Fix typo in comments

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220704030004.16484-1-jiaming@nfschina.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
