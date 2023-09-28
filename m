Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CB5E732E2
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VP+1jKVzNTJvKRiz7sY9ta/p0gHL69TSN5mEoOXrVhc=; b=38AYDt9Yjcl+uo
	+Eis/rfbzu9NWuuITPCGr60fLyCBFqfiKg3Iecet2m1IFGOCPHE3uIhFu2QOgYlCLxhKs8pGxN42Z
	MS+Yl5brarxbdV3NZsF+AnMv5YP8oGpOhLXiDCiaIyy7bl0iB+Xgraqh1WWWEF1QT8b6AS8YMm4oY
	sE2gUErewe1Gk8ZYDxwwnr+o7mzdtQBda4ukGY/JhEsxD2hcQASs8Bp7h+OKvGkGye3YPxDeTiOcq
	gQT6wE2W39cirBt1AwrrKesaXnA1XvkQ0bZIhqkPYueUpobjtgiu3DXp/GsCTU7/FcdSLcGl1+gBO
	iklIfOrdTT1gQGKBo7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsdr-005FNe-0S;
	Thu, 28 Sep 2023 15:09:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsdo-005FKa-0x
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 15:09:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE979CE1C66;
	Thu, 28 Sep 2023 15:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EEEC433C7;
	Thu, 28 Sep 2023 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913760;
	bh=oh808DVw8eOQZT9DfCsp2ZukXXSSMvbMKkxP52OYxec=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TtMzWc5VA2OFCfw2jd7iAixAH2L4nWRdKRANRDB78+QkcS6MWknD0GnCoecy5sc0o
	 UWIdq0QPKmpBUAPtVxmc1RXA73rJwtMDpr0mctx+HRZHQavACuTZ32yWBt9urVrxH7
	 hAYOVJQlizRKkoH0aXKi2sISJjh8/5IV5g3uKpeakzJMBvhAQ90eci/C2D+lhv85Y1
	 K6N4Uiq6dBg99+hW08cgMy7wntvRIG4AEbRD0H3lFPUMlIbBXc2GZYTKYmF2lpaZxQ
	 CK18a2zda1dqscdXJFabBKU+f6nl87T2VC1xGdkQcsPkNK6Y0kB0jsqG8U9Qcxd3FG
	 CmhDck98V1ccA==
MIME-Version: 1.0
Subject: Re: [PATCH v2 wireless-next 8/9] wifi: ath11k: remove unnecessary
 (void*)
 conversions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230919045150.524304-1-yunchuan@nfschina.com>
References: <20230919045150.524304-1-yunchuan@nfschina.com>
To: Wu Yunchuan <yunchuan@nfschina.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Wu Yunchuan <yunchuan@nfschina.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591375653.3019228.16747034733497698800.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:09:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080924_560523_9CC0169B 
X-CRM114-Status: UNSURE (   5.02  )
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

Wu Yunchuan <yunchuan@nfschina.com> wrote:

> No need cast (void *) to (struct ath11k_base *),
> struct hal_rx_msdu_link *), (struct ath11k_buffer_addr *) or
> other types.
> 
> Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

87fd0602610d wifi: ath11k: remove unnecessary (void*) conversions

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230919045150.524304-1-yunchuan@nfschina.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
