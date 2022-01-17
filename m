Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1BC433F5
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoH5e39nY/1sUhwfrESYa1cTzhENkOHt1Z5Q8MiI5Ys=; b=lH5q7Ys/1BrLqY
	BI/GMaJxkMWwfwKioaN5npewk0NbTM6RpDtn/tsqkXr+6D0DrW1sQFqR1S3JIJ/Kxtudxw1uH7/Er
	7kNjvaUeWpHnFMT3EE2qwCJvXFAIYxLytemmGOzZRlkVMeZlTK/ToML99/iW7T5lfAjhK1fv3t+HA
	mxCRNxBRu6BLRfWqf/CWqRsnccsmySVEfEjQnYqbQV+pcm3VYBl0J5oQruBrjRnhjAA7SsiowvsOA
	l6cdSmPHwE/vpM0BbhjD6kYjf0DxCESDCwAMofShAVCwNnq3fy8uc2gcAQIG+uZ7geWofcHKUpd8G
	oevSCq/8XrscZ4ueT7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9RGY-00EvJ5-So; Mon, 17 Jan 2022 12:37:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RGV-00EvIU-G2
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 12:37:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 368A7B80E0B;
 Mon, 17 Jan 2022 12:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA05C36AE3;
 Mon, 17 Jan 2022 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642423057;
 bh=P/4ypUvSVoNhfvCVlcs6PIj/nztszYxr3tJXDpKx0AQ=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=kOv0sLKAWJuO36BaFW/clbJNKuy30V1303of+GpbLMpl4xrne2D+RS9TMJ98EtdSQ
 XIZFubm9zUuTnAPAttdoyJP1qu6XarL8Hr+gL9D9+wDt/WAjcMh9LGci5/m8XBUDrg
 zmFfsvkKG3gXwD+cm5SEmELvMby/J+CMj1l9Hg9fGZSP9aC2iEvV40pG25BU66kWao
 ryG8X2GUhMTKAPONFhpME76TTxQRcjkbilByqrIFFWwl/rHt/JyBgOfCFMfOCarcPD
 jdj8PkRoQr4/gIHeu4TWi6ik4WvwyLeOQjR/sETSJqgwjaKGE08qlUR4QK+lAljQOk
 +40GomMpyOnpQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix error code in
 ath11k_qmi_assign_target_mem_chunk()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220111071445.GA11243@kili>
References: <20220111071445.GA11243@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242305424.27899.2840074267453556270.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 12:37:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_043739_701794_7F187169 
X-CRM114-Status: UNSURE (   8.77  )
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

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "ret" vairable is not set at this point.  It could be uninitialized
> or zero.  The correct thing to return is -ENODEV.
> 
> Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c9b41832dc08 ath11k: fix error code in ath11k_qmi_assign_target_mem_chunk()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220111071445.GA11243@kili/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
