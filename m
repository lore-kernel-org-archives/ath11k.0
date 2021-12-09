Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE2BC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 14:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GytblH4xBkjxfR+r+xlksdzEd4Ys+JV7acQG/6FnZQ=; b=jbWamQBhAwmKva
	PjXbINmyQaPXdDvXF+xBWofo2JRZbEmgk1F2bvinnm2OGws9Yg9gyFBo4mSh8QzZl9VYjaHoFA2cI
	7TuKqORENjRTM8SuXpmwzPSj6IbNS7dVNubM71goSa5cXDTUUn8pdblCwSVNWz5vWMviMavMKvtde
	vMCFmdLAYv3y2t+13jSG2B3gW14c081CcXgbic0wXm4dw5RPIomtUH4RaA29xJlDP3M2VgdxXT7ou
	HSV7Hg35JZ7vMbbBsQkOjWkmIMHCF0FjeSMi+OFEKiugeFg4kCrQPX36u7xt91h0zztLMSXkrblcj
	jAjxTj6rq4fdq7MEkBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKil-00GQDm-LG; Thu, 09 Dec 2021 14:48:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKih-00GQBs-Gi
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 14:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F807B824B1;
 Thu,  9 Dec 2021 14:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3942AC341C7;
 Thu,  9 Dec 2021 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639061305;
 bh=A830pBYznpcvdIJBYdEboK0dA2NmQ+lMyN/PmKYowRI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=LruwVv0MnhKuFcnA8ZQIjBNUmwCX6wlTw3EZfPE3qV/Sszrs7A6wXN/NyY4Wgr9o9
 d6v7dxMKvFFlAwZ6BsN4Lok/sbWfYt4QLaBX3q+nbJxMkSxCXpzCAsGQCQDwC0WS4W
 V4TJ0sJwLJ2uop85oYno40OU9Nh4QNwRJix5SQQpFs8ofIVJ7TDUpD+5JanzlR7r+y
 SUN7ulcF6XmCElTgob0ZbirUhlJjHguE6UDWea1ql+CWAQC14ngp2D1du9hg1Vh9Mr
 jLVkovH3TV8i8psaInxfnZlB9L6L6wnTL4QWWVeW1NAnUcJyeru3+tqxqvIxQ9LzFB
 ksuFxaCUbtU8Q==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/6] ath11k: Add basic WoW functionalities
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-2-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 16:48:18 +0200
In-Reply-To: <20211011193750.4891-2-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:45 -0400")
Message-ID: <87czm525sd.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_064827_747442_95BB26A7 
X-CRM114-Status: GOOD (  16.28  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Implement basic WoW functionalities such as magic-packet, disconnect
> and pattern. The logic is very similar to ath10k.
>
> When WoW is configured, ath11k_core_suspend and ath11k_core_resume
> are skipped as WoW configuration and hif suspend/resume are done in
> ath11k_wow_op_suspend() and ath11k_wow_op_resume().
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

[...]

>  int ath11k_core_suspend(struct ath11k_base *ab)
>  {
>  	int ret;
> +	struct ath11k *ar;
>  
>  	if (!ab->hw_params.supports_suspend)
>  		return -EOPNOTSUPP;
>  
> +	/* so far single_pdev_only chips have supports_suspend as true
> +	 * and only the first pdev is valid.
> +	 */
> +	ar = ab->pdevs[0].ar;

I'm a bit worried about this assumption, it might change in the future.
What about a helper like this to add a test for it:

static inline struct ath11k_pdev *ath11k_core_get_single_pdev()
{
        WARN_ON(!ab->hw_params.single_pdev_only);

        return ab->pdevs[0];
}

>  int ath11k_core_resume(struct ath11k_base *ab)
>  {
>  	int ret;
> +	struct ath11k *ar;
>  
>  	if (!ab->hw_params.supports_suspend)
>  		return -EOPNOTSUPP;
>  
> +	/* so far signle_pdev_only chips have supports_suspend as true
> +	 * and only the first pdev is valid.
> +	 */
> +	ar = ab->pdevs[0].ar;
> +	if (!ar || ar->state != ATH11K_STATE_OFF)
> +		return 0;

The same helper could be used here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
