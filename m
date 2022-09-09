Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C91ECAAD3
	for <ath11k@archiver.kernel.org>; Fri,  9 Sep 2022 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtZhqXM7EPIpiRsu0YqQ2dNYb93yqZrQoeLZIcg0t+s=; b=V2i/otKVvCAiZm
	i9mqnsggdC3VgzCdaR2zTHXU+3liToq1/g+I52egIqeN3zY7/RhMDYNLcGlRZZ017x51FMn8iEvM2
	CoNmQQHPNpnNjg+Si2umQffClS4OfY4ZdueBui8c7xbMZIPsP0jAntJeN30nJ1GBN6ggtwKnPqBUy
	SZzxoOyTHS6mFZS8uJ987H+1sjzAojtTosSp8bp3HiWILDHETV5KmWquOjxpJMrpnNmktyDkYQKjk
	gq0sqGCqi6xrtcHHzPjtUf+o5KXJcXqwRycR37L/Loy4XwXZbeQDYk6UoBbyGeXmP0aSlDy3EIwdN
	PyVefx5cuA1TgdiP/FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbTI-00FRuA-Dm; Fri, 09 Sep 2022 10:42:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbTF-00FRtG-PP
	for ath11k@lists.infradead.org; Fri, 09 Sep 2022 10:42:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57D4E61F97;
	Fri,  9 Sep 2022 10:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE5FC433D6;
	Fri,  9 Sep 2022 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662720168;
	bh=zbx7riJv2O0vvgZWYPqfC9CvkWPpl/kRd6ZjbdCWGpM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=D0Azh37H1745UDN41+qRHwE/XaomXOKnxtM4fKbu1Sh/EcE99cPyan0h55R1VbV19
	 G9p0761sNTFxMcMmOtjHh/DAubG2WjDVJoQLp9BhcJ6jPF+OW8/xIiR0h/u+zVbCZX
	 8Sj29FDUXIcf1byRbHOI0Ii3wgos4EIVzJ10ZyizFtLaju204rc6RW6PWSG3RW1dEu
	 J9DptGakKG/EKwv+Tr1yRtgrrwMpOfMGcEKq7bocs7SkAaFH9C8Yg+n9OIW06T6ibv
	 nuSJHyvk5Vu72arStcx19yacy/D3E3oiU2FDIehVwDlLWHSDgUmIRvZirk+UWPp/Ff
	 QlTyK7bPl8QdA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] wifi: ath11k: Split PCI write/read functions
References: <20220802075533.1744-1-quic_bqiang@quicinc.com>
	<20220802075533.1744-2-quic_bqiang@quicinc.com>
Date: Fri, 09 Sep 2022 13:42:45 +0300
In-Reply-To: <20220802075533.1744-2-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 2 Aug 2022 15:55:32 +0800")
Message-ID: <87k06c96ca.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_034249_891209_1D321AFE 
X-CRM114-Status: GOOD (  17.67  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> ath11k_pcic_write32/read32 tries to do wake up before doing actual
> write/read work, which means each time a u32 is written/read, wake
> up is performed. This is not necessary in case where we do a
> large amount of write/read, because only one time of wake up is needed.
> So split each one into two parts, the first part does wake up and
> release, and the second one does actual write/read work.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> v2:
>   1: rebased on latest ath.git
>
>  drivers/net/wireless/ath/ath11k/pcic.c | 50 ++++++++++++++++----------
>  1 file changed, 32 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
> index 1adf20ebef27..15ca069e501f 100644
> --- a/drivers/net/wireless/ath/ath11k/pcic.c
> +++ b/drivers/net/wireless/ath/ath11k/pcic.c
> @@ -140,49 +140,63 @@ int ath11k_pcic_init_msi_config(struct ath11k_base *ab)
>  }
>  EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
>  
> +static void ath11k_pcic_do_write32(struct ath11k_base *ab, u32 offset, u32 value)

In the pending branch I renamed this __ath11k_pcic_write32(). I find
that more readable than using the word "do" in the middle.

> +static u32 ath11k_pcic_do_read32(struct ath11k_base *ab, u32 offset)

And this to __ath11k_pcic_do_read32().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
