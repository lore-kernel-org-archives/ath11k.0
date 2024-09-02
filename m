Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16F2CA0ED3
	for <ath11k@archiver.kernel.org>; Mon,  2 Sep 2024 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKEtuoX614z7uUf53MPQJClsLkjyP0yPmXAS3AEOsZQ=; b=3kPvhHeadfheAXe2tQQ3Y+Gxmz
	Ocp2UqGhIjYW70vMljsdCj6TRCyDYvYMb9BeSmNuFjvyOLUGhz3AE8Wn82P5nDypsDgQcf0EHClFV
	NILbng53B8P4F+/sM8x7Fger1nPrVJdaNZC+M992DYoK0dSIbdCntKZLrM8rNYKxEQc7mqO1EsPV9
	Mqwg7/pgl4vn3YQdH+sGjv274+I1gjRWIu9uGeG1DKk+7+xA89TRGIwRZPZcVAxCRepo9Y7IhcqmV
	rnVe3/sIFFowlkCDIFkoWf1f9e9b2olWdEgz6oUeqfWL3u6liAXf+ccQ7NjOPMgaPJx5De/BWkpTZ
	3ZtPlpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9td-0000000F1CO-1zDz;
	Mon, 02 Sep 2024 16:27:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9ta-0000000F1C3-31kM
	for ath11k@lists.infradead.org;
	Mon, 02 Sep 2024 16:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B5885C589D;
	Mon,  2 Sep 2024 16:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8128CC4CEC2;
	Mon,  2 Sep 2024 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725294433;
	bh=XZwIoL+8dk+OXHwqAwWkDKH34tbPcv9dY3lLJqneptE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DBeSTAKB4OI8SeN5amSno7wQkFMUhma6f6K6p2pG2fDjCuph1aVJs2Y7qX2neRYv5
	 b04oScB6swLYFG9t7gg920BhbjvE/ng9HzkRFNYXgq5B4avkO1pNaDsMKPZQvRONIx
	 vLMXoqaQ41xxGTgrGUdG2BUXoxKL1lQ8UgDv8OP3GxnFLftYLciPELVL24/vnjUJDX
	 BTmnnNNdsUn/1SWdIDA/A46Uj+PPo2Om5/Xdm6v040CxyFKziY9zCvieGXBEPP30D5
	 +F8rDrG+YddVQky5aXgFQEt8u++tdrAvg3JloFP+wcHIjxskh+tHRcOX0jlo9E4a5V
	 GVuksHBB7wlww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH ath-current 1/2] Revert "wifi: ath11k: restore country
 code
 during resume"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240830073420.5790-2-quic_bqiang@quicinc.com>
References: <20240830073420.5790-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172529443048.651366.12916100512214985821.kvalo@kernel.org>
Date: Mon,  2 Sep 2024 16:27:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_092714_846186_9206A482 
X-CRM114-Status: UNSURE (   7.19  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> This reverts commit 7f0343b7b8710436c1e6355c71782d32ada47e0c.
> 
> We are going to revert commit 166a490f59ac ("wifi: ath11k: support hibernation"), on
> which this commit depends. With that commit reverted, this one is not needed any
> more, so revert this commit first.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

d3e154d7776b Revert "wifi: ath11k: restore country code during resume"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240830073420.5790-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


