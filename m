Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCAC433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahCYsAQp20JbeHiPZgyG4C3BFDelKuyycjPlENi2OZs=; b=pSqBX00HZX7qrV
	bWXInt9R48QTrIMC/5ZyUG3mokr2C1223iJshQbBZwYXFzj+JrFEbFWg6+0lDYqjBb1PbO6HGAVYy
	390P0AysVGntHd1JL8Bnb+bMrD8c0D9ufbUXmUO7XpVxIO2n4piJFLp/6a6N6cVOXNvGzc0+5UoEe
	sYtXfkE4+VkyPLuF4vX/S6FjD/VhJV9GdDPhgP4/oZNMqUSkNysjQRLH61So/Mw66ZO3C920Vbd7x
	hOk+x9RPbyFZ/DgciUbVEQDiK6CB/SnGTsAHpe+nUAsvZ/imBNaSFETHvoAFpb4XGMdYAEEX0EB/W
	NmTKgEWskJqKP4IO7O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFh1-007OEt-5H; Mon, 21 Mar 2022 10:55:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFgy-007OE2-FM
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 10:55:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0244461365;
 Mon, 21 Mar 2022 10:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A85C340F2;
 Mon, 21 Mar 2022 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647860115;
 bh=fluWyv97Mjia7EvEwEBPacFQrIdej5SkVPry09Pecl4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=O53VKDFi6qLEwLwAtrEM8JC9YYyLM1zwvzvEX+9iiEQqIreu/ev7lg6/JKRpIfzt5
 pxV/gAQnk+OOOU+VZbC8F+S7wT/BQG2QigODcC9R9DzkvjnXYJ40fxlWoaUFCi5f3W
 MCTCUORD5Mox5Oo5gPY37hqzurj/xoXHqUUTSVj9MJ/Ofa+9h5lDiU9g4W67p1Ks32
 FrqUfYFf8XSgFn/2FYHqnoWQRNMcXYPxERC6pvL9zaT5ypIWSPpWvQkXTa7leWToK1
 yzIDHl+im11VRvvrTkn1K/uXhCV8r0H705TUU/HQHlkGG2+It/6++ilgd5uLPneo7z
 Uaq39qnyzlgYw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Refactor the peer delete
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1646024079-26391-1-git-send-email-quic_periyasa@quicinc.com>
References: <1646024079-26391-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164786011242.19083.9723279065487309641.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 10:55:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_035516_593249_0739FAEF 
X-CRM114-Status: UNSURE (   7.52  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Introduce new helper function for peer delete to reuse this logic
> in all peer cleanup procedures. Found this in code review.
> Also this change is applicable for all the platform.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

997dc60f0855 ath11k: Refactor the peer delete

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1646024079-26391-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
