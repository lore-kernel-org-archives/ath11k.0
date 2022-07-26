Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F6C433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Jul 2022 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQPpAq+j6sdOJe4gy01VHlHfpOtd2IxDKyKy/yRrrSc=; b=cWDkEkR/+Uhkmq
	RWIclDJ83lhkXpK99Q61M9X2Ajfg4jH3yzHu6rAbTo8eHF6aINj7eDbdzS8dwCSTc5q1AUc+4Ai/N
	MGZgCCGXgLUjeEpMCXAD/8m+GC2LL5Jd0V8iYYYMHaSJQS962Bb1fcqriyYbvqL+V0TulkMrw0PD3
	/+KWbOe76ZYnT4kVQoPNG0GI4+q52M3pgVBcSd9rn2+JXmPgwdgJnBuNfJAmJgvGaWhPi8YxYb39s
	Tm4jK/2kKU1biBbg38iRS3WsiUyyySJqerC+sJ3TxqWlcI21Yt0/Htm3P9VB9MwXHvWZ+ztCxh384
	0I/jl6m+uLX7GxkDpzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFbF-009tU2-VP; Tue, 26 Jul 2022 08:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFaY-009slk-Jv
	for ath11k@lists.infradead.org; Tue, 26 Jul 2022 08:06:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF245614F1;
	Tue, 26 Jul 2022 08:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5999C36AE5;
	Tue, 26 Jul 2022 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658822804;
	bh=AuSXlGXkPcDkuhy4cIR2vtHDpg/jer5nbJzf7kZ8fcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCCcqAC2M4GslsUvGs5C1x4+/2G3a3w3bEuNTAsrTHtM9sH6pN3U++bWLhLWuMidi
	 zyAWadDpmrSgL3lkX4NJrljlmQzjsXQeXb0RJ3rAOeqYMNes0+jhfEafI+YcAXukfV
	 Cb+GkC9NUF1my0VIXuNvFzzLy4cZ13h4wg8V6FlXp3svHe1+70jkp9K9CouDzXWvoE
	 82aN/TJUjy7zVRKWMxIiI5Ke8jDreKJX0p7iWbhun3lHl67Do4z9E+1wMqXTfhLOS2
	 W2LC0sskVe1kYmIVXoAMYvs01+RLxH6s7V76IQE4clsmRJLHP1AwakVhf3OnsjtjV9
	 NQF6jaLu8+bCA==
Date: Tue, 26 Jul 2022 13:36:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_hemantk@quicinc.com, loic.poulain@linaro.org,
	quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in
 mhi_irq_handler
Message-ID: <20220726080636.GE5522@workstation>
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010646_774911_272AC83A 
X-CRM114-Status: GOOD (  23.66  )
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

+ath11k, Kalle

On Fri, Jul 22, 2022 at 11:17:18AM +0800, Qiang Yu wrote:
> The irq handler for a shared IRQ ought to be prepared for running
> even now it's being freed. So let's check the pointer used by
> mhi_irq_handler to avoid null pointer access since it is probably
> released before freeing IRQ.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> v2->v3: add comments
> v1->v2: change dev_err to dev_dbg
> 
>  drivers/bus/mhi/host/main.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index f3aef77a..df0fbfe 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -430,12 +430,25 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  {
>  	struct mhi_event *mhi_event = dev;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
> -	struct mhi_event_ctxt *er_ctxt =
> -		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> +	struct mhi_event_ctxt *er_ctxt;
>  	struct mhi_ring *ev_ring = &mhi_event->ring;
> -	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
> +	dma_addr_t ptr;
>  	void *dev_rp;
>  
> +	/*
> +	 * If CONFIG_DEBUG_SHIRQ is set, the IRQ handler will get invoked during __free_irq()
> +	 * and by that time mhi_ctxt() would've freed. So check for the existence of mhi_ctxt
> +	 * before handling the IRQs.
> +	 */
> +	if (!mhi_cntrl->mhi_ctxt) {
> +		dev_dbg(&mhi_cntrl->mhi_dev->dev,
> +			"mhi_ctxt has been freed\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> +	ptr = le64_to_cpu(er_ctxt->rp);
> +
>  	if (!is_valid_ring_ptr(ev_ring, ptr)) {
>  		dev_err(&mhi_cntrl->mhi_dev->dev,
>  			"Event ring rp points outside of the event ring\n");
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
