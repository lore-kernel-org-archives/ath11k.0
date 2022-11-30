Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0598BC433FE
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv6h6h/rk9kUuA0seUU3TzSdmpicoqt1v24HPdoLXJQ=; b=qlsurRuEU30ze3
	kPfpou6Pkzz0NctfN4CWGuQZvz+P49UpwAb0CMiF8fvunXbHj5ji3coh9Q28xZp0/ZMp/aRulb7wZ
	Kgl/5n8+rDUtI2WJqpkqjquTK++WXIq/iqLpGEkaQ7CNQzemDgQfeg4sAuKkj76abhsRu79Ys4vdr
	DA1mtLsNSwvCYv8oa+zljJ1pvWwNfjU+KMDBKhtbd+ZLm80wvDV8a8L/Vks4zSdCaAmJKgn7LQtkB
	UN6qCKqY19xKUKO2ReeARSrbWGemrbF3zjYn3MdKATq9DvUswKLUBzGnjhAG6dTem7CBiEnMIc0Ac
	OFRaOBqi9lZ+g1ewj21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N0X-00GQrL-7x; Wed, 30 Nov 2022 13:20:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MtD-00GNFT-PN
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 13:12:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49E7261B2A;
	Wed, 30 Nov 2022 13:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22E3C433C1;
	Wed, 30 Nov 2022 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669813958;
	bh=ZWr9+FAS57bf6z+vP2CjDIujiiH62Huf8CkIkmu3W9M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bAVcbl+z0vk5KRpXDEbnZDykL57W2UPuXXt+9HJyaS3rwqSDgBR4drbI/jAK4syur
	 jcC43u3+C+RdOkE9JDHAhvylFEE9ty7KozKVMxZ2nIwBj76lMbSTGLshI5qzNPWbNR
	 qVFKxPJkx7a0kEXzc7KeyDR6+C/BCb9qRlP8+uEI3iHtkXzqLtJIY6mqUXLYh/QPN7
	 HvQEXM1SjACAg9t4qCgfOfO1KLadR/V694xONFe/DRnrLwpItGBpBSC5k42xX9BtJA
	 m1jPzX3nA6yokZjNCKT674ZMtNK4wD+g5uJAgk7NBsKLY/PhBYMJMX8hQNYHQq0fgO
	 IpG+ytCKZteZQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: ath11k vs ar_qrtr?
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
	<20221130125236.GA865@lst.de>
Date: Wed, 30 Nov 2022 15:12:32 +0200
In-Reply-To: <20221130125236.GA865@lst.de> (Christoph Hellwig's message of
	"Wed, 30 Nov 2022 13:52:36 +0100")
Message-ID: <87k03c4mdb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_051239_895463_E9737B58 
X-CRM114-Status: GOOD (  16.55  )
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

+ linux-wireless

Christoph Hellwig <hch@lst.de> writes:

> On Wed, Nov 30, 2022 at 02:42:41PM +0200, Kalle Valo wrote:
>> Sorry, not following you here. Are you saying that "select QRTR" is not
>> enough and we should add something more?
>
> Yes, there is no runtime dependency right now. Something like using
> MODULE_SOFTDEP should solve this. Untested for now, but I can send a
> formal one after I make it past the initial installation:

Heh, I'm learning something new here. But I wonder why nobody else has
seen this?

If you submit a patch, please remember to CC linux-wireless so that our
patchwork sees it:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches

> diff --git a/drivers/net/wireless/ath/ath11k/core.c
> b/drivers/net/wireless/ath/ath11k/core.c
> index b99180bc81723b..72d043fc6b7c2c 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1945,3 +1945,5 @@ EXPORT_SYMBOL(ath11k_core_alloc);
>  
>  MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
>  MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_SOFTDEP("pre: qrtr");
> +MODULE_SOFTDEP("pre: qrtr-mhi");

Would it be better to have these in one line?

MODULE_SOFTDEP("pre: qrtr qrtr-mhi");

At least the documentation seems to suggest that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
